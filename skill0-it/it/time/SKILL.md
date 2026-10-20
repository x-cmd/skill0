---
name: time
description: |
  Temporizzazione dell'esecuzione dei comandi — precisione al microsecondo, analisi statistica, confronto.
  Zero barriere — usala con x-cmd o con il comando time integrato nella shell.
  Usala per "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Misura il tempo di esecuzione dei comandi. Dalla singola misura al microsecondo all'analisi statistica su più esecuzioni.

## Guida rapida

```bash
# Con x-cmd
x time <command>                      # Singola misura al microsecondo
x time stress -c 100 <command>        # Statistiche su 100 esecuzioni
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Confronta i comandi

# Senza x-cmd — usa i builtin della shell
time <command>                        # Misura di base
# Per il benchmarking usa un ciclo:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Cosa c'è a disposizione

- `x time <cmd>` — Singola esecuzione, precisione al microsecondo
- `x time getms <cmd>` — Precisione al millisecondo
- `x time stress -c N <cmd>` — N esecuzioni con statistiche complete
- `x time stress -b N <cmd>` — Sceglie da sola le esecuzioni entro il budget
- `x time cmp 'c1' 'c2'` — Confronta più comandi

## Formati di output

- `--csv` CSV per l'analisi programmativa
- `--tsv` Separato da tabulazione
- `--yml` YAML

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi di benchmarking
- Guida alla lettura delle statistiche
- Anti-pattern di prestazioni comuni

## Related