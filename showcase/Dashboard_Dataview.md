# Finance Dashboard (Dataview)

> [!INFO]
> This dashboard requires the **Dataview** plugin to be enabled.

## Financial Summary

```dataviewjs
const pages = dv.pages('"showcase/transactions"');
const income = pages.where(p => p.amount > 0).amount.array().reduce((a, b) => a + b, 0);
const expenses = pages.where(p => p.amount < 0).amount.array().reduce((a, b) => a + b, 0);
const balance = income + expenses;

dv.paragraph(`
| Metric | Value |
| :--- | :--- |
| **Total Income** | <span style="color:green">R$ ${income.toFixed(2)}</span> |
| **Total Expenses** | <span style="color:red">R$ ${expenses.toFixed(2)}</span> |
| **Net Balance** | **R$ ${balance.toFixed(2)}** |
`);
```

## Recent Transactions

```dataview
TABLE date as Date, amount as Amount, description as Description, category as Category
FROM "showcase/transactions"
SORT date DESC
LIMIT 10
```
