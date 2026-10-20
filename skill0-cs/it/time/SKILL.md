---
name: time
description: |
  Měření času běhu příkazů — přesnost na mikrosekundy, statistická analýza, porovnání.
  Bez jakýchkoli překážek — použijte s x-cmd nebo vestavěným příkazem time shellu.
  Použijte pro "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Měřte čas běhu příkazů. Od jediného měření na mikrosekundy po statistickou analýzu více běhů.

## Rýchlý start

```bash
# S x-cmd
x time <command>                      # Jediné měření na mikrosekundy
x time stress -c 100 <command>        # Statistiky ze 100 běhů
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Porovná příkazy

# Bez x-cmd — použijte vestavěné příkazy shellu
time <command>                        # Základní měření
# Pro benchmarky použijte smyčku:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Co je k dispozici

- `x time <cmd>` — Jediný běh, přesnost na mikrosekundy
- `x time getms <cmd>` — Přesnost na milisekundy
- `x time stress -c N <cmd>` — N běhů s úplnými statistikami
- `x time stress -b N <cmd>` — Automaticky zvolí počet běhů podle rozpočtu
- `x time cmp 'c1' 'c2'` — Porovná více příkazů

## Výstupní formáty

- `--csv` CSV pro programovou analýzu
- `--tsv` Oddělené tabulátorem
- `--yml` YAML

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Vzory pro benchmarky
- Průvodce interpretací statistik
- Běžné antipatterny výkonu

## Související
