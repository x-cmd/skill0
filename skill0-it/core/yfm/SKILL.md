---
name: yfm
description: |
  YAML front matter (YFM) per qualsiasi articolo markdown. Il predefinito di x-cmd sono tre campi di primo livello: `tags`, `description`, `memo`. Il default prende in prestito la forma del frontmatter degli Agent Skills — vedi <https://agentskills.io/specification>. Il modulo yfm è un aiutante: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Adotta YFM

Usa YFM per qualsiasi markdown che un agente, un indice o una pipeline di ontologia possa scansionare. **Segui il dialetto già in uso se ne esiste uno** (Agent Skills, Obsidian, Jekyll, Hugo, ecc.) — il predefinito x-cmd vale solo quando nessun altro dialetto è in carica.

## Il predefinito x-cmd: tre campi

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

- **`tags`** — elenco di slug di primo livello `[a-z0-9-]`. Consumatore: il collector per l'indicizzazione ontologica.
- **`description`** — stringa di primo livello. Una frase. Non è il `description:` degli Agent Skills (quello è un requisito valido solo per SKILL.md, governato da `skill0-writer`).
- **`memo:`** — mappa di primo livello, il registro delle revisioni del file. Le chiavi sono timestamp ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, offset locale dell'autore); i valori sono brevi descrizioni delle modifiche. Più recenti prima. Omettilo quando non vale la pena registrarne la storia.

### Ambito di applicabilità

- `<project>/.x-cmd/story/` — si estende con `issue:` — vedi [usecase/story.md](usecase/story.md).
- Corpi di issue / PR GitHub — si estendono con `repo:`, `number:` — vedi [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — solo i campi predefiniti.

## Modulo

Il modulo yfm è un aiutante. Tre comandi:

- `x yfm ls [path]` — elenca i blocchi YFM; di default la directory corrente
- `x yfm init [path]` — scrive un blocco con il default x-cmd in ogni file markdown sotto il percorso
- `x yfm lint [path]` — verifica che ogni blocco YFM sia YAML valido e segua il dialetto che dichiara

## Leggere front matter stranieri

Il collector ingerisce molti dialetti. Per la specifica da cui il default prende in prestito, vedi <https://agentskills.io/specification>. Dialetto per dialetto:

- [Agent Skills](usecase/agentskills.md) — `metadata:` è stringa→stringa; il primo livello è chiuso
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` riservati
- [Jekyll](usecase/jekyll.md) — elenco o separati da **spazi**
- [Hugo](usecase/hugo.md) — TOML possibile; tassonomia configurata dal sito