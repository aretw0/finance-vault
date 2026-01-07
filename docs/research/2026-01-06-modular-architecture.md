# Research: Modular Architecture & Lifecycle

This document addresses how `finance-vault` matures from a script-collection into a reusable **Platform for Sovereign Data**.

## 1. Modularity: "Vault" as a Database

The user explicitly requested that `finance-vault` serve as an example for future "Vault Apps". To achieve this, we must strictly separate **Infrastructure** (CRUD) from **Domain** (Finance).

### The Layered Design

```
/pkg
  /vault       <-- THE REUSABLE ENGINE (The "ORM")
     - Repository (Generic Interface)
     - LoamAdapter (Loam/Git implementation)
     - QueryBuilder (Simple filtering logic)
  /finance     <-- THE DOMAIN (The "Business")
     - Transaction (Struct)
     - TaxCalculator (Logic)
     - Service (Uses pkg/vault to save transactions)
```

**Reusable Component (`pkg/vault`):**

* Does not know what "Money" is.
* Knows how to:
  * Read/Write Markdown Frontmatter.
  * Manage File Locks.
  * Interact with `loam` (Commit/Branch).
  * Perform **Migrations**.

**Conclusion:** If you later build `health-vault`, you copy `pkg/vault` and write `pkg/health`.

## 2. Lifecycle: Migrations & Seeding

### Migrations (Evolution)

In a file-based system, a schema change (e.g., renaming `cost` to `amount`) requires strictly rewriting every file.

* **Strategy:** **Eager Migration via Git.**
    1. The App version `v2` detects the Vault is at version `v1` (stored in `.vault-metadata`).
    2. **Safety:** It ensures the git tree is clean (no uncommitted changes).
    3. **Execution:** It iterates all files, deserializes (v1), maps to (v2), serializes.
    4. **Commit:** It creates a dedicated commit: `chore: migrate vault to v2`.
  * *Why this is superior to SQL:* If the migration fails or corrupts data, the user just does `git reset --hard HEAD~1`. Safe by design.

### Seeding (Validation)

Seeding is critical for testing Dashboards without waiting 1 year to accumulate data.
`finance-vault seed --scenario=debt-crisis`

* Generates 500 fake Markdown files.
* Allows dev/user to test the UI immediately.

## 3. Schema Strategy: Code vs External

**Question:** Should we define schemas in JSON/YAML or Go?
**Answer:** **Go is the Source of Truth**, but we **Generate** external schemas.

1. **Code First:** We define `type Transaction struct` in Go. This allows strict compile-time checks in the Application.
2. **Artifact Generation:** A build step generates `schema.json` (JSON Schema) from the Go structs.
3. **Editor Integration:** We point `vscode` or `obsidian-linter` to this `schema.json`.
    * *Result:* The user gets Autocomplete/Validation inside their text editor.
    * *Benefit:* We don't maintain two sources of truth. Code drives the tooling.

## 4. Summary of Technical Refinements

1. **Modularity:** Clean split between `pkg/vault` (Generic CRUD) and `pkg/finance` (Domain).
2. **Safety:** Migrations utilize generic Git-Rollback capabilities.
3. **DX (Developer Experience):** Go Structs generate JSON Schemas for editor support.
