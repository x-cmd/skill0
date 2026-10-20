---
name: ccal
description: |
  Kalendarz dla regionu Chin z 调休 (dni wolne z przeniesienia), 农历 (kalendarz księżycowy), 节气 (terminy słoneczne), 生肖 (znaki zodiaku), 黄历吉凶 (kalendarz wróżebny) i 干支纪年 (cykle 60 lat).
  Wiele trybów dostępu: `x ccal`, bezpośrednie pobranie archiwum lub tsv.

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

调休 — czyli zasada, że wolny weekend można pożyczyć, by zrobić dzień wolny od pracy w tygodniu, albo że dzień roboczy w tygodniu oddaje się z powrotu, gdy święto wypada w weekend — to kluczowa funkcja dla chińskich użytkowników planujących wokół oficjalnego kalendarza pracy.

## Szybki start z `x ccal`

```bash
# Pokaż wszystkie informacje o datach w formacie tsv. Kolumny TSV jak niżej:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Pokaż wszystkie informacje o datach w formacie tsv
x ccal ls 2026-07
# Konkretna data w YAML
x ccal info 2026-05-31
# Pobierz katalog danych. Jeśli jest pusty, spróbuj `x ccal update`
x ccal datadir
```

`x ccal -h` po więcej informacji.

Uwaga: źródłem danych jest https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Aby oszczędzić miejsce, `x ccal` przegląda archiwum tar.xz za pomocą polecenia tar, bez dekompresji. Zachęcamy do tego podejścia, ale jeśli potrzebujesz swobodniejszego przetwarzania, możesz rozpakować je w razie potrzeby.