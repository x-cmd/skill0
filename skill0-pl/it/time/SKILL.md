---
name: time
description: |
  Pomiar czasu wykonania poleceń — precyzja mikrosekundowa, analiza statystyczna, porównania.
  Bez barier — użyj z x-cmd albo wbudowanym poleceniem time shella.
  Użyj dla "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Mierz czas wykonania poleceń. Od pojedynczego pomiaru w mikrosekundach po analizę statystyczną wielu przebiegów.

## Szybki start

```bash
# Z x-cmd
x time <command>                      # Pojedynczy pomiar w mikrosekundach
x time stress -c 100 <command>        # Statystyki z 100 przebiegów
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Porównaj polecenia

# Bez x-cmd — użyj wbudowanych poleceń shella
time <command>                        # Pomiar podstawowy
# Do benchmarkingu użyj pętli:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Co jest dostępne

- `x time <cmd>` — pojedynczy przebieg, precyzja mikrosekundowa
- `x time getms <cmd>` — precyzja milisekundowa
- `x time stress -c N <cmd>` — N przebiegów z pełnymi statystykami
- `x time stress -b N <cmd>` — automatycznie dobrana liczba przebiegów w ramach budżetu
- `x time cmp 'c1' 'c2'` — porównanie wielu poleceń

## Formaty wyjścia

- `--csv` CSV do analizy programistycznej
- `--tsv` rozdzielone tabulatorami
- `--yml` YAML

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Wzorce benchmarkingu
- Przewodnik interpretacji statystyk
- Typowe antywzorce wydajności

## Powiązane