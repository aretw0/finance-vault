# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).

## 🔎 Recent Transactions

### Income

Finds lines containing "amount:" AND a digit (0-9), excluding lines with a minus sign "-".

```query
path:transactions content:"amount:" content:/[0-9]/ -content:"-"
```

### Expenses

Finds lines containing "amount:" AND a minus sign "-".

```query
path:transactions content:"amount:" content:"-"
```

## 🏷️ By Tag

### Nubank

```query
path:transactions tag:#nubank
```
