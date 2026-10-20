---
name: ccal
description: |
  Calendrier région Chine avec 调休 (compensation de jours), 农历 (calendrier lunaire), 节气 (saisons solaires), 生肖 (zodiaque), 黄历 (almanach) 吉凶、干支纪年.
  Modes d'accès multiples : `x ccal`, téléchargement direct d'archive, ou tsv.

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

调休 — la règle qu'un week-end peut être emprunté pour faire un jour de semaine off, ou un jour de semaine rendu quand un jour férié tombe un week-end — est la fonctionnalité clé pour les utilisateurs chinois qui planifient autour du calendrier officiel.

## Démarrage rapide avec `x ccal`

```bash
# Affiche toutes les infos de date sous forme tsv. Colonnes TSV comme ci-dessous :
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(trois états:休，工，无 - pas de jour off ou travaillé dû à compensation)   Yi(宜)   Ji(忌)   Holiday
x ccal ls 2026
# Affiche toutes les infos de date sous forme tsv
x ccal ls 2026-07
# Date spécifique en YAML
x ccal info 2026-05-31
# Récupère le répertoire de données. S'il est vide, essayez `x ccal update`
x ccal datadir
```

`x ccal -h` pour plus d'infos.

Note : la source de données est https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Pour économiser l'espace, `x ccal` navigue dans le tar.xz en utilisant la commande tar sans décompression. Nous encourageons cette méthode, mais si vous avez besoin d'un traitement plus libre, vous pouvez décompresser à la demande.
