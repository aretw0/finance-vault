# Finance Dashboard (Native)

> [!TIP]
> This dashboard uses only **Core Plugins** (Search).
> If these queries return "Nothing Found", check if the folder path matches your Vault structure.

## 🔎 Recent Transactions

### Income

Finds files containing "amount:" followed by a digit.
Uses `file:` (content) search instead of `line:` for robustness.
Removes `path:` restriction to ensure it finds files regardless of Vault root.

```query
file:"amount:" file:/[0-9]/ -file:"amount: -" sort:date desc
```

### Expenses

Finds files explicitly containing "amount: -".

```query
file:"amount: -" sort:date desc
```

## 🏷️ By Tag

### Nubank

```query
tag:#nubank
```
