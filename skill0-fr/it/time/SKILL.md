---
name: time
description: |
  Mesure du temps d'exécution de commande — précision microseconde, analyse statistique, comparaison.
  Zéro barrière — à utiliser avec x-cmd ou la commande shell time intégrée.
  À utiliser pour « timing », « benchmark », « performance », « profiling ».

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Mesurez le temps d'exécution d'une commande. Du chronométrage microseconde one-shot à l'analyse statistique multi-runs.

## Démarrage rapide

```bash
# Avec x-cmd
x time <commande>                      # Chronométrage microseconde unique
x time stress -c 100 <commande>        # Statistiques sur 100 runs
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Comparer des commandes

# Sans x-cmd — utilisez les built-ins shell
time <commande>                        # Chronométrage basique
# Pour du benchmarking, utilisez une boucle :
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <commande>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Ce qui est disponible

- `x time <cmd>` — Run unique, précision microseconde
- `x time getms <cmd>` — Précision milliseconde
- `x time stress -c N <cmd>` — N runs avec stats complètes
- `x time stress -b N <cmd>` — Décide auto des runs dans le budget
- `x time cmp 'c1' 'c2'` — Comparer plusieurs commandes

## Formats de sortie

- `--csv` CSV pour analyse programmatique
- `--tsv` Séparé par tabulations
- `--yml` YAML

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs de benchmarking
- Guide d'interprétation statistique
- Anti-patterns de performance courants

## Related

