---
name: skill0-writer
description: Schreibkonventionen für skill0-Dokumente — Pyramidenstruktur, Zeilenlimits und Layoutregeln.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Skill0-Dokumente folgen dem **Pyramidenprinzip**: Agenten lesen möglicherweise nur die ersten 10–30 Zeilen, deshalb muss die wichtigste Information zuerst kommen. Details nach Zeile 30 sind der Bonus, nicht die Last.

## Was keine Regel einfängt

- **Klarheit schlägt Kürze.** Ein kurzes Dokument, das die falsche Antwort gibt, ist schlimmer als ein langes, das die richtige gibt.
- **Sicherheits-/Schutzhinweise MÜSSEN explizit sein** — nutze MUST, NEVER, DO NOT. Formuliere Einschränkungen als vollständige Aussagen, nicht als Klammerbeifänge.
- **Allgemeinwissen nicht ausbreiten.** Wenn ein Konventionswort plus ein oder zwei Sätze den Punkt transportiert, hör auf. Der Leser weiß schon, was YAML, git und ein Cache sind; gib den Kontext stattdessen für das aus, was spezifisch für dieses Repo ist. Begründung ist der übliche Übeltäter — gib den Grund einer Regel nur an, wenn sie ohne ihn falsch wirkt. (`sw-1200`)
- **Tabellen nur für echte Matrizen.** 3+ Spalten, deren Zeilen gegeneinander gelesen werden müssen. Eine zweispaltige Tabelle ist eine Liste in Tabellensyntax — schreibe die Liste. Ein Datensatz gehört in eine externe `.tsv` neben dem Dokufile, verlinkt, damit `x tsv` ihn abfragen kann. (`sw-1250`)

## YFM — nur `SKILL.md`

```yaml
---
name: <slug>                  # muss dem Verzeichnisnamen entsprechen
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` und `description` sind tragend. Alles andere verschachtelt unter dem `metadata:`-Block aus [yfm](../yfm/SKILL.md) als kommagetrennte Skalare — optional, und es fügt Struktur für Indizierung, Entdeckung und Ontologie-Hooks hinzu.

**Sub-Dateien tragen kein YFM.** Nur `SKILL.md` wird von einem Loader gefiltert, deshalb braucht nur diese Datei Front Matter. Jede andere Datei (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) wird direkt von einem Agenten gelesen, der sich bereits entschieden hat, sie zu öffnen — YFM dort ist reiner Token-Kostenaufschlag, weil es einen Zweck wiederholt, den Titel und erste Zeile bereits geben. Starte diese Dateien mit der `#`-Überschrift. Abweichen erfordert einen genannten Grund in der Datei selbst.

Für chinesisch lokalisierte Fassungen nutze eine parallele `SKILL.cn.md` (eine pro Skill). Mische keine Sprachen innerhalb einer einzigen Datei.

## Mechanische Prüfungen

Sie leben in [skill0-writer.rule.yml](skill0-writer.rule.yml). Führe `x rule lint skill0-writer.rule.yml` und `x rule check -r skill0-writer.rule.yml lib/skill0/` aus. Abdeckung: YFM-Präsenz + name/description-Felder, Namensformat, Zeilenzahl ≤ 100 (ideal 50), Abschnittsreihenfolge install → usage → advanced → links, nur Englisch, kein Intro / keine Schlussfolgerung / keine Wiederholung, keine verwaisten Dateien.

## Prüfung auf Kürzungssicherheit

Prüfe nach dem Schreiben bei Zeile 30: würde ein Agent, der hier stoppt, ein falsches Verständnis entwickeln?

Falls ja, verschiebe die entscheidende Einschränkung nach vorne. Die ersten 30 Zeilen müssen ein korrektes (wenn auch unvollständiges) mentales Modell liefern. Nach Zeile 30 mit Details ausbauen — die Pyramide korrigiert sich selbst.

## Zwei-Schichten-Laden: description zum Matching, body als Referenz

