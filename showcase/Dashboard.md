# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).

## 🔎 Recent Transactions

### Income (Search Query)

Uses standard text search to find positive amounts. Matches `amount:` followed by a digit.

```query
path:"transactions" /amount: [0-9]/ sort:date desc
```

### Expenses (Search Query)

Uses standard text search to find negative amounts. Matches `amount:` followed by `-`.

```query
path:"transactions" "amount: -" sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
path:"transactions" tag:#nubank
```
