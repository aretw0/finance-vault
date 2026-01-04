# Product Specification

## Visão do Produto

**Finance Vault** é um ecossistema de ferramentas modulares que permite a "Jardineiros Digitais" e entusiastas da soberania de dados gerenciar suas finanças pessoais utilizando notas Markdown (Obsidian) como banco de dados primário.

A filosofia central é **"File over App"**: seus dados financeiros não devem ficar presos em um aplicativo proprietário ou em um banco de dados opaco. Eles devem ser arquivos de texto simples, legíveis por humanos e processáveis por máquinas, sobrevivendo a qualquer software específico.

## Personas

### 1. O Jardineiro Digital (Primary)

- **Perfil:** Usuário avançado do Obsidian, provavelmente usa métodos como Zettelkasten ou PARA. Valoriza a posse dos dados e a longevidade dos arquivos.
- **Dores:** Apps de finanças são silos fechados. Exportar CSVs e importar manualmente é trabalhoso e propenso a erros (duplicatas).
- **Objetivo:** Ter um fluxo automatizado onde o extrato do banco vira notas no seu "Second Brain" sem atrito.

### 2. O Entusiasta Unix (Secondary)

- **Perfil:** Desenvolvedor ou Sysadmin que adora CLI e automação. Prefere scripts e pipelines a GUIs pesadas.
- **Dores:** As ferramentas existentes exigem servidores, bancos de dados SQL/Docker, o que é *overkill* para finanças pessoais.
- **Objetivo:** `cat nubank.csv | finance-vault import`, simples e direto.

### 3. O CFO Familiar/Corporativo (Advanced)

- **Perfil:** Gerencia finanças de múltiplas pessoas ou entidades (ex: Família, Pequena Empresa).
- **Dores:** Misturar gastos pessoais com corporativos. Falta de rastreabilidade de quem gastou o que.
- **Objetivo:** Uma única "Verdade" (Vault) onde gastos de João, Maria e da Empresa Lda coexistem organizadamente.

## Canonical Transaction Schema

Para garantir que o sistema seja agnóstico ao banco (Nubank, Sicoob, Inter, etc), todos os adaptadores devem converter os dados brutos para este formato canônico antes de qualquer processamento.

```json
{
  "id": "string",          // UUID ou Hash determinístico único da transação
  "date": "string",        // Data ISO 8601 (YYYY-MM-DD)
  "amount": "number",      // Valor numérico (negativo para saídas, positivo para entradas)
  "currency": "string",    // Código ISO 4217 (BRL, USD, EUR) - Default: BRL
  "description": "string", // Descrição original ou saneada da transação
  "category": "string",    // Categoria para agrupamento (Opcional, null inicialmente)
  "tags": "string[]",      // Tags para organização flexível (Ex: #nubank, #alimentacao)
  "account": "string",     // Identificador da conta de origem (Ex: "nubank-pf")
  "owner": "string",       // [NOVO] Quem realizou/é responsável (Ex: "joao")
  "ledger": "string",      // [NOVO] Contexto/Livro Razão (Ex: "pessoal", "familia", "empresa-x")
  "metadata": "object"     // Dados extras específicos da fonte
}
```

### Exemplo de Objeto Canônico

```json
{
  "id": "68136dee-6f70-4842-aa8d-2f4a72fbbe23",
  "date": "2025-05-01",
  "amount": 8.00,
  "currency": "BRL",
  "description": "Transferência recebida pelo Pix - LUMA S RODRIGUES",
  "category": null,
  "tags": ["nubank", "transferencia"],
  "account": "nubank",
  "owner": "joao",
  "ledger": "familia",
  "metadata": {
    "bank_id": "0001",
    "raw_desc": "Transferência recebida pelo Pix - LUMA S RODRIGUES ARAUJO..."
  }
}
```
