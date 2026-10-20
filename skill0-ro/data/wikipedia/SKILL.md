---
name: wikipedia
description: |
  Caută și citește Wikipedia prin x wkp — MediaWiki API, fără cheie API,
  fără instalare; interogare, extragere, sugestii și rutare DDG într-un singur modul.
  Încarcă pentru wiki, wikipedia, encyclopedia lookup, article summary.

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

Ieșirea e o extragere în text simplu (~primul paragraf + infobox). Verbul din subcomandă alege forma — `hop` pentru căutare-apoi-rezumat, `extract` pentru titluri cunoscute, `search` pentru candidați, `suggest` pentru „ai vrut să spui". Site-ul implicit e Wikipedia în engleză; `--lang` / `--api-url` comută la alte wiki-uri.

## Quick Start cu `x wkp`

```bash
x wkp hop Python                      # search + first-result extract in one shot
x wkp extract OpenAI                  # summary of a known page
x wkp search "Linux kernel"           # list candidates when title is uncertain
x wkp suggest pythen                  # did-you-mean: correction hints before search
```

`x wkp -h` pentru toate flag-urile și subcomenzile.

## Date și unelte învecinate

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. Proiectele surori (Wikidata, Wiktionary, Commons) se accesează la fel; indică `--api-url` către subdomeniul potrivit.

Pentru întrebările care merg cu un hop mai departe decât un rezumat wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — același modul `x wkp`, rutat prin indexul Wikipedia al DuckDuckGo (tratează interogările ambigue sau colocviale mai bine decât căutarea pe titlu)
- `x ddgo <query>` — căutare web generală, utilă când Wikipedia nu are articol, dar subiectul există pe web-ul deschis
- Vezi skill-ul [knowledge](../knowledge/SKILL.md) pentru setul de cercetare mai larg `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — revino la browser când ai nevoie reală de pagina randată (infobox-uri, tabele, imagini)