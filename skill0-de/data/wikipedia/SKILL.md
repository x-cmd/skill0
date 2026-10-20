---
name: wikipedia
description: |
  Wikipedia über x wkp durchsuchen und lesen — MediaWiki-API, kein API-Schlüssel,
  keine Installation; Abfrage, Extrakt, Vorschläge und DDG-Routing in einem Modul.
  Laden für wiki, wikipedia, Enzyklopädie-Nachschlag, Artikelzusammenfassung.

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

Die Ausgabe ist ein Klartext-Extrakt (~erster Absatz + Infobox). Das Verb des Unterbefehls bestimmt die Form — `hop` für suchen-dann-zusammenfassen, `extract` für bekannte Titel, `search` für Kandidaten, `suggest` für meintest-du. Standard-Site ist die englische Wikipedia; `--lang` / `--api-url` wechseln zu anderen Wikis.

## Schnellstart mit `x wkp`

```bash
x wkp hop Python                      # suchen + Extrakt des Treffers in einem Zug
x wkp extract OpenAI                  # Zusammenfassung einer bekannten Seite
x wkp search "Linux kernel"           # Kandidaten auflisten, wenn der Titel unsicher ist
x wkp suggest pythen                  # meintest-du: Korrekturhinweise vor der Suche
```

`x wkp -h` für alle Flags und Unterbefehle.

## Daten und angrenzende Werkzeuge

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. Schwesterprojekte (Wikidata, Wiktionary, Commons) sind genauso erreichbar; richte `--api-url` auf die passende Subdomain.

Für Fragen, die einen Hop über eine Wikitext-Zusammenfassung hinausgehen:
- `x wkp : <query>` / `x wkp ddgo <query>` — dasselbe `x wkp`-Modul, geroutet über DuckDuckGos Wikipedia-Index (handelt mehrdeutige oder umgangssprachliche Abfragen besser als die Titelsuche)
- `x ddgo <query>` — allgemeine Websuche, nützlich, wenn Wikipedia keinen Artikel hat, das Thema aber im offenen Web existiert
- Siehe den Skill [knowledge](../knowledge/SKILL.md) für das breitere Recherche-Toolkit `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — zurück zum Browser, wenn du wirklich die gerenderte Seite brauchst (Infoboxen, Tabellen, Bilder)
