# Roadmap & Planning

Este documento guia a evolução do **Finance Vault**, focando na entrega de valor ao Steward (o usuário).

## Roadmap

### Fase 0: Spike (Concluído)

*O nascimento do sistema.*

- [x] Validar parser de CSV/PDF.
- [x] Estabelecer Loam como engine.
- [x] Criar primeiros adaptadores.

### Fase 1: Arquitetura & Showcase (Concluído)

*A prova de conceito.*

- [x] Pipeline Unix funcional.
- [x] Schema Canônico V1.
- [x] Showcase inicial com Dashboards estáticos.

### Fase 1.5: Maturidade Técnica (Migration to Go)

**Objetivo:** Sair de scripts soltos para um binário único e robusto. **Isso é pré-requisito para Dashboards complexos (Investimentos/Taxas) que exigem validação estrita.**

- [ ] **App Go:** Portar lógica de pipeline para `main.go`.
- [ ] **Loam Integration:** Usar `loam` como biblioteca Go nativa.
- [ ] **Strict Typing:** Implementar Structs para validação de Schema (Transações e Relacionamentos).

### Fase 2: Stewardship & Experience (Atual)

**Objetivo:** Transformar o "uso de scripts" em uma experiência de "Jardinagem Digital" segura e recompensadora.
*Foco: StewEx (Steward Experience), Investimentos e Metas.*

#### 2.1. O Contrato de Input (StewEx)

- [ ] **Erros Humanos:** Melhorar logs do Pipeline. O erro deve dizer "Coluna X faltando no arquivo Y" e não "Null Reference Exception".
- [ ] **Idempotência Real:** Garantir que rodar o mesmo arquivo 10x não gere duplicatas nem sujeira.
- [ ] **Verificação de Saúde:** Script `verify_vault.ps1` que checa integridade dos links e schemas.

#### 2.2. Domínio: Investimentos (Novo Pilar)

- [ ] **Schema Definition:** Formalizar o JSON de Ativos (Ações, Fundos, Tesouro), incluindo campos para **Preço Médio** (Tax Readiness).
- [ ] **Adapter B3/CEI:** Criar importador para área logada da B3 (ou CSVs de corretoras).
- [ ] **Enricher de Cotação:** Script opcional que busca preço atual (Yahoo Finance/API).
- [ ] **View:** Dashboard de Patrimônio Líquido.

#### 2.3. Domínio: Metas (O Propósito)

- [ ] **Schema Definition:** Objetivos Financeiros (Target Amount, Due Date).
- [ ] **Vinculação:** Lógica para dizer "Esta conta Nubank alimenta a Meta Viagem".
- [ ] **View:** Barra de Progresso de Metas.

### Fase 3: Visualização "Context-Aware" (Próximo)

**Objetivo:** Dashboards que se montam sozinhos.

- [ ] **Templates Dinâmicos:** Usar `[shards.ledger: "pessoal"]` para criar visões automáticas.
- [ ] **Relatórios Executive:** PDF mensal gerado automaticamente.
- [ ] **Audit de Assinaturas:** Detecção e projeção automática de custos recorrentes.

### Fase 4: Advanced Stewardship (Futuro)

**Objetivo:** Funcionalidades de poder para o usuário avançado.

- [ ] **Reconciliação Manual/Auto:** Mecanismo para fundir entradas manuais (`inbox/`) com importações bancárias, evitando duplicatas.
- [ ] **Simulações (Multiverso):** Abstração de CLI para criar `branches` git de simulação ("E se eu comprar esse carro?").
- [ ] **Gestão de Cartão:** Suporte nativo a transfers e fechamento de fatura (Short-term Liability).
- [ ] **Financiamentos (Dívidas):** Rastreamento de saldo devedor e amortização (Long-term Liability).

### Fase 5: Qualidade Total

**Objetivo:** Robustez industrial.

- [ ] Testes de carga (10k+ transações).
- [ ] CI/CD para validar novos adaptadores da comunidade.
