---
name: ontology-database
description: Typisierter Wissensgraph über ein append-only TSV-Log — Entity-CRUD, gerichtete Relationen, Schema-Validierung, Multi-Hop-Reasoning. CLI über `x ondb`, Protokoll lesbar mit AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Typisierter Wissensgraph: alles ist eine **Entity** (id + type + properties), verbunden durch **gerichtete Relationen** (from → rel → to). Alle Mutationen hängen TSV-Zeilen an — sie überschreiben nie. Das TSV-Log IST die Datenbank.

## TSV-Logformat (das Protokoll)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # Entity anlegen
set     <id>  <epoch_ms>  key  val                             # Eigenschaft aktualisieren
rm      <id>  <epoch_ms>                                       # Entity löschen
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # Relation anlegen
unlink  <from>  <rel>  <to>  <epoch_ms>                        # Relation entfernen
# tabulatorgetrennt; Escapes: \t → Tab, \n → Zeilenumbruch, \\ → Backslash
# properties sind abwechselnde key/val-Paare (jedes ein eigenes Tab-Feld)
```

Jede Sprache liest das. AWK streamt, Python nutzt Dicts, SQLite materialisiert. **Das Log ist die Source of Truth.**

## CLI-Nutzung

```
x ondb add --type Person --name Alice                            # automatische UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # Entity-Details
x ondb set --id t1 status=done                                  # Eigenschaft aktualisieren
x ondb rm --id t1                                               # löschen

x ondb link --from proj_001 --rel has_task --to t1              # Relation anlegen
x ondb link --from t1 --rel blocks --to t2                      # mit Link-Properties: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # ausgehende Relationen
x ondb linked --id t1 --direction incoming                      # eingehend (wer verlinkt AUF)
x ondb related --id proj_001 --rel has_task --json              # volle Entity auf der anderen Seite

x ondb ls --type Task                                           # nach Typ auflisten
x ondb query --type Task --where status=open --json             # nach Properties filtern
```

`linked` = Relations-Metadaten. `related` = volle Entity auf der anderen Seite. Nutze `--dir <path>` / `-d <path>` für das Datenverzeichnis (→ `path/ondb.tsv`).

## Schema & Validierung

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # prüft required, enum, dangling refs, cardinality, cycles
```

Direktiven: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Die Validierung ist vom Schreiben getrennt.

## Architekturprinzipien

- **Log ist die Quelle** — das TSV-Log ist maßgeblich; SQLite ist eine materialisierte Sicht
- **Nur anhängen** — `set`, `rm`, `unlink` hängen Zeilen an; bestehende Zeilen werden nie verändert
- **Mehrere Instanzen** — ein ondb pro Subdomäne (Standard); zusammenführen nur für domänenübergreifende Ketten
- **Typ = Konzept** — derselbe Typname bedeutet immer dasselbe Konzept
- **Bei Bedarf validieren** — keine Schema-Prüfung beim Schreiben; nach Batch-Änderungen `validate` ausführen

## Backends

| Backend | Wann | |
|---|---|---|
| **AWK** (Standard) | < 2k Entities | Null Abhängigkeiten, streamend |
| Python | Mittel | reiche Datenstrukturen |
| JS/Bun | Web-Apps | JSON-nativ |
| SQLite | > 5k Entities | automatisch aus dem TSV-Log erzeugt |

## Verzeichnisstruktur

```
<datadir>/ONDB.DESC.txt    # Pflicht. Identifiziert die ondb-Instanz
<datadir>/ondb.tsv         # Append-only-Log
<datadir>/schema.tsv       # Optional. Randbedingungen
<datadir>/ondb.db          # Optional. SQLite-materialisierte Sicht
```

## Weitere Informationen

- `x ondb --help` — CLI-Referenz
- `x ondb libpath {awk,py,js}` — Bibliothekspfade für eigene Abfragen
- [ondb SKILL.md](../../../ondb/SKILL.md) — vollständige Doku (Szenarien, Integration, eigene Abfragen, SQLite-WAL-Konfiguration)

## Verwandt

- [yfm](../yfm/SKILL.md) — das yfm-`metadata:` ist die empfohlene Ingest-Oberfläche
- [rule](../rule/SKILL.md) — Schema-Validierungsregeln leben im rule-Framework
