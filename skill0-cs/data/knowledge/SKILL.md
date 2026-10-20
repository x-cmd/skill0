---
name: knowledge
description: |
  Vyhledávání na Hacker News, Wikipedii, DuckDuckGo, v RFC dokumentech a Stack Exchange z příkazové řádky.
  Žádná bariéra — nainstaluj x-cmd a začni hledat.
  Použij pro "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Vyhledávání ve znalostních zdrojích internetu z příkazové řádky.

## Rychlý start

```bash
# Nainstaluj x-cmd
eval "$(curl https://get.x-cmd.com)"

# Nejlepší příspěvky Hacker News
x hn top

# Vyhledávání na Wikipedii
x wkp "artificial intelligence"

# Vyhledávání na DuckDuckGo
x ddgo "rust programming language"

# Dokumenty RFC
x rfc 2616

# Vyhledávání na Stack Exchange
x se "how to exit vim"
```

## Co je k dispozici

| Příkaz | Zdroj | Příklad |
|---------|--------|---------|
| `x hn top` | Hacker News | 10 nejtrendingovějších příspěvků |
| `x hn new` | Hacker News | Nejnovější příspěvky |
| `x wkp <query>` | Wikipedie | Hledání článků |
| `x ddgo <query>` | DuckDuckGo | Webové vyhledávání |
| `x rfc <number>` | Dokumenty RFC | Čtení RFC specifikací |
| `x se <query>` | Stack Exchange | Vyhledávání Q&A |

## Tento skill0 poroste

Začínáme základy. Postupně přidáme:
- Další zdroje (Project Gutenberg, arxiv)
- Pokročilé vzory vyhledávání
- Tipy na filtrování a formátování výsledků

## Plné možnosti

`x knowledge --help` pro všechny možnosti po instalaci x-cmd.

## Související
