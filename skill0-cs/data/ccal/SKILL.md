---
name: ccal
description: |
  Kalendář pro čínský region s 调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年.
  Více způsobů přístupu: `x ccal`, přímé stažení archivu, nebo tsv.

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

调休 — pravidlo, podle kterého lze půjčit víkend, aby vznikl den volna ve všední den, nebo naopak odevzdat všední den, když svátek připadá na víkend — je hlavní funkcí pro uživatele z Číny, kteří plánují podle oficiálního pracovního kalendáře.

## Rychlý start s `x ccal`

```bash
# Zobrazí všechny údaje o datech ve formátu tsv. Sloupce TSV jsou následující:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Zobrazí všechny údaje o datech ve formátu tsv
x ccal ls 2026-07
# Konkrétní datum ve formátu YAML
x ccal info 2026-05-31
# Získá adresář s daty. Pokud je prázdný, zkus `x ccal update`
x ccal datadir
```

`x ccal -h` pro další informace.

Pozor: zdrojem dat je https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Pro úsporu místa `x ccal` prochází archiv tar.xz příkazem tar bez rozbalování. Tento postup doporučujeme, ale pokud potřebuješ volnější zpracování, můžeš archiv podle potřeby rozbalit.
