---
name: wikipedia
description: |
  Przeszukiwanie i czytanie Wikipedii za pomocą x wkp — API MediaWiki, bez klucza API,
  bez instalacji; zapytanie, wyciąg, podpowiedź i trasa DDG w jednym module.
  Wczytuj dla wiki, wikipedia, wyszukiwania w encyklopedii, streszczenia artykułu.

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

Wynikiem jest wyciąg w zwykłym tekście (~pierwszy akapit + infoboks). Czasownik podpolecenia wybiera kształt wyniku — `hop` dla wyszukania, a potem streszczenia, `extract` dla znanych tytułów, `search` dla kandydatów, `suggest` dla podpowiedzi typu „czy chodziło o". Domyślną witryną jest angielska Wikipedia; `--lang` / `--api-url` przełączają na inne wiki.

## Szybki start z `x wkp`

```bash
x wkp hop Python                      # wyszukanie + wyciąg pierwszego wyniku za jednym razem
x wkp extract OpenAI                  # streszczenie znanej strony
x wkp search "Linux kernel"           # lista kandydatów, gdy tytuł jest niepewny
x wkp suggest pythen                  # podpowiedź korekty przed wyszukaniem
```

`x wkp -h` dla wszystkich flag i podpoleceń.

## Dane i powiązane narzędzia

Źródło: `https://en.wikipedia.org/w/api.php` — API akcji MediaWiki. Projekty siostrzane (Wikidata, Wikisłownik, Wikimedia Commons) są osiągalne tą samą drogą; wskaż `--api-url` na odpowiednią subdomenę.

Na pytania wykraczające jeden krok dalej niż streszczenie w wikitekście:
- `x wkp : <query>` / `x wkp ddgo <query>` — ten sam moduł `x wkp`, ale trasowany przez indeks Wikipedii w DuckDuckGo (lepiej radzi sobie z zapytaniami niejednoznacznymi lub potocznymi niż wyszukiwanie po tytułach)
- `x ddgo <query>` — ogólne wyszukiwanie w sieci, przydatne, gdy Wikipedia nie ma artykułu, ale temat istnieje w otwartym internecie
- Zobacz umiejętność [knowledge](../knowledge/SKILL.md) z szerszym zestawem narzędzi badawczych `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — wróć do przeglądarki, gdy naprawdę potrzebujesz wyrenderowanej strony (infoboksy, tabele, obrazy)