---
name: time
description: |
  Zeitmessung von Befehlsausführung — Mikrosekunden-Präzision, statistische Analyse, Vergleich.
  Null Hürde — mit x-cmd oder dem eingebauten Shell-Befehl time verwenden.
  Für "Timing", "Benchmark", "Performance", "Profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Ausführungszeit von Befehlen messen. Von der einmaligen Mikrosekunden-Messung bis zur statistischen Analyse über mehrere Läufe.

## Schnellstart

```bash
# Mit x-cmd
x time <command>                      # Einzelne Mikrosekunden-Messung
x time stress -c 100 <command>        # Statistik über 100 Läufe
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Befehle vergleichen

# Ohne x-cmd — Shell-Builtins verwenden
time <command>                        # Einfache Messung
# Für Benchmarks eine Schleife verwenden:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Was verfügbar ist

- `x time <cmd>` — ein Lauf, Mikrosekunden-Präzision
- `x time getms <cmd>` — Millisekunden-Präzision
- `x time stress -c N <cmd>` — N Läufe mit vollständiger Statistik
- `x time stress -b N <cmd>` — Läufe innerhalb des Budgets automatisch bestimmen
- `x time cmp 'c1' 'c2'` — mehrere Befehle vergleichen

## Ausgabeformate

- `--csv` CSV für programmatische Analyse
- `--tsv` tabulatorgetrennt
- `--yml` YAML

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Benchmarking-Muster
- Leitfaden zur statistischen Interpretation
- Häufige Performance-Antimuster

## Verwandt
