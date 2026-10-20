---
name: yfm
description: |
  YAML front matter (YFM) pour tout article markdown. Le défaut x-cmd est trois champs top-level : `tags`, `description`, `memo`. Le défaut emprunte la forme du frontmatter Agent Skills — voir <https://agentskills.io/specification>. Le module yfm est un helper : `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Adopter le YFM

Utilisez YFM pour tout markdown qu'un agent, un index, ou un pipeline d'ontologie peut scanner. **Suivez le dialecte existant si l'un est déjà en usage** (Agent Skills, Obsidian, Jekyll, Hugo, etc.) — le défaut x-cmd s'applique uniquement quand aucun autre dialecte ne régit.

## Le défaut x-cmd : trois champs

```yaml
---
tags: [design, front-matter]
description: Résumé en une phrase qu'un lecteur utilise pour décider d'ouvrir ce fichier.
memo:
  2026-07-31T14:30:00+08:00: Coupe les alias ; renommé le troisième champ en memo.
---

# Titre

Corps...
```

- **`tags`** — liste top-level de slugs `[a-z0-9-]`. Consommateur : le collecteur pour l'indexation ontologique.
- **`description`** — chaîne top-level. Une phrase. Pas le `description:` d'Agent Skills (qui est un requirement SKILL.md-only, régi par `skill0-writer`).
- **`memo:`** — map top-level, le journal de révision du fichier. Les clés sont des timestamps ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, offset local de l'auteur) ; les valeurs sont de courtes descriptions de changement. Le plus récent d'abord. Omettez quand aucune histoire ne mérite d'être consignée.

### Périmètre d'application

- `<project>/.x-cmd/story/` — étend avec `issue:` — voir [usecase/story.md](usecase/story.md).
- Corps d'issue / PR GitHub — étend avec `repo:`, `number:` — voir [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — champs par défaut uniquement.

## Module

Le module yfm est un helper. Trois commandes :

- `x yfm ls [path]` — liste les blocs YFM ; par défaut le répertoire courant
- `x yfm init [path]` — écrit un bloc x-cmd-default dans chaque fichier markdown sous le path
- `x yfm lint [path]` — vérifie que chaque bloc YFM est du YAML valide et suit le dialecte qu'il prétend suivre

## Lire du front matter étranger

Le collecteur ingère de nombreux dialectes. Pour la spec dont le défaut est emprunté, voir <https://agentskills.io/specification>. Par dialecte :

- [Agent Skills](usecase/agentskills.md) — `metadata:` est string→string ; le top-level est fermé
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` réservés
- [Jekyll](usecase/jekyll.md) — liste ou séparés par **espace**
- [Hugo](usecase/hugo.md) — TOML possible ; taxonomie configurée par le site

