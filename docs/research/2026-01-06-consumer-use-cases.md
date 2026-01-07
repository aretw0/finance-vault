# Research: Advanced User Scenarios

This document analyzes high-value use cases that go beyond simple "Importer" logic, focusing on how a **Stewardship** based system allows for Manual Entry, Complex Credit Management, Simulations, and Long-Term Liabilities.

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

## 2. Managing Credit Cards (Short-term Liabilities)

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

---

## 4. Loans & Financing (Long-term Liabilities)

**The Challenge:** Mortgages, Car Loans, and Personal Loans are often ignored in cashflow apps, making the "Net Worth" deceptive (e.g., claiming you own a 500k house but ignoring the 400k debt).

### Proposed Solution: The Liability Account

We treat a Loan exactly like an Investment Account, but with a **negative balance**.

#### The Model

1. **Initialization:**
    * User creates `assets/liabilities/mortgage-house.md`.
    * Initial Balance: `-R$ 400,000.00`.
2. **Monthly Payment (The split):**
    * User pays R$ 4,000.00 to the bank.
    * **Split Transaction:**
        * R$ 1,500 (Interest) -> **Expense** (Money gone forever).
        * R$ 2,500 (Principal) -> **Transfer** to `mortgage-house`.
3. **Result:**
    * Checking Account: `-4000`.
    * Mortgage Account: `-400,000 + 2,500 = -397,500`.
    * Net Worth increases by +2,500 (You are "richer" because you owe less).

**Stewardship Note:** Updating the split (Interest vs Principal) usually requires checking the bank statement. If the Steward wants simplicity, they can treat the whole payment as Expense (simpler, but undervalues Net Worth) OR simply update the `mortgage-house` balance manually once a year to correct the drift. Ideally, the system supports updated via Statements (Input-Only).
