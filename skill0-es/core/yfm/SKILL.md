---
name: yfm
description: |
  YAML front matter (YFM) para cualquier artículo markdown. El valor por defecto de x-cmd son tres campos de primer nivel: `tags`, `description`, `memo`. El valor por defecto toma prestada la forma del frontmatter de Agent Skills — consulta <https://agentskills.io/specification>. El módulo yfm es un ayudante: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Adopta YFM

Usa YFM para cualquier markdown que un agente, un índice o un pipeline de ontología pueda escanear. **Sigue el dialecto que ya esté en uso** (Agent Skills, Obsidian, Jekyll, Hugo, etc.) — el valor por defecto de x-cmd aplica solo cuando ningún otro dialecto manda.

## El valor por defecto de x-cmd: tres campos

```yaml
---
tags: [design, front-matter]
description: One-sentence summary a reader uses to decide whether to open this file.
memo:
  2026-07-31T14:30:00+08:00: Cut aliases; renamed third field to memo.
---

# Title

Body...
```

- **`tags`** — lista de slugs de primer nivel `[a-z0-9-]`. Consumidor: el colector para la indexación de ontología.
- **`description`** — string de primer nivel. Una frase. No es el `description:` de Agent Skills (eso es un requisito solo de SKILL.md, gobernado por `skill0-writer`).
- **`memo:`** — mapa de primer nivel, el registro de revisiones del archivo. Las claves son marcas de tiempo ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, desfase local del autor); los valores son descripciones breves de cambios. Lo más reciente primero. Omítelo cuando no haya historial que merezca la pena.

### Ámbito de aplicación

- `<project>/.x-cmd/story/` — se extiende con `issue:` — consulta [usecase/story.md](usecase/story.md).
- Cuerpos de issue / PR de GitHub — se extiende con `repo:`, `number:` — consulta [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- `README.md` de GitHub — solo los campos por defecto.

## Módulo

El módulo yfm es un ayudante. Tres comandos:

- `x yfm ls [path]` — listar bloques YFM; por defecto el directorio actual
- `x yfm init [path]` — escribir un bloque con el valor por defecto de x-cmd en cada archivo markdown bajo la ruta
- `x yfm lint [path]` — comprobar que cada bloque YFM es YAML válido y sigue el dialecto que declara

## Leer front matter ajeno

El colector ingiere muchos dialectos. Para la especificación de la que toma prestado el valor por defecto, consulta <https://agentskills.io/specification>. Dialecto por dialecto:

- [Agent Skills](usecase/agentskills.md) — `metadata:` es string→string; el primer nivel está cerrado
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` reservados
- [Jekyll](usecase/jekyll.md) — lista o separado por **espacios**
- [Hugo](usecase/hugo.md) — TOML posible; taxonomía configurada en el sitio

