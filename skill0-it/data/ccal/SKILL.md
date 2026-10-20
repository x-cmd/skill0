---
name: ccal
description: |
  Calendario della regione Cina con 调休、农历、节气、生肖、黄历吉凶、干支纪年.
  Modalità di accesso multiple: `x ccal`, download diretto dell'archivio, o tsv.

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

调休 — la regola per cui un fine settimana può essere "preso in prestito" per creare un giorno feriale di riposo, o un giorno feriale restituito quando una festività cade di sabato o domenica — è la caratteristica chiave per gli utenti cinesi che pianificano attorno al calendario di lavoro ufficiale.

## Guida rapida con `x ccal`

```bash
# Mostra tutte le informazioni sulle date in forma tsv. Colonne TSV come segue:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(tre stati:休，工，无-非 调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Mostra tutte le informazioni sulle date in forma tsv
x ccal ls 2026-07
# Una data specifica in YAML
x ccal info 2026-05-31
# Ottieni la directory dei dati. Se è vuota, prova `x ccal update`
x ccal datadir
```

`x ccal -h` per maggiori informazioni.

Nota bene: la sorgente dei dati è https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Per risparmiare spazio, `x ccal` sfoglia il tar.xz usando il comando tar senza decomprimerlo. Lo incoraggiamo, ma se ti serve una gestione più libera puoi decomprimere come preferisci.