# Roadmap & Planning

Este documento rastreia o progresso do projeto `finance-vault`, desde a fase de Spike até a maturação.

## Roadmap

### Fase 0: Spike (Atual)

**Objetivo:** Validar a viabilidade técnica e definir as bases.

- [ ] Analisar arquivos de dados (OFX, CSV, PDF).
- [ ] Definir estratégia de conversão (Bancos -> Obsidian).
- [ ] Validar **Loam** como engine de armazenamento.

### Fase 1: SDD (Especificação)

**Objetivo:** Formalizar o produto e a arquitetura.

- [ ] Detalhar `PRODUCT.md` (Personas, User Stories).
- [ ] Detalhar `TECHNICAL.md` (Design de dados, Arquitetura).

### Fase 2: Ambiente

**Objetivo:** Garantir reprodutibilidade.

- [ ] Configurar Dev Container.

### Fase 3: Qualidade

**Objetivo:** Garantir robustez.

- [ ] Implementar testes BDD/TDD.

## Backlog (Fase 0)

1. **Análise de Dados**
   - [ ] Inspecionar `data/NU_*.ofx` e identificar campos relevantes.
   - [ ] Inspecionar `data/NU_*.csv` e identificar campos relevantes.
   - [ ] Inspecionar `data/sicoob_*.pdf` e avaliar complexidade de extração.

2. **Definições do Obsidian**
   - [ ] Pesquisar padrões de gerência financeira no Obsidian.
   - [ ] Definir estrutura de pastas e frontmatter das notas.

3. **Validação do Loam**
   - [ ] Instalar CLI do Loam.
   - [ ] Inicializar cofre de teste (`loam init`).
   - [ ] Testar criação de notas (`loam write`).
   - [ ] Testar listagem (`loam list`).