Skill-Loader (Claude Code, Cursor, Continue, etc.) laden SKILL.md in zwei Stufen:

  1. **YFM `description:`** — automatisch in den Katalog des Agenten
     geladen, zum Matching. Der Agent liest die Beschreibung, um zu
     entscheiden, ob er den Skill lädt.
  2. **Body** — bei einem Treffer on-demand geladen. Referenzmaterial.

Folgen:

- **Description** = *was es ist + wann man es lädt* — dicht an Keywords,
  triggerreich, knapp.
- **Body** = *wie man es benutzt + Referenz* — Beispiele, Schemata, Randfälle,
  Links zu tieferer Doku.

**Inhalte nicht über die beiden Schichten hinweg duplizieren.** Was die Description transportiert, sollte der Body *ausbauen*, nicht denselben Text wiederholen. Insbesondere der erste Absatz des Bodys darf nicht dieselben Features auflisten wie die Description — der Body führt mit Referenz, nicht mit einer zweiten Zusammenfassung.

Ein praktischer Test: Wenn du die Description komplett löschst und nur die ersten 30 Zeilen des Bodys liest, sollte der Agent immer noch sehen, was der Skill tut und wann er ihn lädt. Wenn nur die Description diese Information trägt, hat der Body oben nichts zu ergänzen — verschiebe die Erklärung in den Body und lass die Description die Schlagzeile tragen.

## Ein Skill ist ein Wissenspaket, kein Tutorial

Ein Skill-Body ist ein **Briefing für das LLM**, kein Kurs für Anfänger.

- **Fähigkeiten** stecken im LLM. Der Body lehrt nicht.
- **Wissen** steckt in den x-cmd-Datenwerkzeugen (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) und externen Quellen. Der Body zeigt darauf; der Agenten holt es erneut.
- **Rahmen** ist die Aufgabe des Skills: benennt die Problemform, die Konvention, die strukturierte Ausgabe, das zu verwendende x-cmd-Werkzeug.

Ein Skill trägt den Lösungswinkel, die Konvention, die Ausgabeform und Quellverweise. Er trägt **nicht** Fähigkeiten (das LLM hat sie bereits), statische Daten (die veralten) oder Tutorials (nutze Sidecars).

Wo Details zu feingranular oder zu aktuell sind, schiebe sie in ein Sidecar (`references/`, `ANALYTICS.md`) oder in eine extern immer aktuell gehaltene Doku.

## Externe Links

Sammle zwei Arten: **Root-Links** (Einstiegspunkte wie `llms.txt`, Doku-Index) und **nützliche Links** (gezielte Links zu den 20 % der Doku, die 80 % der Anwendungsfälle abdecken). Root zuerst auflisten, danach die nützlichen — KI versteht Reihenfolge. **Keine Duplikation**, es sei denn, die Betonung ist entscheidend.

## Weiche Einschränkungen (Ermessensfragen)

- **Sub-Dateien (CLEANUP.md, references/*)** dürfen länger sein als SKILL.md, aber die ersten 20 Zeilen tragen weiterhin die Last (gleiche Pyramide).
- **MUSS** von der übergeordneten SKILL.md auf jede Sub-Datei verlinken (Vorwärtslink Pflicht). Ein Rücklink zur übergeordneten SKILL.md aus einer Sub-Datei ist **optional** — usecase-Dateien referenzieren den Elternteil implizit über ihren Pfad. Durchgesetzt von `sw-1000-no-orphan-docs` in [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Spekulation** — gib getestete Fakten an oder kennzeichne sie als "ungeprüft".
- **Emojis**, sofern das Thema des Skills sie nicht verlangt.

## Verwandt

- [yfm](../yfm/SKILL.md) — YFM-Konvention, die skill0-writer in Schicht 1 durchsetzt
- [naming](../naming/SKILL.md) — Naming folgt ebenfalls den Writer-Regeln
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — mechanische Durchsetzung
