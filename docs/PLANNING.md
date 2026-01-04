# Roadmap & Planning

Este documento rastreia o progresso do projeto `finance-vault`, desde a fase de Spike até a maturação.

## Roadmap

### Fase 0: Spike (Concluído)

**Objetivo:** Validar a viabilidade técnica e definir as bases.

- [x] Analisar arquivos de dados (OFX, CSV, PDF).
- [x] Definir estratégia de conversão (Bancos -> Obsidian).
- [x] Validar **Loam** como engine de armazenamento.

### Fase 0.5: Refinamento & Documentação (Atual)

**Objetivo:** Formalizar a arquitetura e "limpar a casa" antes da implementação robusta.

- [x] Documentação Essencial (`PRODUCT.md`, `TECHNICAL.md`).
- [x] Refatoração do Spike para Arquitetura de Pipeline.
- [x] Implementação do Adaptador Nubank V1.

### Fase 1: SDD (Especificação)

**Objetivo:** Expansão e Casos de Uso Avançados.

- [ ] Detalhar User Stories avançadas.
- [ ] Design de Relatórios.

### Fase 2: Ambiente

**Objetivo:** Garantir reprodutibilidade.

- [ ] Configurar Dev Container.
- [ ] Validar compatibilidade Linux (CI/CD).

### Fase 3: Qualidade

**Objetivo:** Garantir robustez.

- [ ] Implementar testes BDD/TDD.

## Backlog

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
