---
name: ccal
description: |
  Kalender für die chinesische Region mit 调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年.
  Mehrere Zugriffsmodi: `x ccal`, direkter Archiv-Download oder tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — die Regel, dass ein Wochenende "geliehen" werden kann, um daraus einen freien Wochentag zu machen, oder dass bei einem Feiertag am Wochenende ein Wochentag zurückgegeben wird — ist das zentrale Merkmal für chinesische Nutzer, die ihren Plan am offiziellen Arbeitskalender ausrichten.

## Schnellstart mit `x ccal`

```bash
# Alle Datumsinformationen als tsv anzeigen. TSV-Spalten wie folgt:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Alle Datumsinformationen als tsv anzeigen
x ccal ls 2026-07
# Bestimmtes Datum als YAML
x ccal info 2026-05-31
# Datenverzeichnis holen. Ist es leer, probiere `x ccal update`
x ccal datadir
```

`x ccal -h` für mehr Infos.

Hinweis: die Datenquelle ist https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Um Platz zu sparen, navigiert `x ccal` das tar.xz mit dem Befehl tar, ohne es zu entpacken. Wir ermutigen zu dieser Methode, wenn du aber freier verarbeiten brauchst, kannst du es nach Bedarf entpacken.
