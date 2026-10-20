---
name: tldr
description: |
  Referenční příručka příkazů s praktickými příklady z projektu tldr-pages.
  Bez jakýchkoli překážek — použijte s x-cmd, curl nebo libovolným tldr klientem.
  Použijte pro "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Rychlá referenční příručka příkazů se skutečnými příklady. Lepší než man pages pro otázku „jak tento příkaz použít?“.

## Rýchlý start

```bash
# S x-cmd
x tldr git                    # Příklady použití gitu
x tldr --lang zh python       # Dokumentace v čínštině
x tldr --fz                   # Interaktivní hledání

# Bez x-cmd — použijte curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Nebo nainstalujte tldr klienta
pip install tldr
npm install -g tldr
tldr tar
```

## Co je k dispozici

- `x tldr <cmd>` — Zobrazí příklady pro příkaz
- `x tldr --lang zh <cmd>` — Čínština
- `x tldr --fz` — Interaktivní hledání přes fzf
- `x tldr --cat <cmd>` — Zobrazí surový markdown
- `x tldr --ls` — Vypíše všechny dostupné příkazy
- `x tldr --update` — Aktualizuje cache stránek

## Samostatné alternativy

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Surové stránky: github.com/tldr-pages/tldr

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Běžné vzory příkazů
- Poznámky specifické pro platformy
- Integrace s agent workflows

## Související

- [git](../git/SKILL.md) — tldr běžně používaných dílčích příkazů gitu
- [install](../install/SKILL.md) — tldr dílčích příkazů install
