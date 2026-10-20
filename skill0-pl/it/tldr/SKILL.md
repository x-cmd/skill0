---
name: tldr
description: |
  Referencja poleceń z praktycznymi przykładami z projektu tldr-pages.
  Bez barier — użyj z x-cmd, curl lub dowolnym klientem tldr.
  Użyj dla "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Szybka referencja poleceń z przykładami ze świata rzeczywistego. Lepsza niż strony man przy pytaniu „jak użyć tego polecenia?".

## Szybki start

```bash
# Z x-cmd
x tldr git                    # Przykłady użycia gita
x tldr --lang zh python       # Dokumentacja chińska
x tldr --fz                   # Wyszukiwanie interaktywne

# Bez x-cmd — użyj curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Albo zainstaluj klienta tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Co jest dostępne

- `x tldr <cmd>` — pokaż przykłady dla polecenia
- `x tldr --lang zh <cmd>` — język chiński
- `x tldr --fz` — interaktywne wyszukiwanie fzf
- `x tldr --cat <cmd>` — surowy markdown
- `x tldr --ls` — wypisz wszystkie dostępne polecenia
- `x tldr --update` — zaktualizuj cache stron

## Alternatywy samodzielne

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Surowe strony: github.com/tldr-pages/tldr

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Typowe wzorce poleceń
- Uwagi dotyczące konkretnych platform
- Integracja z przepływami pracy agentów

## Powiązane

- [git](../git/SKILL.md) — tldr najczęściej używanych podpoleceń gita
- [install](../install/SKILL.md) — tldr podpoleceń install