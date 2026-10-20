---
name: ontology-database
description: Typowany graf wiedzy oparty na dzienniku TSV tylko-do-dopisu — CRUD encji, relacje skierowane, walidacja schematu, rozumowanie wieloetapowe. CLI przez `x ondb`, protokół czytelny przez AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Typowany graf wiedzy: wszystko jest **encją** (id + typ + właściwości) połączoną **relacjami skierowanymi** (od → rel → do). Wszystkie mutacje dopisują linie TSV — nigdy nie nadpisują. Dziennik TSV JEST bazą danych.

## Format dziennika TSV (protokół)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # utwórz encję
set     <id>  <epoch_ms>  key  val                             # zaktualizuj właściwość
rm      <id>  <epoch_ms>                                       # usuń encję
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # utwórz relację
unlink  <from>  <rel>  <to>  <epoch_ms>                        # usuń relację
# rozdzielone tabulatorem; escapowanie: \t → tab, \n → nowa linia, \\ → backslash
# właściwości to naprzemienne pary klucz/wartość (każda to osobne pole rozdzielone tabulatorem)
```

Każdy język to odczyta. AWK strumieniuje, Python używa słowników, SQLite materializuje. **Dziennik jest źródłem prawdy.**

## Użycie CLI

```
x ondb add --type Person --name Alice                            # auto UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # szczegóły encji
x ondb set --id t1 status=done                                  # zaktualizuj właściwość
x ondb rm --id t1                                               # usuń

x ondb link --from proj_001 --rel has_task --to t1              # utwórz relację
x ondb link --from t1 --rel blocks --to t2                      # z właściwościami relacji: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relacje wychodzące
x ondb linked --id t1 --direction incoming                      # przychodzące (kto linkuje DO)
x ondb related --id proj_001 --rel has_task --json              # pełna encja po drugiej stronie

x ondb ls --type Task                                           # wypisz według typu
x ondb query --type Task --where status=open --json             # filtruj po właściwościach
```

`linked` = metadane relacji. `related` = pełna encja po drugiej stronie. Użyj `--dir <ścieżka>` / `-d <ścieżka>` dla katalogu danych (→ `ścieżka/ondb.tsv`).

## Schemat i walidacja

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # sprawdza required, enum, wiszące odwołania, kardynalność, cykle
```

Dyrektywy: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Walidacja jest oddzielna od zapisu.

## Zasady architektury

- **Dziennik jest źródłem** — dziennik TSV jest autorytatywny; SQLite to zmaterializowany widok
- **Tylko dopisywanie** — `set`, `rm`, `unlink` dopisują linie; nigdy nie modyfikują istniejących
- **Wiele instancji** — jeden ondb na subdomenę (domyślnie); scalaj tylko dla łańcuchów międzydomenowych
- **Typ = Pojęcie** — ta sama nazwa typu zawsze oznacza to samo pojęcie
- **Waliduj na żądanie** — brak sprawdzania schematu przy zapisie; uruchom `validate` po zmianach wsadowych

## Backendy

| Backend | Kiedy | |
|---|---|---|
| **AWK** (domyślny) | < 2 tys. encji | Zero zależności, strumieniowanie |
| Python | Średnie | Bogate struktury danych |
| JS/Bun | Aplikacje webowe | Natywne JSON |
| SQLite | > 5 tys. encji | Generowany automatycznie z dziennika TSV |

## Struktura katalogów

```
<datadir>/ONDB.DESC.txt    # Wymagany. Identyfikuje instancję ondb
<datadir>/ondb.tsv         # Dziennik tylko-do-dopisu
<datadir>/schema.tsv       # Opcjonalny. Ograniczenia
<datadir>/ondb.db          # Opcjonalny. Zmaterializowany widok SQLite
```

## Więcej informacji

- `x ondb --help` — referencja CLI
- `x ondb libpath {awk,py,js}` — ścieżki bibliotek do własnych zapytań
- [ondb SKILL.md](../../../ondb/SKILL.md) — pełna dokumentacja (scenariusze, integracja, własne zapytania, konfiguracja SQLite WAL)

## Powiązane

- [yfm](../yfm/SKILL.md) — `metadata:` w yfm to zalecana powierzchnia zasysania
- [rule](../rule/SKILL.md) — reguły walidacji schematu mieszkają w ramce rule