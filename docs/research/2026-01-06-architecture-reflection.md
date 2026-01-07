# Architecture Reflection: The Path to Maturity

## 1. Are we "Innovating Plumbing"?

**Yes, we are building a "Static Finance Generator".**

Similar to how tools like **Hugo** or **Jekyll** take raw content (Markdown) and turn it into a Website (HTML), `fiscus` takes raw data (CSV) and turns it into a Knowledge Base (Obsidian Vault).

* **The Trap (Reinventing Database):** If we try to implement indexes, b-trees, or complex query languages on top of text files, we are reinventing SQLite badly. We must avoid this.
* **The Sweet Spot:** Our "Database" features should be limited to what the file system offers:
  * **Organization:** Folders (`/2025/05/`) acting as simple partitions.
  * **Lookup:** Filenames (`uuid.md`) acting as Primary Keys.
  * **Queries:** Delegated to the **View Layer** (Obsidian/Dataview) or simple grep-like scans.

We are not building a database; we are building a **Structured Data Projector**.

## 2. Formal Schemas & Validation

**Imperative.** If the goal is "Zero Config", the data structure must be rigid.

* **Go Structs as Schemas:** Moving to Go allows us to define rigid `structs`.

    ```go
    type Transaction struct {
        ID          string  `yaml:"id" validate:"uuid4"`
        Amount      float64 `yaml:"amount"` // float vs int64 (cents) discussion needed
        LedgerID    string  `yaml:"ledger_id"` // Foreign Key
    }
    ```

* **Relationship Enforcement:**
  * The application acts as a "Linter".
  * *Scenario:* Importing a transaction for `ledger: business`.
  * *Check:* Does `vault/ledgers/business.md` exist?
  * *Result:* If no, error or prompt to create. This prevents "Orphaned Data".

## 3. Go Application (The "Controller")

**Decision: Migrate from Scripts to a Single Binary.**

* **Why Go?**
    1. **Interop:** Can import `github.com/aretw0/loam` directly. `loam` becomes our embedded library, not an external CLI dependency.
    2. **Distribution:** Users download 1 binary. No installing Python, Node, or PowerShell modules.
    3. **Type Safety:** Manipulating financial data in typeless scripts (Bash/PS) is risky (Float precision errors). Go has better control.

**The Semantic Stack (MVC)**

* **Model (Storage):** Loam (Git + Filesystem).
* **View (UI):** Obsidian (Markdown Renderer).
* **Controller (Logic):** `fiscus` (Go Binary).

## 4. Avoiding Reinvention (Interoperability)

**Principle: Use "Plain Text Standards" wherever possible.**

* **Storage:** Markdown + YAML Frontmatter. (Obsidian, Jekyll, Hugo compatible).
* **Config:** `fiscus.yaml` (Standard).
* **Input:** OFX (Banking Standard) and CSV.
* **Number Format:** Decimal (Standard).

**Where we differ from `beancount` or `ledger-cli`:**

* They use *Domain Specific Languages* (`2025-01-01 * "Beans" 10.00 USD`).
* We use *Universal Formats* (Markdown/YAML).
  * *Pro:* Any text editor understands YAML. Obsidian renders it natively.
  * *Con:* More verbose.
  * *Verdict:* Worth it for the "First Class Citizen" integration with Obsidian.
