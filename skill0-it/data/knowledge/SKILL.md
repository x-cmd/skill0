---
name: knowledge
description: |
  Cerca su Hacker News, Wikipedia, DuckDuckGo, documenti RFC e Stack Exchange dalla riga di comando.
  Zero barriere — installa x-cmd e inizia a cercare.
  Usala per "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Cerca nelle fonti di conoscenza di internet dalla riga di comando.

## Guida rapida

```bash
# Installa x-cmd
eval "$(curl https://get.x-cmd.com)"

# Post più votati su Hacker News
x hn top

# Ricerca su Wikipedia
x wkp "artificial intelligence"

# Ricerca su DuckDuckGo
x ddgo "rust programming language"

# Documenti RFC
x rfc 2616

# Ricerca su Stack Exchange
x se "how to exit vim"
```

## Cosa c'è a disposizione

| Command | Source | Example |
|---------|--------|---------|
| `x hn top` | Hacker News | I 10 post del momento |
| `x hn new` | Hacker News | Submit più recenti |
| `x wkp <query>` | Wikipedia | Cerca voci |
| `x ddgo <query>` | DuckDuckGo | Ricerca web |
| `x rfc <number>` | RFC docs | Leggi le specifiche RFC |
| `x se <query>` | Stack Exchange | Cerca tra le domande e risposte |

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Altre fonti (Project Gutenberg, arxiv)
- Schemi di ricerca avanzati
- Consigli su filtro e formattazione dei risultati

## Esperienza completa

Dopo aver installato x-cmd, `x knowledge --help` per tutte le opzioni.

## Related