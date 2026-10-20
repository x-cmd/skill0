---
name: wikipedia
description: |
  Vyhledávání a čtení Wikipedie přes x wkp — MediaWiki API, bez API klíče,
  bez instalace; dotaz, extrakt, návrhy a DDG trasa v jediném modulu.
  Načítej pro wiki, wikipedia, dohledání v encyklopedii, shrnutí článku.

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

Výstup je textový extrakt (zhruba první odstavec + infobox). Podpříkaz jako sloveso určuje tvar — `hop` pro vyhledat-a-shrnout, `extract` pro známé názvy, `search` pro kandidáty, `suggest` pro „myslel jstech“. Výchozí je anglická Wikipedie; `--lang` / `--api-url` přepínají na jiné wiki.

## Rychlý start s `x wkp`

```bash
x wkp hop Python                      # vyhledání + extrakt prvního výsledku na jeden fuk
x wkp extract OpenAI                  # shrnutí známé stránky
x wkp search "Linux kernel"           # seznam kandidátů, když není jistý název
x wkp suggest pythen                  # „myslel jstech“: nápovědy k opravě před vyhledáním
```

`x wkp -h` pro všechny příznaky a podpříkazy.

## Data a související nástroje

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. Sesterské projekty (Wikidata, Wiktionary, Commons) jsou dostupné stejně; nasměruj `--api-url` na příslušnou subdoménu.

Pro otázky, které sahají o krok dál za shrnutí ve wikitextu:
- `x wkp : <query>` / `x wkp ddgo <query>` — stejný modul `x wkp`, ale trasovaný přes Wikipedický index DuckDuckGo (lépe zvládá nejednoznačné nebo hovorové dotazy než hledání podle názvu)
- `x ddgo <query>` — obecné webové vyhledávání, užitečné, když Wikipedie článek nemá, ale téma existuje na otevřeném webu
- Podívej se na skill [knowledge](../knowledge/SKILL.md) pro širší sadu nástrojů `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — vrať se k prohlížeči, když opravdu potřebuješ vykreslenou stránku (infoboxy, tabulky, obrázky)
