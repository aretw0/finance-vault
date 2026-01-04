# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).
> It leverages **Properties Search** syntax (introduced in recent Obsidian versions) for precise numeric filtering.

## 🔎 Recent Transactions

### Income

Finds notes where the `amount` property is **greater than 0**.

```query
path:transactions [amount:>0]
```

### Expenses

Finds notes where the `amount` property is **less than 0**.

```query
path:transactions [amount:<0]
```

## 🏷️ By Tag

### Nubank

```query
path:transactions tag:#nubank
```
