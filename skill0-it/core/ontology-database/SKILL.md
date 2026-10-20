---
name: ontology-database
description: Grafo della conoscenza tipizzato via log TSV in sola aggiunta — CRUD delle entità, relazioni dirette, validazione dello schema, ragionamento multi-hop. CLI con `x ondb`, protocollo leggibile da AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Grafo della conoscenza tipizzato: tutto è un'**entità** (id + type + properties) collegata da **relazioni dirette** (from → rel → to). Tutte le mutazioni aggiungono righe TSV — non sovrascrivono mai. Il log TSV È il database.

## Formato del log TSV (il protocollo)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # crea entità
set     <id>  <epoch_ms>  key  val                             # aggiorna proprietà
rm      <id>  <epoch_ms>                                       # elimina entità
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # crea relazione
unlink  <from>  <rel>  <to>  <epoch_ms>                        # rimuove relazione
# separato da tab; escape: \t → tab, \n → newline, \\ → backslash
# le proprietà sono coppie chiave/valore alternate (ciascuna è un campo tab separato)
```

Qualsiasi linguaggio lo legge. AWK fa streaming, Python usa dizionari, SQLite materializza. **Il log è la fonte di verità.**

## Uso da CLI

```
x ondb add --type Person --name Alice                            # UUID automatico
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # dettaglio dell'entità
x ondb set --id t1 status=done                                  # aggiorna la proprietà
x ondb rm --id t1                                               # elimina

x ondb link --from proj_001 --rel has_task --to t1              # crea relazione
x ondb link --from t1 --rel blocks --to t2                      # con proprietà del link: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relazioni in uscita
x ondb linked --id t1 --direction incoming                      # in entrata (chi punta A)
x ondb related --id proj_001 --rel has_task --json              # entità completa dall'altro lato

x ondb ls --type Task                                           # elenca per tipo
x ondb query --type Task --where status=open --json             # filtra per proprietà
```

`linked` = metadati della relazione. `related` = entità completa dall'altro lato. Usa `--dir <path>` / `-d <path>` per la directory dei dati (→ `path/ondb.tsv`).

## Schema e validazione

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # controlla required, enum, riferimenti pendenti, cardinalità, cicli
```

Direttive: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. La validazione è separata dalla scrittura.

## Principi architetturali

- **Il log è la fonte** — il log TSV è autorevole; SQLite è una vista materializzata
- **Solo aggiunte** — `set`, `rm`, `unlink` aggiungono righe; non modificano mai quelle esistenti
- **Istanze multiple** — un ondb per sottodominio (predefinito); si unisce solo per catene cross-dominio
- **Type = Concept** — lo stesso nome di tipo indica sempre lo stesso concetto
- **Valida a richiesta** — nessun controllo dello schema in scrittura; esegui `validate` dopo le modifiche in blocco

## Backend

| Backend | Quando | |
|---|---|---|
| **AWK** (predefinito) | < 2k entità | Zero dipendenze, in streaming |
| Python | Medio | Strutture dati ricche |
| JS/Bun | App web | JSON nativo |
| SQLite | > 5k entità | Generato automaticamente dal log TSV |

## Struttura delle directory

```
<datadir>/ONDB.DESC.txt    # Obbligatorio. Identifica l'istanza ondb
<datadir>/ondb.tsv         # Log in sola aggiunta
<datadir>/schema.tsv       # Opzionale. Vincoli
<datadir>/ondb.db          # Opzionale. Vista SQLite materializzata
```

## Per maggiori informazioni

- `x ondb --help` — riferimento della CLI
- `x ondb libpath {awk,py,js}` — percorsi delle librerie per query personalizzate
- [ondb SKILL.md](../../../ondb/SKILL.md) — documentazione completa (scenari, integrazione, query personalizzate, configurazione SQLite WAL)

## Related

- [yfm](../yfm/SKILL.md) — il `metadata:` di yfm è la superficie di ingest consigliata
- [rule](../rule/SKILL.md) — le regole di validazione dello schema vivono nel framework rule