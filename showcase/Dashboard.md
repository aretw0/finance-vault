# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search & Backlinks). No community plugins required.

## 🔎 Recent Transactions

### Income (Search Query)

Matches lines like `amount: 2500` but explicitly excludes lines with `amount: -`.

```query
path:"transactions" line:(/amount:\s*[0-9]/) -line:(/amount:\s*-/) sort:date desc
```

### Expenses (Search Query)

Matches lines like `amount: -150`.

```query
path:"transactions" line:(/amount:\s*-/) sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
path:"transactions" tag:#nubank
```
