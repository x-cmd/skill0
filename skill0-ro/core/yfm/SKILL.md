---
name: yfm
description: |
  YAML front matter (YFM) pentru orice articol markdown. Implicitul x-cmd sunt trei câmpuri de nivel superior: `tags`, `description`, `memo`. Implicitul împrumută forma frontmatter-ului Agent Skills — vezi <https://agentskills.io/specification>. Modulul yfm e un ajutor: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Adoptă YFM

Folosește YFM pentru orice markdown pe care un agent, un index sau un pipeline de ontologie ar putea să scaneze. **Urmează dialectul existent dacă deja e unul în uz** (Agent Skills, Obsidian, Jekyll, Hugo etc.) — implicitul x-cmd se aplică doar când niciun alt dialect nu guvernează.

## Implicitul x-cmd: trei câmpuri

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

- **`tags`** — listă de slug-uri `[a-z0-9-]` la nivel superior. Consumator: collector-ul pentru indexare ontologică.
- **`description`** — string la nivel superior. O propoziție. Nu e `description:` din Agent Skills (acela e o cerință doar pentru SKILL.md, guvernată de `skill0-writer`).
- **`memo:`** — map la nivel superior, jurnalul de revizii al fișierului. Cheile sunt timestamp-uri ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, offsetul local al autorului); valorile sunt descrieri scurte de schimbare. Cel mai nou întâi. Omite când nu merită înregistrată nicio istorie.

### Domeniu de aplicare

- `<project>/.x-cmd/story/` — se extinde cu `issue:` — vezi [usecase/story.md](usecase/story.md).
- Corpuri de issue / PR-uri GitHub — se extinde cu `repo:`, `number:` — vezi [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — doar câmpurile implicite.

## Modul

Modulul yfm e un ajutor. Trei comenzi:

- `x yfm ls [path]` — listează blocurile YFM; implicit directorul curent
- `x yfm init [path]` — scrie un bloc implicit x-cmd în fiecare fișier markdown de sub cale
- `x yfm lint [path]` — verifică că fiecare bloc YFM e YAML valid și urmează dialectul pe care îl declară

## Citirea front matter-ului străin

Collector-ul ingerează multe dialecte. Pentru specificația din care împrumută implicitul, vezi <https://agentskills.io/specification>. Per dialect:

- [Agent Skills](usecase/agentskills.md) — `metadata:` e string→string; nivelul superior e închis
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` rezervate
- [Jekyll](usecase/jekyll.md) — listă sau separate prin **spațiu**
- [Hugo](usecase/hugo.md) — posibil TOML; taxonomie configurată de site