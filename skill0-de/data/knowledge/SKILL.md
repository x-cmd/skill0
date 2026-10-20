---
name: knowledge
description: |
  Hacker News, Wikipedia, DuckDuckGo, RFC-Dokumente und Stack Exchange von der Kommandozeile aus durchsuchen.
  Null Hürde — x-cmd installieren und lostersuchen.
  Für "suchen", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Die Wissensquellen des Internet von der Kommandozeile aus durchsuchen.

## Schnellstart

```bash
# x-cmd installieren
eval "$(curl https://get.x-cmd.com)"

# Hacker News Top-Beiträge
x hn top

# Wikipedia-Suche
x wkp "artificial intelligence"

# DuckDuckGo-Suche
x ddgo "rust programming language"

# RFC-Dokumente
x rfc 2616

# Stack-Exchange-Suche
x se "how to exit vim"
```

## Was verfügbar ist

| Befehl | Quelle | Beispiel |
|---------|--------|---------|
| `x hn top` | Hacker News | Top-10-Trending-Beiträge |
| `x hn new` | Hacker News | Neueste Einreichungen |
| `x wkp <query>` | Wikipedia | Artikel durchsuchen |
| `x ddgo <query>` | DuckDuckGo | Websuche |
| `x rfc <number>` | RFC-Dokumente | RFC-Spezifikationen lesen |
| `x se <query>` | Stack Exchange | Q&A durchsuchen |

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Weitere Quellen (Project Gutenberg, arxiv)
- Fortgeschrittene Suchmuster
- Tipps zum Filtern und Formatieren von Ergebnissen

## Volles Erlebnis

`x knowledge --help` für alle Optionen, nachdem x-cmd installiert ist.

## Verwandt
