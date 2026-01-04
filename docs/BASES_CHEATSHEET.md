# Obsidian Bases Cheatsheet 🗃️

Documentação reversa baseada em exemplos funcionais do recurso nativo (beta/recente) de Bases do Obsidian.

## Estrutura do Arquivo `.base`

Arquivos `.base` utilizam YAML para definir filtros e visualizações.

### Exemplo Mínimo

```yaml
filters:
  or:
    - file.tags.contains("finance")
    - file.folder == "transactions"
views:
  - type: table
    name: Principal
    order:
      - file.name
      - amount
      - date
```

### Propriedades Conhecidas

#### `filters`

Define quais arquivos entram na base. Suporta lógica booleana.

- `or`: Lista de condições (OU).
- `and`: Lista de condições (E).
- Condições: `file.folder == "pasta"`, `file.tags.contains("tag")`.

#### `views`

Lista de visualizações disponíveis.

- `type`: `table` (Tabela), `board` (Kanban - *provável*), `list`.
- `name`: Nome da aba.
- `order`: Lista de colunas (propriedades) a serem exibidas. Use o nome da propriedade do frontmatter ou propriedades de arquivo (`file.name`, `file.ctime`).

### Dicas

- O arquivo `.base` deve ser criado dentro do vault.
- O Obsidian deve reconhecer automaticamente a extensão e renderizar a UI de banco de dados.
