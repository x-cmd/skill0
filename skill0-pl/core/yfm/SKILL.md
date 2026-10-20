---
name: yfm
description: |
  YAML front matter (YFM) dla każdego artykułu w markdown. Domyślny w x-cmd to trzy pola najwyższego poziomu: `tags`, `description`, `memo`. Wartość domyślna bierze kształt frontmatteru Agent Skills — zobacz <https://agentskills.io/specification>. Moduł yfm to pomocnik: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Przyjmij YFM

Używaj YFM dla każdego markdowna, który może przeskanować agent, indeks lub potok ontologiczny. **Postępuj zgodnie z istniejącym dialektem, jeśli taki już jest w użyciu** (Agent Skills, Obsidian, Jekyll, Hugo itd.) — wartość domyślna x-cmd obowiązuje tylko wtedy, gdy nie rządzi żaden inny dialekt.

## Wartość domyślna x-cmd: trzy pola

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

- **`tags`** — lista slugów najwyższego poziomu `[a-z0-9-]`. Konsument: zbieracz do indeksowania ontologicznego.
- **`description`** — ciąg najwyższego poziomu. Jedno zdanie. To nie jest `description:` z Agent Skills (to wymaganie wyłącznie dla SKILL.md, regulowane przez `skill0-writer`).
- **`memo:`** — mapa najwyższego poziomu, dziennik zmian pliku. Klucze to znaczniki czasu ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, lokalne przesunięcie autora); wartości to krótkie opisy zmian. Najnowsze najpierw. Pomiń, gdy nie ma historii wartej zapisania.

### Zakres stosowania

- `<project>/.x-cmd/story/` — rozszerzone o `issue:` — zobacz [usecase/story.md](usecase/story.md).
- Treść issue / PR na GitHubie — rozszerzona o `repo:`, `number:` — zobacz [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — tylko pola domyślne.

## Moduł

Moduł yfm to pomocnik. Trzy polecenia:

- `x yfm ls [path]` — wypisz bloki YFM; domyślnie bieżący katalog
- `x yfm init [path]` — zapisz blok domyślny x-cmd w każdym pliku markdown poniżej ścieżki
- `x yfm lint [path]` — sprawdź, czy każdy blok YFM jest poprawnym YAML-em i trzyma się deklarowanego dialektu

## Czytanie obcego front matter

Zbieracz przyjmuje wiele dialektów. Specyfikację, z której bierze wzór wartość domyślna, znajdziesz pod <https://agentskills.io/specification>. Dla każdego dialektu:

- [Agent Skills](usecase/agentskills.md) — `metadata:` to ciąg→ciąg; najwyższy poziom jest zamknięty
- [Obsidian](usecase/obsidian.md) — zarezerwowane `tags` / `aliases` / `cssclasses`
- [Jekyll](usecase/jekyll.md) — lista lub rozdzielone **spacją**
- [Hugo](usecase/hugo.md) — możliwy TOML; taksonomia konfigurowana w witrynie