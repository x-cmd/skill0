---
name: time
description: |
  Cronometraje de la ejecución de comandos — precisión de microsegundos, análisis estadístico, comparación.
  Sin barreras — úsalo con x-cmd o con el comando time integrado del shell.
  Úsalo para "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Mide el tiempo de ejecución de comandos. Desde un cronometraje único de microsegundos hasta el análisis estadístico de múltiples ejecuciones.

## Inicio rápido

```bash
# Con x-cmd
x time <command>                      # Cronometraje único de microsegundos
x time stress -c 100 <command>        # Estadísticas de 100 ejecuciones
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Comparar comandos

# Sin x-cmd — usa los built-ins del shell
time <command>                        # Cronometraje básico
# Para benchmarks, usa un bucle:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Qué hay disponible

- `x time <cmd>` — Una ejecución, precisión de microsegundos
- `x time getms <cmd>` — Precisión de milisegundos
- `x time stress -c N <cmd>` — N ejecuciones con estadísticas completas
- `x time stress -b N <cmd>` — Decide las ejecuciones automáticamente según el presupuesto
- `x time cmp 'c1' 'c2'` — Comparar varios comandos

## Formatos de salida

- `--csv` CSV para análisis programático
- `--tsv` Separado por tabuladores
- `--yml` YAML

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones de benchmarking
- Guía de interpretación estadística
- Antipatrones comunes de rendimiento

## Relacionadas

