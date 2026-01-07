# Research: Interoperability & The "SQL vs File" Dilemma

## 1. The Core Question

**Should `finance-vault` be a File-System App or a Database App?**
The user response is: **Both.** Or at least, it should allow the choice.

## 2. Strategy: Hexagonal Architecture (Ports & Adapters)

To ensure `finance-vault` is not "hard-coded" to files, we must adopt a strict **Hexagonal Architecture**.

### The Layers

1. **Domain (Core):**
    * Pure Go Structs: `Transaction`, `Investment`, `Ledger`.
    * Business Logic: "Tax Calculation", "Reconciliation Rules".
    * *Rule:* Knows NOTHING about Files, Git, or SQL.

2. **Ports (Interfaces):**
    * Defines *how* the Core talks to the world.
    * `type Repository interface { Save(t Transaction) error; FindByDate(...) }`

3. **Adapters (The Implementation):**
    * **Loam Adapter (Primary):** Implements `Repository`. Serializes structs to YAML. Saves to Loam (Git/FS).
    * **SQL Adapter (Future):** Implements `Repository`. Maps structs to Rows. Saves to Postgres/SQLite.

## 3. Loam's Role: Lib vs Framework

**Question:** Should Loam support SQL?
**Analysis:**

* **Loam's Strength:** Git semantics (Branching, History, Merging).
* **SQL's Strength:** Relational Integrity, Complex Queries, Concurrency.

If we force Loam to support SQL, we face the "Impedance Mismatch":

* *Branching in SQL:* Very hard. Requires `chain_id` columns or separate schemas per branch.
* *Merging in SQL:* Row-level conflict resolution is complex.

**Verdict:**
**Loam should stay focused on "Git/FS Persistence".**
It should be the "Best in Class" adapter for file-based apps.

If `finance-vault` needs SQL, it should build its own `pkg/adapters/postgres`.
**However**, `finance-vault` can define a **Sync/Projection** features:

* *Master:* Loam (Files).
* *Read Replica:* Postgres (for Metabase/Grafana).

## 4. Proposed Architecture for Fiscus

We will design the Go Application to be **Backend Agnostic** via dependency injection.

```go
// main.go (Simplified)

type Config struct {
    Backend string // "loam" | "postgres"
}

func main() {
    var repo domain.Repository

    if config.Backend == "loam" {
        repo = loam_adapter.New(...)
    } else {
        repo = sql_adapter.New(...)
    }

    service := domain.NewService(repo)
    service.Run()
}
```

### The "Simulations" Caveat

If the user chooses SQL, they lose "Free Git Branching".

* *Mitigation:* The SQL Adapter would simply panic/error on `Simulate()` calls, OR we implement a complex "Scenario ID" column in SQL.
* *Stewardship View:* The "Sober" default is Loam. SQL is for the "Power User" who trades Git-History for SQL-Power.

## 5. Conclusion

* **Interoperability:** Achieved via Hexagonal Interfaces in `finance-vault`.
* **Loam:** Stays pure (Git/FS).
* **Project Structure:** Explicit `pkg/ports` and `pkg/adapters`.
