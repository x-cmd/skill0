---
name: tldr
description: |
  Referință rapidă pentru comenzi, cu exemple practice din proiectul tldr-pages.
  Fără bariere — folosește cu x-cmd, curl sau orice client tldr.
  Folosește pentru "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Referință rapidă pentru comenzi, cu exemple din lumea reală. Mai bună decât paginile man pentru „cum folosesc comanda asta?"

## Quick Start

```bash
# With x-cmd
x tldr git                    # Git usage examples
x tldr --lang zh python       # Chinese docs
x tldr --fz                   # Interactive search

# Without x-cmd — use curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Or install a tldr client
pip install tldr
npm install -g tldr
tldr tar
```

## Ce e disponibil

- `x tldr <cmd>` — Arată exemple pentru o comandă
- `x tldr --lang zh <cmd>` — În limba chineză
- `x tldr --fz` — Căutare interactivă cu fzf
- `x tldr --cat <cmd>` — Afișare markdown brut
- `x tldr --ls` — Listează toate comenzile disponibile
- `x tldr --update` — Actualizează cache-ul de pagini

## Alternative standalone

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Pagini brute: github.com/tldr-pages/tldr

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare uzuale de comenzi
- Note specifice platformelor
- Integrare cu fluxurile de lucru ale agenților

## Related

- [git](../git/SKILL.md) — tldr pentru subcomenzile git uzuale
- [install](../install/SKILL.md) — tldr pentru subcomenzile install