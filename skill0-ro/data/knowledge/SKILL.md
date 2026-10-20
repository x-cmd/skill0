---
name: knowledge
description: |
  Caută în Hacker News, Wikipedia, DuckDuckGo, documentele RFC și Stack Exchange, din linia de comandă.
  Fără bariere — instalează x-cmd și începe să cauți.
  Folosește pentru "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Caută în sursele de cunoștințe ale internetului, din linia de comandă.

## Quick Start

```bash
# Install x-cmd
eval "$(curl https://get.x-cmd.com)"

# Hacker News top posts
x hn top

# Wikipedia search
x wkp "artificial intelligence"

# DuckDuckGo search
x ddgo "rust programming language"

# RFC documents
x rfc 2616

# Stack Exchange search
x se "how to exit vim"
```

## Ce e disponibil

| Comandă | Sursă | Exemplu |
|---------|--------|---------|
| `x hn top` | Hacker News | Cele 10 articole în trending |
| `x hn new` | Hacker News | Cele mai recente trimiteri |
| `x wkp <query>` | Wikipedia | Caută articole |
| `x ddgo <query>` | DuckDuckGo | Căutare web |
| `x rfc <number>` | Documente RFC | Citește specificațiile RFC |
| `x se <query>` | Stack Exchange | Caută în Q&A |

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Mai multe surse (Project Gutenberg, arxiv)
- Tipare de căutare avansată
- Sfaturi de filtrare și formatare a rezultatelor

## Experiența completă

`x knowledge --help` pentru toate opțiunile, după instalarea x-cmd.

## Related