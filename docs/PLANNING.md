# Roadmap & Planning

Este documento rastreia o progresso do projeto `finance-vault`, definindo a estratégia de evolução.

## Roadmap

### Fase 0: Spike (Concluído)

**Objetivo:** Validar a viabilidade técnica e definir as bases.

- [x] Analisar arquivos de dados (OFX, CSV, PDF).
- [x] Definir estratégia de conversão (Bancos -> Obsidian).
- [x] Validar **Loam** como engine de armazenamento.

### Fase 1: Arquitetura & Showcase (Concluído)

**Objetivo:** Formalizar a arquitetura (Pipeline, Schema) e demonstrar valor imediato (Showcase).

- [x] Documentação Essencial (`PRODUCT.md`, `TECHNICAL.md`).
- [x] Refatoração do Spike para Arquitetura de Pipeline.
- [x] Implementação do Adaptador Nubank V1.
- [x] Criação do ambiente `showcase/` com Dashboards (Nativo, Canvas, Dataview).

### Fase 2: Visualização Avançada (Atual)

**Objetivo:** Evoluir dos dashboards estáticos para "Context-Aware Views" (ver `TECHNICAL.md`).

- [ ] **Templates de Dashboard**: Criar templates que configuram filtros automaticamente (`[ledger: nome]`).
- [ ] **Testes de Robustez**: Validar resiliência dos dashboards a mudanças de estrutura de pastas.
- [ ] **Relatórios Avançados**: Implementar Fluxo de Caixa Mensal via DataviewJS.

### Fase 3: Processo & Ambiente

**Objetivo:** Garantir robustez no desenvolvimento e uso (DevEx).

- [ ] Configurar **Dev Container** para reprodutibilidade.
- [ ] Implementar verificação Cross-Platform (Linux/CI).
- [ ] Refinar User Stories para cenários complexos (Investimentos, Parcelamento).

### Fase 4: Qualidade Total

**Objetivo:** Blindar o sistema contra regressões.

- [ ] Implementar testes automatizados (BDD/TDD).
- [ ] Validar performance com grande volume de dados.

## Backlog

### Análise de Dados (Pendente)

- [ ] Inspecionar `data/sicoob_*.pdf` e avaliar complexidade de extração.

### Definições do Obsidian (Pendente)

- [ ] Pesquisar padrões de gerência financeira no Obsidian (Community Standards).
