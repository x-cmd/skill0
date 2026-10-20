---
name: ccal
description: |
  Calendar pentru regiunea Chinei, cu 调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年.
  Mai multe moduri de acces: `x ccal`, descărcare directă a arhivei sau tsv.

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

调休 — regula în care un weekend poate fi împrumutat pentru a transforma o zi lucrătoare în zi liberă, sau o zi lucrătoare e cedată înapoi când un sărbătoare cade într-un weekend — e caracteristica-cheie pentru utilizatorii chinezeni care își planifică activitatea după calendarul oficial de lucru.

## Quick Start cu `x ccal`

```bash
# Show all date info in tsv form. TSV column as below:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Show all date info in tsv form
x ccal ls 2026-07
# Specific date in YAML
x ccal info 2026-05-31
# Get data directory. If it is empty, try `x ccal update`
x ccal datadir
```

`x ccal -h` pentru mai multe informații.

De reținut: sursa de date este https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Pentru a economisi spațiu, `x ccal` navighează în tar.xz folosind comanda tar, fără decompresie. Îndemnăm la această metodă, dar dacă ai nevoie de o procesare mai liberă, poți dezarhiva după nevoie.