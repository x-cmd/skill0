---
name: ontology-database
description: Graf de cunoștințe tipizat printr-un log TSV append-only — CRUD pe entități, relații orientate, validare de schemă, raționament multi-hop. CLI prin `x ondb`, protocol lizibil de AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Graf de cunoștințe tipizat: totul e o **entitate** (id + type + properties) conectată prin **relații orientate** (from → rel → to). Toate mutațiile adaugă linii TSV — nu suprascriu niciodată. Logul TSV ESTE baza de date.

## Formatul logului TSV (protocolul)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # create entity
set     <id>  <epoch_ms>  key  val                             # update property
rm      <id>  <epoch_ms>                                       # delete entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # create relation
unlink  <from>  <rel>  <to>  <epoch_ms>                        # remove relation
# tab-separated; escape: \t → tab, \n → newline, \\ → backslash
# properties are alternating key/val pairs (each is a separate tab field)
```

Orice limbaj îl citește. AWK face streaming, Python dicturi, SQLite materializează. **Logul e sursa de adevăr.**

## Utilizare CLI

```
x ondb add --type Person --name Alice                            # auto UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # entity detail
x ondb set --id t1 status=done                                  # update prop
x ondb rm --id t1                                               # delete

x ondb link --from proj_001 --rel has_task --to t1              # create relation
x ondb link --from t1 --rel blocks --to t2                      # with link props: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # outgoing relations
x ondb linked --id t1 --direction incoming                      # incoming (who links TO)
x ondb related --id proj_001 --rel has_task --json              # full entity on other side

x ondb ls --type Task                                           # list by type
x ondb query --type Task --where status=open --json             # filter by props
```

`linked` = metadata relației. `related` = entitatea completă din cealaltă parte. Folosește `--dir <path>` / `-d <path>` pentru directorul de date (→ `path/ondb.tsv`).

## Schemă și validare

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # checks required, enum, dangling refs, cardinality, cycles
```

Directive: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Validarea e separată de scriere.

## Principii de arhitectură

- **Logul e sursa** — logul TSV e autoritativ; SQLite e o vedere materializată
- **Doar adăugare** — `set`, `rm`, `unlink` adaugă linii; nu modifică niciodată linii existente
- **Instanțe multiple** — un ondb per sub-domeniu (implicit); unește doar pentru lanțuri cross-domain
- **Type = Concept** — același nume de tip înseamnă întotdeauna același concept
- **Validează la cerere** — nicio verificare de schemă la scriere; rulează `validate` după modificări în lot

## Backends

| Backend | Când | |
|---|---|---|
| **AWK** (implicit) | < 2k entități | Fără dependințe, streaming |
| Python | Mediu | Structuri de date bogate |
| JS/Bun | Aplicații web | JSON nativ |
| SQLite | > 5k entități | Generat automat din logul TSV |

## Structura de directoare

```
<datadir>/ONDB.DESC.txt    # Required. Identifies ondb instance
<datadir>/ondb.tsv         # Append-only log
<datadir>/schema.tsv       # Optional. Constraints
<datadir>/ondb.db          # Optional. SQLite materialized view
```

## Pentru mai multe informații

- `x ondb --help` — referință CLI
- `x ondb libpath {awk,py,js}` — căi de biblioteci pentru interogări personalizate
- [ondb SKILL.md](../../../ondb/SKILL.md) — documentație completă (scenarii, integrare, interogări personalizate, config SQLite WAL)

## Related

- [yfm](../yfm/SKILL.md) — `metadata:` din yfm e suprafața de ingest recomandată
- [rule](../rule/SKILL.md) — regulile de validare de schemă trăiesc în framework-ul rule