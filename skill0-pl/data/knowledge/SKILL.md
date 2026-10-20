---
name: knowledge
description: |
  Przeszukiwanie Hacker News, Wikipedii, DuckDuckGo, dokumentów RFC i Stack Exchange z wiersza poleceń.
  Bez barier — zainstaluj x-cmd i zacznij wyszukiwać.
  Użyj dla "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Przeszukuj źródła wiedzy w internecie z wiersza poleceń.

## Szybki start

```bash
# Zainstaluj x-cmd
eval "$(curl https://get.x-cmd.com)"

# Najpopularniejsze wpisy na Hacker News
x hn top

# Wyszukiwanie w Wikipedii
x wkp "artificial intelligence"

# Wyszukiwanie w DuckDuckGo
x ddgo "rust programming language"

# Dokumenty RFC
x rfc 2616

# Wyszukiwanie w Stack Exchange
x se "how to exit vim"
```

## Co jest dostępne

| Polecenie | Źródło | Przykład |
|---------|--------|---------|
| `x hn top` | Hacker News | 10 najpopularniejszych wpisów |
| `x hn new` | Hacker News | Najnowsze zgłoszenia |
| `x wkp <query>` | Wikipedia | Szukaj artykułów |
| `x ddgo <query>` | DuckDuckGo | Wyszukiwanie w sieci |
| `x rfc <number>` | Dokumenty RFC | Czytaj specyfikacje RFC |
| `x se <query>` | Stack Exchange | Szukaj w Q&A |

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Więcej źródeł (Project Gutenberg, arxiv)
- Zaawansowane wzorce wyszukiwania
- Wskazówki do filtrowania i formatowania wyników

## Pełne doświadczenie

`x knowledge --help` dla wszystkich opcji po zainstalowaniu x-cmd.

## Powiązane