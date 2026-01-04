# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).

## 🔎 Recent Transactions

### Income

Finds lines starting with `amount:` followed by a positive number (digit). Uses regex `line:` operator.

```query
path:transactions line:(/^amount:\s*[0-9]/) sort:date desc
```

### Expenses

Finds lines starting with `amount:` followed by a minus sign. Uses regex `line:` operator.

```query
path:transactions line:(/^amount:\s*-/) sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
path:transactions tag:#nubank
```
