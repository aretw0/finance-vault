# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search & Backlinks). No community plugins required.

## 🔎 Recent Transactions

### Income (Search Query)

```query
path:"transactions" line:("amount: " /^[0-9]/) sort:date desc
```

### Expenses (Search Query)

```query
path:"transactions" line:("amount: " /^-/) sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
path:"transactions" tag:#nubank
```
