---
name: time
description: |
  Cronometrarea execuției comenzilor — precizie la microsecundă, analiză statistică, comparație.
  Fără bariere — folosește cu x-cmd sau comanda time integrată în shell.
  Folosește pentru "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Măsoară timpul de execuție al comenzilor. De la o singură măsurătoare la microsecundă până la analiză statistică pe mai multe rulări.

## Quick Start

```bash
# With x-cmd
x time <command>                      # Single microsecond timing
x time stress -c 100 <command>        # 100-run statistics
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Compare commands

# Without x-cmd — use shell built-ins
time <command>                        # Basic timing
# For benchmarking, use a loop:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Ce e disponibil

- `x time <cmd>` — O singură rulare, precizie la microsecundă
- `x time getms <cmd>` — Precizie la milisecundă
- `x time stress -c N <cmd>` — N rulări cu statistici complete
- `x time stress -b N <cmd>` — Decide automat numărul de rulări în funcție de buget
- `x time cmp 'c1' 'c2'` — Compară mai multe comenzi

## Formate de ieșire

- `--csv` CSV pentru analiză programatică
- `--tsv` Separat prin tab
- `--yml` YAML

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare de benchmark
- Ghid de interpretare statistică
- Anti-patternuri uzuale de performanță

## Related