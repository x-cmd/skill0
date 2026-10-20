---
name: tldr
description: |
  Riferimento dei comandi con esempi pratici dal progetto tldr-pages.
  Zero barriere — usalo con x-cmd, curl o qualsiasi client tldr.
  Usalo per "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Riferimento rapido dei comandi con esempi reali. Meglio delle pagine man per "come si usa questo comando?"

## Guida rapida

```bash
# Con x-cmd
x tldr git                    # Esempi d'uso di Git
x tldr --lang zh python       # Documentazione in cinese
x tldr --fz                   # Ricerca interattiva

# Senza x-cmd — usa curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Oppure installa un client tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Cosa c'è a disposizione

- `x tldr <cmd>` — Mostra esempi per un comando
- `x tldr --lang zh <cmd>` — Lingua cinese
- `x tldr --fz` — Ricerca interattiva con fzf
- `x tldr --cat <cmd>` — Visualizzazione del markdown grezzo
- `x tldr --ls` — Elenca tutti i comandi disponibili
- `x tldr --update` — Aggiorna la cache delle pagine

## Alternative standalone

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Pagine grezze: github.com/tldr-pages/tldr

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi di comando comuni
- Note specifiche per piattaforma
- Integrazione con i workflow degli agenti

## Related

- [git](../git/SKILL.md) — tldr dei sottocomandi git più usati
- [install](../install/SKILL.md) — tldr dei sottocomandi install