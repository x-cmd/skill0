---
name: yfm
description: |
  YAML Front Matter (YFM) für jeden Markdown-Artikel. x-cmds Standard sind drei Top-Level-Felder: `tags`, `description`, `memo`. Der Standard leiht sich die Frontmatter-Form der Agent Skills — siehe <https://agentskills.io/specification>. Das yfm-Modul ist ein Helfer: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## YFM übernehmen

Nutze YFM für jedes Markdown, das ein Agent, ein Index oder eine Ontologie-Pipeline scannen könnte. **Folge dem vorhandenen Dialekt, wenn bereits einer im Einsatz ist** (Agent Skills, Obsidian, Jekyll, Hugo, etc.) — der x-cmd-Standard gilt nur, wenn kein anderer Dialekt regiert.

## Der x-cmd-Standard: drei Felder

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

- **`tags`** — Top-Level-Liste von Slugs `[a-z0-9-]`. Konsument: der Collector für die Ontologie-Indizierung.
- **`description`** — Top-Level-String. Ein Satz. Nicht das Agent-Skills-`description:` (das ist eine Anforderung nur für SKILL.md, geregelt von `skill0-writer`).
- **`memo:`** — Top-Level-Map, das Revisionsprotokoll der Datei. Keys sind ISO-8601-Zeitstempel (`YYYY-MM-DDTHH:mm:ss±HH:mm`, lokaler Offset des Autors); Values sind kurze Änderungsbeschreibungen. Neueste zuerst. Weglassen, wenn es keine lohnenswerte Historie gibt.

### Anwendungsbereich

- `<project>/.x-cmd/story/` — erweitert um `issue:` — siehe [usecase/story.md](usecase/story.md).
- GitHub-Issue-/PR-Bodies — erweitert um `repo:`, `number:` — siehe [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — nur Standardfelder.

## Modul

Das yfm-Modul ist ein Helfer. Drei Befehle:

- `x yfm ls [path]` — YFM-Blöcke auflisten; Standard ist das aktuelle Verzeichnis
- `x yfm init [path]` — einen Block im x-cmd-Standard in jede Markdown-Datei unter dem Pfad schreiben
- `x yfm lint [path]` — prüfen, dass jeder YFM-Block gültiges YAML ist und dem beanspruchten Dialekt folgt

## Fremdes Front Matter lesen

Der Collector nimmt viele Dialekte auf. Für die Spezifikation, von der der Standard sich leiht, siehe <https://agentskills.io/specification>. Pro Dialekt:

- [Agent Skills](usecase/agentskills.md) — `metadata:` ist string→string; die Top-Ebene ist geschlossen
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` sind reserviert
- [Jekyll](usecase/jekyll.md) — Liste oder **Leerzeichen**-getrennt
- [Hugo](usecase/hugo.md) — TOML möglich; Taxonomie über die Site konfiguriert
