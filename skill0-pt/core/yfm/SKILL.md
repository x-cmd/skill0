---
name: yfm
description: |
  Front matter YAML (YFM) para qualquer artigo markdown. O padrão do x-cmd são três campos de
  primeiro nível: `tags`, `description`, `memo`. O padrão empresta a forma do frontmatter do Agent
  Skills — veja <https://agentskills.io/specification>. O módulo yfm é um auxiliar:
  `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Adote YFM

Use YFM em qualquer markdown que um agente, um índice ou um pipeline de ontologia possa varrer. **Siga o dialeto já em uso, se houver um** (Agent Skills, Obsidian, Jekyll, Hugo, etc.) — o padrão do x-cmd só se aplica quando nenhum outro dialeto manda.

## O padrão do x-cmd: três campos

```yaml
---
tags: [design, front-matter]
description: Resumo de uma frase que o leitor usa para decidir se abre este arquivo.
memo:
  2026-07-31T14:30:00+08:00: Cortei os aliases; renomeei o terceiro campo para memo.
---

# Título

Corpo...
```

- **`tags`** — lista de slugs de primeiro nível `[a-z0-9-]`. Consumidor: o coletor para a indexação de ontologia.
- **`description`** — string de primeiro nível. Uma frase. Não é o `description:` do Agent Skills (esse é um requisito só de SKILL.md, governado pelo `skill0-writer`).
- **`memo:`** — mapa de primeiro nível, o log de revisões do arquivo. As chaves são timestamps ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, o offset local do autor); os valores são descrições curtas das mudanças. Mais recente primeiro. Omita quando não houver histórico que valha registrar.

### Escopo de aplicação

- `<project>/.x-cmd/story/` — estende com `issue:` — veja [usecase/story.md](usecase/story.md).
- Corpos de issue / PR do GitHub — estende com `repo:`, `number:` — veja [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- `README.md` do GitHub — apenas os campos padrão.

## Módulo

O módulo yfm é um auxiliar. Três comandos:

- `x yfm ls [path]` — lista blocos YFM; por padrão o diretório atual
- `x yfm init [path]` — escreve um bloco no padrão do x-cmd em cada arquivo markdown sob o path
- `x yfm lint [path]` — checa se cada bloco YFM é YAML válido e segue o dialeto que ele declara

## Lendo front matter estrangeiro

O coletor ingere muitos dialetos. Para a especificação da qual o padrão empresta, veja <https://agentskills.io/specification>. Por dialeto:

- [Agent Skills](usecase/agentskills.md) — `metadata:` é string→string; o primeiro nível é fechado
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` reservados
- [Jekyll](usecase/jekyll.md) — lista ou separados por **espaço**
- [Hugo](usecase/hugo.md) — TOML possível; taxonomia configurada no site