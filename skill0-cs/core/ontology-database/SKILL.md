---
name: ontology-database
description: Typovaný znalostní graf přes připojovací TSV log — CRUD entit, směrované relace, validace schématu, víceskokové uvažování. CLI přes `x ondb`, protokol čitelný AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Typovaný znalostní graf: vše je **entita** (id + typ + vlastnosti) propojená **směrovanými relacemi** (from → rel → to). Všechny mutace přidávají řádky TSV — nikdy nepřepisují. TSV log JEST databází.

## Formát TSV logu (protokol)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # vytvoří entitu
set     <id>  <epoch_ms>  key  val                             # aktualizuje vlastnost
rm      <id>  <epoch_ms>                                       # smaže entitu
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # vytvoří relaci
unlink  <from>  <rel>  <to>  <epoch_ms>                        # odstraní relaci
# odděleno tabulátorem; escape: \t → tab, \n → nový řádek, \\ → zpětné lomítko
# vlastnosti jsou střídající se dvojice key/val (každá je samostatné pole oddělené tabulátorem)
```

Tohle přečte jakýkoli jazyk. AWK prouduje, Python používá slovníky, SQLite materializuje. **Log je zdroj pravdy.**

## Použití CLI

```
x ondb add --type Person --name Alice                            # automatický UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # detail entity
x ondb set --id t1 status=done                                  # aktualizuje vlastnost
x ondb rm --id t1                                               # smaže

x ondb link --from proj_001 --rel has_task --to t1              # vytvoří relaci
x ondb link --from t1 --rel blocks --to t2                      # s vlastnostmi relace: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # odchozí relace
x ondb linked --id t1 --direction incoming                      # příchozí (kdo odkazuje NA)
x ondb related --id proj_001 --rel has_task --json              # celá entita na druhé straně

x ondb ls --type Task                                           # seznam podle typu
x ondb query --type Task --where status=open --json             # filtrování podle vlastností
```

`linked` = metadata relace. `related` = celá entita na druhé straně. Pro datový adresář použijte `--dir <path>` / `-d <path>` (→ `path/ondb.tsv`).

## Schéma a validace

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # kontroluje required, enum, visící odkazy, kardinalitu, cykly
```

Direktivy: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Validace je oddělená od zápisu.

## Architektonické principy

- **Log je zdroj** — TSV log je autoritativní; SQLite je materializovaný pohled
- **Pouze přidávání** — `set`, `rm`, `unlink` přidávají řádky; nikdy se neupravují existující
- **Více instancí** — jedna ondb na sub-doménu (výchozí); slučujte jen pro řetězce napříč doménami
- **Typ = Koncept** — stejný název typu vždy znamená stejný koncept
- **Validujte na vyžádání** — žádná kontrola schématu při zápisu; po dávkových změnách spusťte `validate`

## Backendy

| Backend | Kdy | |
|---|---|---|
| **AWK** (výchozí) | < 2k entit | Bez závislostí, proudové zpracování |
| Python | Střední | Bohaté datové struktury |
| JS/Bun | Webové aplikace | Nativní JSON |
| SQLite | > 5k entit | Automaticky generováno z TSV logu |

## Struktura adresářů

```
<datadir>/ONDB.DESC.txt    # Povinné. Identifikuje instanci ondb
<datadir>/ondb.tsv         # Log pouze s přidáváním
<datadir>/schema.tsv       # Volitelné. Omezení
<datadir>/ondb.db          # Volitelné. Materializovaný pohled SQLite
```

## Další informace

- `x ondb --help` — reference CLI
- `x ondb libpath {awk,py,js}` — cesty ke knihovnám pro vlastní dotazy
- [ondb SKILL.md](../../../ondb/SKILL.md) — úplná dokumentace (scénáře, integrace, vlastní dotazy, konfigurace SQLite WAL)

## Související

- [yfm](../yfm/SKILL.md) — yfm `metadata:` je doporučená vstupní plocha pro ingest
- [rule](../rule/SKILL.md) — pravidla validace schématu žijí ve frameworku rule
