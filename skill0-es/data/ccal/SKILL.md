---
name: ccal
description: |
  Calendario de la región de China con 调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年.
  Múltiples modos de acceso: `x ccal`, descarga directa del archivo, o tsv.

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

调休 — la regla de que un fin de semana puede cederse para crear un día laborable, o de que un día laborable se devuelve cuando un festivo cae en fin de semana — es la característica clave para los usuarios chinos que planifican en torno al calendario laboral oficial.

## Inicio rápido con `x ccal`

```bash
# Muestra toda la info de fechas en forma tsv. Columnas del TSV:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Muestra toda la info de fechas en forma tsv
x ccal ls 2026-07
# Fecha concreta en YAML
x ccal info 2026-05-31
# Obtén el directorio de datos. Si está vacío, prueba con `x ccal update`
x ccal datadir
```

`x ccal -h` para más información.

Nota: la fuente de datos es https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Para ahorrar espacio, `x ccal` recorre el tar.xz con el comando tar sin descomprimirlo. Alentamos este método, pero si necesitas un procesamiento más libre puedes descomprimirlo según haga falta.
