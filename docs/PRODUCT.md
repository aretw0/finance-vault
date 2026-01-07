# Product Specification

## A Visão: Soberania Financeira via Stewardship

**Finance Vault** é o sistema operacional para sua soberania financeira. Ele rejeita a ideia de apps "mágicos" que vendem seus dados em troca de gráficos bonitos. Em vez disso, propõe um modelo de **Digital Stewardship** (Zelo Digital).

### A Filosofia do Steward

1. **Possessão Radical:** Seus dados são arquivos texto (Markdown). Eles vivem no seu disco, não na nuvem de terceiros.
2. **O Contrato de Zelo:** Você aceita o papel de "Jardineiro" (Steward). Você é responsável por alimentar o sistema (Input).
3. **A Garantia de Valor:** Em troca do seu zelo, o sistema garante uma "Segunda Memória" financeira completa. Se o dado entrou, o insight sai. Sem configuração, sem atrito.

## Personas

### 1. O Steward Soberano (Core)

- **Quem é:** Alguém que cansou de apps que morrem, mudam o preço ou vendem dados. Quer controle total (CFO da própria vida).
- **Comportamento:** Aceita rodar um script semanalmente ("Rito de Atualização") em troca da paz de espírito de ver seu Patrimônio Líquido consolidado instantaneamente.
- **Desejo:** "Eu cuido da entrada (CSV), o sistema cuida da saída (Dashboard)."

## Core Domains

O sistema cobre os três pilares da saúde financeira:

### 1. Transações (O Fluxo)

O registro imutável do passado.

- **Schema Canônico:** Padronização agnóstica de bancos.
- **Output:** Fluxo de Caixa, Categorização, Busca Rápida.

### 2. Investimentos (O Patrimônio)

O monitoramento do futuro e dos deveres (Fisco).

- **Entidades:** Ativos (Ações, ETFs, Fundos, Renda Fixa).
- **Schema:** Ticker, Quantidade, **Preço Médio** (Tax Readiness), Cotação Atual.
- **Output:** Alocação de Ativos, Evolução do Patrimônio Líquido e **Relatórios de Auxílio IRPF**.

### 3. Metas (O Propósito)

A razão de acumular.

- **Entidades:** Objetivos (Viagem, Aposentadoria, Compra).
- **Conexão:** Vincula *contas* ou *investimentos* a *metas*.
- **Output:** Barra de Progresso, Estimativa de Conclusão.

## Canonical Transaction Schema

Para garantir a perenidade, todos os adaptadores convertem dados brutos para este formato universal.

```json
{
  "id": "string",          // UUID Determinístico
  "date": "string",        // YYYY-MM-DD
  "amount": "number",      // Valor (Negativo = Saída)
  "currency": "string",    // BRL, USD
  "description": "string", // Descrição original
  "category": "string",    // Opcional
  "tags": "string[]",      // Ex: ["#nubank", "#lazer"]
  "account": "string",     // Ex: "nubank-pf"
  "shards": {              // [NOVO] Stewardship Context
      "owner": "string",   // Ex: "joao"
      "ledger": "string"   // Ex: "familia"
  },
  "metadata": "object"     // Dados crus para auditoria
}
```

## Investment Schema (Draft)

```json
{
  "asset_id": "string",    // Ticker ou ID único (HGLG11)
  "type": "string",        // FII, STOCK, FIXED
  "quantity": "number",    // Posição atual
  "average_price": "number",
  "current_price": "number", // Atualizado via Enrichment
  "last_update": "datetime"
}
```
