# Research: Advanced User Scenarios

This document analyzes high-value use cases that go beyond simple "Importer" logic, focusing on how a **Stewardship** based system allows for Manual Entry, Complex Credit Management, and Simulations.

## 1. Manual vs. Automated ( The "Proactive Steward" Paradox)

**The Challenge:** A user inputs a transaction manually (to see immediate impact) that will later be imported automatically via CSV (the official record).
**The Risk:** Duplication of records or frustration in cleaning up data.

### Proposed Solution: "Inbox & Reconcile" Pattern

We treat manual entries not as "Final Truth" but as "Intention" or "Drafts".

#### Mechanism

1. **Fast Input:** User creates a note in `inbox/manual/`.
    * Properties: `amount: -50.00`, `desc: "Dinner"`, `date: 2025-05-20`.
2. **Unified View:** Dashboards are updated to query `FROM "vault" OR "inbox"`.
    * *Result:* User sees the expense immediately.
3. **The Auto-Import:** Days later, the CSV runs. It creates a definitive note in `vault/.../uuid-123.md`.
4. **Reconciliation (The Ceremony):**
    * A script `finance-vault reconcile` runs.
    * It scans `inbox/manual` and matches against recent `vault/` entries (Fuzzy match on Amount + Date Window).
    * **Detects:** "Found Manual Entry (-50.00) matching Imported Entry (-50.00)".
    * **Action:**
        1. Merges any *extra* tags/notes from Manual to Imported.
        2. Archives/Deletes the Manual note.

**Stewardship Note:** The Steward feels safe entering data knowing the system will "clean up" the double entry later, preserving their context (tags) but adopting the Bank's truth (exact timestamp/ID).

---

## 2. Managing Credit Cards (Liabilities)

**The Challenge:** Credit cards are debt instruments. The expense happens at $T_0$, but the cash leaves the account at $T_{payment}$.

### Proposed Architecture

Treat the Credit Card not just as a category, but as a distinct **Ledger Entity**.

#### Data Flow

1. **Usage (The Spending):**
    * Importing the Credit Card CSV generates transactions with `account: nubank-credit`.
    * **Effect:** Reduces `Net Worth` immediately, but does not affect `Checking Account Balance`.
2. **Payment (The Transfer):**
    * When you pay the bill, it is a **Transfer**, not an Expense.
    * `Checking`: -R$ 5000 (Transfer Out)
    * `Credit Card`: +R$ 5000 (Transfer In)
    * **Effect:** Credit Liability goes to 0. Checking Balance decreases. Net Worth remains neutral (Asset down, Liability down).

**Stewardship Note:** The system handles the multi-account complexity. The Steward just ensures the "Transfer" is tagged correctly so it doesn't look like a double expense.

---

## 3. Financial Simulations (The "Multiverse")

**The Challenge:** "What if I buy this car?" "What if I lose my job?" The user wants to test scenarios without polluting their real data.

### Proposed Solution: Git Branching as a Feature

Since `Finance Vault` uses `Loam` (Git) natively, we can offer "Financial Multiverses" nearly for free.

#### Workflow

1. **Start Simulation:**

    ```powershell
    finance-vault sim start "buying-porsche"
    # System runs: git checkout -b sim/buying-porsche
    ```

2. **The sandbox:**
    * The user is now in a parallel timeline.
    * They add a manual transaction: `- R$ 500.000 (Carro)`.
    * They open the Dashboard. `Net Worth` plummets. `Liquid Assets` turn red.
3. **Decision:**
    * *Option A (Abort):* "Too expensive."

        ```powershell
        finance-vault sim close
        # git checkout main && git branch -D sim/buying-porsche
        ```

    * *Option B (Commit/Merge):* "I actually did it."

        ```powershell
        finance-vault sim merge
        # git checkout main && git merge sim/buying-porsche
        ```

**UI Considerations:** The Obsidian status bar can be configured (via plugin or just Git status) to show `[SIMULATION MODE]`, warning the user they are not looking at reality.
