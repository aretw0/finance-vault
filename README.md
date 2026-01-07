# Fiscus (formerly Finance Vault) 🏛️

> **"Soberania Financeira que funciona."**
> O Sistema Operacional para quem quer ser o CFO da própria vida.

[![License](https://img.shields.io/github/license/aretw0/finance-vault.svg)](LICENSE)

Finance Vault não é apenas um software, é uma filosofia de **Digital Stewardship** (Zelo Digital). Centralize sua vida financeira em arquivos que você realmente possui.

## 🌟 A Promessa do Steward

1. **File over App:** Seus dados são arquivos texto. Se este software desaparecer amanhã, seus dados continuam legíveis.
2. **Observabilidade (Em Breve):** A meta é clara: ao importar seus dados, gráficos de Fluxo de Caixa, Patrimônio e Metas devem emergir automaticamente, sem configuração manual.
3. **Auditoria Total:** Cada centavo tem um rastro (UUID) e um dono (Owner).

## 🛠️ Como funciona?

Você é o Jardineiro (Steward). O Sistema é a Máquina.

1. **Input (Seu Trabalho):** Você joga os extratos (CSV, PDF, etc) na pasta `inbox/`.
2. **Process (O Sistema):** Você roda o script de "jardinagem" (pipeline).

    ```powershell
    ./pipeline.ps1 # ou o comando configurado
    ```

3. **Output (O Prêmio):** Você abre o Obsidian e vê:
    - Quanto gastou em IFood.
    - Quanto falta para a viagem da Europa (Metas).
    - A evolução da sua carteira de Investimentos.

## 📂 Cobertura (Visão)

| Domínio | O que ele rastreia? | O que ele entrega? |
| :--- | :--- | :--- |
| **Transações** | Gastos diários, salário, pix. | Fluxo de Caixa e Balanço Mensal. |
| **Investimentos** | Ações, Fundos, Renda Fixa. | Gráfico de Alocação e Evolução Patrimonial. |
| **Metas** | Objetivos futuros. | Barra de progresso e projeção de data. |

## 🚀 Começando

### Pré-requisitos

- **PowerShell Core (pwsh)**
- **Obsidian** (Para visualizar os dashboards)

### Instalação

```bash
git clone https://github.com/seu-user/finance-vault.git
cd finance-vault
./setup.ps1 # Prepara o terreno
```

## 📚 Documentação Oficial

- [Manual do Steward (Product Spec)](docs/PRODUCT.md): Entenda a filosofia.
- [Roadmap (Planning)](docs/PLANNING.md): O que estamos construindo.
- [Technical Guide](docs/TECHNICAL.md): Para quem quer abrir o capô.

## 🤝 Contribuindo

Pull Requests são bem-vindos! Verifique o [Roadmap](docs/PLANNING.md) para ver onde precisamos de ajuda.
