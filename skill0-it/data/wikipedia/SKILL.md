---
name: wikipedia
description: |
  Cerca e leggi Wikipedia tramite x wkp — API MediaWiki, senza API key,
  zero installazioni; query, extract, suggest e rotta DDG in un solo modulo.
  Carica per wiki, wikipedia, encyclopedia lookup, article summary.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

L'output è un estratto in testo semplice (più o meno primo paragrafo + infobox). Il verbo del sottocomando determina la forma — `hop` per cercare-e-poi-riassumere, `extract` per titoli noti, `search` per i candidati, `suggest` per il did-you-mean. Il sito predefinito è la Wikipedia in inglese; `--lang` / `--api-url` passano ad altri wiki.

## Guida rapida con `x wkp`

```bash
x wkp hop Python                      # ricerca + estratto del primo risultato in un colpo
x wkp extract OpenAI                  # riassunto di una pagina nota
x wkp search "Linux kernel"           # elenca i candidati quando il titolo è incerto
x wkp suggest pythen                  # did-you-mean: suggerimenti di correzione prima della ricerca
```

`x wkp -h` per tutti i flag e i sottocomandi.

## Dati e strumenti adiacenti

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. I progetti gemelli (Wikidata, Wiktionary, Commons) si raggiungono allo stesso modo; punti `--api-url` al sottodominio giusto.

Per le domande che vanno un passo oltre un riassunto in wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — stesso modulo `x wkp`, instradato tramite l'indice Wikipedia di DuckDuckGo (gestisce meglio delle ricerche per titolo le query ambigue o colloquiali)
- `x ddgo <query>` — ricerca web generica, utile quando Wikipedia non ha una voce ma l'argomento esiste sul web aperto
- vedi la skill [knowledge](../knowledge/SKILL.md) per il toolkit di ricerca più ampio `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — ripiega sul browser quando ti serve davvero la pagina renderizzata (infobox, tabelle, immagini)