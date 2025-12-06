# BOOTSTRAP.md

Este arquivo serve para fazer o bootstrap deste projeto chamado finance-vault.

## Objetivos

1. Centralizar o conhecimento sobre gerência financeira pessoal ou coletiva em notas do Obsidian.
2. Centralizar o conhecimento sobre o formato dos dados bancários disponíveis para exportação no diferentes bancos.
3. Entregar um meio de converter esses dados para o formato de notas do Obsidian.
4. Entregar um meio de abstrair a ingestão de dados bancários mantendo a integridade da gestão financeira, i.e., evitar lançamentos duplicados, etc.
5. Cultivar uma ferramenta pensando em extensibilidade para que possa se integrar em um processo de automação de chatOps, e.g., recepção de arquivos para ingestão, envio de relatórios, etc.

## Visão Geral

Acima de tudo esse projeto servirá como uma testemunha do seu próprio processo de pesquisa e desenvolvimento. Entra como um milestone em uma visão de longo prazo de um ecossistema de ferramentas que operam usando a caixa de notas markdown com frontmatter como banco de dados. Muito do que aprenderemos aqui servirá para a fundação de outros projetos, logo é importante nos manter atento a possíveis extensões, evoluções, e a não misturar conceitos que devem ser centralizados, e.g.:

- Todas as ferramentas que operarem sobre as notas devem se apoiar em uma abordagem centralizada pensando em um cenário onde estarão muito provavelmente todas juntas operando diferentes seções da mesma caixa de notas.
- Em um cenário de chatOps, a gerência financeira poderia acontecer ao lado da gerência de agenda (notas do Obsidian refletindo o calendário do google).
- É natural que coisas como as operações de dados, salvamento e sem falar do gerenciamento do git (opcional) serão centralizadas para fácil reuso e evitar race conditions.

### Público-alvo

1. **Jardineiros digitais**
    - Usuários de caixas de notas que querem gerência financeira pessoal ou coletiva.
    - Provavelmente já tem uma caixa de notas onde gostaria de adicionar mais funcionalidades.

2. **Público geral**:
    - Usuários que não se importam com a tecnologia mas que querem gerência financeira pessoal ou coletiva.
    - Nunca tiveram uma caixa de notas, vão começar com uma do 0.

## Abordagem

Seguiremos uma abordagem incremental para evitar *over-engineering*:
**Spike -> SDD Simplificado -> (Dev Container) -> BDD/TDD**

### 1. Fase 0: Spike (Prova de Conceito)

**Objetivo:** Validar a viabilidade técnica.
*Por que?* É preciso estabelecer as regras básicas para focar apenas na ingestão dos dados e posterior manutenção da integridade.

1. Analisar arquivos de exemplo de dados bancários que temos na pasta `data/` (naturalmente ignorada pelo git):

    - `data/NU_33881380_01MAI2025_31MAI2025.ofx`, arquivo ofx do nubank.
    - `data/NU_33881380_01MAI2025_31MAI2025.csv`, arquivo csv do nubank.
    - `data/sicoob_2025_12_05_23_10_07.pdf`, arquivo pdf do sicoob.

2. Definir conversão de dados bancários para notas do Obsidian.

3. Pesquisar sobre como se da uma gerência financeira a partir de notas do Obsidian.

4. Definir estrutura de dados das notas do Obsidian.

### 2. SDD - Specification Driven Development (Simplificado)

Evitar a "burocracia de documentação". Focaremos em poucos arquivos vivos em `/docs`:

- `PRODUCT.md`: Visão, Personas e User Stories (O "Porquê" e "Para Quem").
- `TECHNICAL.md`: Arquitetura, Decisões de Design (Dados -> Obsidian) e Stack.
- `PLANNING.md`: Roadmap, Backlog e Tarefas imediatas.

*Na raiz:*

- `README.md`: Guia de início rápido.

### 3. Dev Container & Ambiente

Definir um ambiente reprodutível (Dev Container) apenas após validar o Spike, para garantir que outros devs possam colaborar sem "works on my machine".

### 4. Qualidade (BDD/TDD)

- **BDD:** Testes de aceitação para garantir que o fluxo "Ingestão de dados -> Processamento -> Atualização das notas" funcione.
- **TDD:** Testes unitários para lógicas complexas (ex: parsers de dados bancários), se houver.

### Próximos Passos Imediatos

1. [ ] Criar `docs/PLANNING.md` com o backlog inicial.
2. [ ] Executar o **Spike** do projeto.
