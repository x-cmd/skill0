---
name: ontology-database
description: Graphe de connaissances typé via journal append-only TSV — CRUD d'entités, relations dirigées, validation de schéma, raisonnement multi-sauts. CLI via `x ondb`, protocole lisible par AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Graphe de connaissances typé : tout est une **entité** (id + type + propriétés) reliée par des **relations dirigées** (from → rel → to). Toutes les mutations ajoutent des lignes TSV — jamais d'écrasement. Le journal TSV EST la base de données.

## Format du journal TSV (le protocole)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # créer une entité
set     <id>  <epoch_ms>  key  val                             # mettre à jour une propriété
rm      <id>  <epoch_ms>                                       # supprimer une entité
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # créer une relation
unlink  <from>  <rel>  <to>  <epoch_ms>                        # supprimer une relation
# séparé par des tabulations ; échappement : \t → tab, \n → newline, \\ → backslash
# les propriétés sont des paires key/val alternées (chacune est un champ tab séparé)
```

N'importe quel langage lit ceci. AWK streame, Python fait des dicts, SQLite matérialise. **Le journal est la source de vérité.**

## Usage CLI

```
x ondb add --type Person --name Alice                            # UUID auto
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # détail entité
x ondb set --id t1 status=done                                  # maj propriété
x ondb rm --id t1                                               # supprimer

x ondb link --from proj_001 --rel has_task --to t1              # créer relation
x ondb link --from t1 --rel blocks --to t2                      # avec props de lien : -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relations sortantes
x ondb linked --id t1 --direction incoming                      # entrantes (qui pointe VERS)
x ondb related --id proj_001 --rel has_task --json              # entité complète de l'autre côté

x ondb ls --type Task                                           # lister par type
x ondb query --type Task --where status=open --json             # filtrer par propriétés
```

`linked` = métadonnées de relation. `related` = entité complète de l'autre côté. Utilisez `--dir <path>` / `-d <path>` pour le répertoire de données (→ `path/ondb.tsv`).

## Schéma et validation

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # vérifie required, enum, refs pendouillantes, cardinalité, cycles
```

Directives : `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. La validation est séparée de l'écriture.

## Principes d'architecture

- **Le journal est la source** — le TSV log fait autorité ; SQLite est une vue matérialisée
- **Append-only** — `set`, `rm`, `unlink` ajoutent des lignes ; ne jamais modifier une ligne existante
- **Instances multiples** — un ondb par sous-domaine (par défaut) ; fusionner uniquement pour les chaînes inter-domaines
- **Type = Concept** — un même nom de type signifie toujours le même concept
- **Valider à la demande** — pas de vérification de schéma à l'écriture ; lancez `validate` après des changements en masse

## Backends

| Backend | Quand | |
|---|---|---|
| **AWK** (par défaut) | < 2k entités | Zéro dépendance, streaming |
| Python | Moyen | Structures de données riches |
| JS/Bun | Apps web | JSON natif |
| SQLite | > 5k entités | Généré automatiquement depuis le journal TSV |

## Structure de répertoires

```
<datadir>/ONDB.DESC.txt    # Requis. Identifie l'instance ondb
<datadir>/ondb.tsv         # Journal append-only
<datadir>/schema.tsv       # Optionnel. Contraintes
<datadir>/ondb.db          # Optionnel. Vue matérialisée SQLite
```

## Pour aller plus loin

- `x ondb --help` — référence CLI
- `x ondb libpath {awk,py,js}` — chemins de librairies pour requêtes personnalisées
- [ondb SKILL.md](../../../ondb/SKILL.md) — doc complète (scénarios, intégration, requêtes personnalisées, config SQLite WAL)

## Related

- [yfm](../yfm/SKILL.md) — le `metadata:` yfm est la surface d'ingestion recommandée
- [rule](../rule/SKILL.md) — les règles de validation de schéma vivent dans le framework rule
