# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).

## 🔎 Recent Transactions

### Income

Strategy: Finds lines with "amount:" and **excludes** lines with "amount: -" (negative).

```query
path:transactions line:"amount:" -line:"amount: -" sort:date desc
```

### Expenses

Strategy: Finds lines explicitly containing "amount: -".

```query
path:transactions line:"amount: -" sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
path:transactions tag:#nubank
```
