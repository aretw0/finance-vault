# Fiscus 🏛️

> **"Soberania Financeira que funciona."**
> O Sistema Operacional para quem quer ser o CFO da própria vida.

[![License](https://img.shields.io/github/license/aretw0/fiscus.svg)](LICENSE)
> [!IMPORTANT]
> **Status: Research Preview / Pre-Alpha**
>
> Este projeto está em transição de uma coleção de scripts para uma arquitetura robusta baseada em **Loam** (Git Database).
> Atualmente, ele serve como referência de arquitetura e "working draft" da filosofia Fiscus. **Não use em produção sem entender os riscos.**

**Fiscus** não é apenas um software, é uma filosofia de **Digital Stewardship** (Zelo Digital). Centralize sua vida financeira em arquivos que você realmente possui.

## 🌟 A Promessa do Steward

1. **File over App:** Seus dados são arquivos texto. Se este software desaparecer amanhã, seus dados continuam legíveis.
2. **Observabilidade (Roadmap):** A meta é clara: ao importar seus dados, gráficos de Fluxo de Caixa, Patrimônio e Metas devem emergir automaticamente, sem configuração manual.
3. **Auditoria Total:** Cada centavo tem um rastro (UUID) e um dono (Owner).

## 🛠️ Como funciona (Visão)

Você é o Jardineiro (Steward). O Sistema é a Máquina.

1. **Input (Seu Trabalho):** Você joga os extratos (CSV, PDF, etc) na pasta `inbox/`.
2. **Process (O Sistema):** O CLI organiza, categoriza e "commita" os dados.

    ```bash
    fiscus run --watch # (Em desenvolvimento)
    ```

3. **Output (O Prêmio):** Você abre o Obsidian e vê:
    - Quanto gastou em IFood.
    - Quanto falta para a viagem da Europa (Metas).
    - A evolução da sua carteira de Investimentos.

## 📂 Cobertura (Planejada)

| Domínio | O que ele rastreia? | O que ele entrega? |
| :--- | :--- | :--- |
| **Transações** | Gastos diários, salário, pix. | Fluxo de Caixa e Balanço Mensal. |
| **Investimentos** | Ações, Fundos, Renda Fixa. | Gráfico de Alocação e Evolução Patrimonial. |
| **Metas** | Objetivos futuros. | Barra de progresso e projeção de data. |

## 🚀 Começando

### Pré-requisitos

- Go 1.25+
- Git

### Instalação

```bash
git clone https://github.com/aretw0/fiscus.git
cd fiscus
go mod tidy
```

### Exploração

Para ver os comandos disponíveis na nova arquitetura CLI:

```bash
go run cmd/fiscus/main.go help
```

*(Consulte `archive/` se você estiver procurando pelos protótipos antigos em PowerShell)*

## 📚 Documentação Oficial

- [Manual do Steward (Product Spec)](docs/PRODUCT.md): Entenda a filosofia.
- [Roadmap (Planning)](docs/PLANNING.md): O que estamos construindo.
- [Technical Guide](docs/TECHNICAL.md): Para quem quer abrir o capô.

## 🤝 Contribuindo

Pull Requests são bem-vindos! Verifique o [Roadmap](docs/PLANNING.md) para ver onde precisamos de ajuda.
