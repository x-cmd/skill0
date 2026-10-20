---
name: ontology-database
description: Graf pengetahuan bertipe lewat log TSV append-only — CRUD entitas, relasi berarah, validasi skema, penalaran multi-hop. CLI lewat `x ondb`, protokol yang bisa dibaca AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Graf pengetahuan bertipe: semua hal adalah **entitas** (id + type + properti) yang dihubungkan oleh **relasi berarah** (from → rel → to). Semua mutasi menambahkan baris TSV — tidak pernah menimpa. Log TSV-lah yang ADALAH basis datanya.

## Format log TSV (protokolnya)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # buat entitas
set     <id>  <epoch_ms>  key  val                             # perbarui properti
rm      <id>  <epoch_ms>                                       # hapus entitas
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # buat relasi
unlink  <from>  <rel>  <to>  <epoch_ms>                        # hapus relasi
# dipisahkan tab; escape: \t → tab, \n → newline, \\ → backslash
# properti berupa pasangan key/val bergantian (masing-masing field tab terpisah)
```

Bahasa apa pun bisa membaca ini. AWK streaming, Python dict, SQLite mematerialisasi. **Log adalah sumber kebenaran.**

## Penggunaan CLI

```
x ondb add --type Person --name Alice                            # UUID otomatis
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # detail entitas
x ondb set --id t1 status=done                                  # perbarui prop
x ondb rm --id t1                                               # hapus

x ondb link --from proj_001 --rel has_task --to t1              # buat relasi
x ondb link --from t1 --rel blocks --to t2                      # dengan prop relasi: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relasi keluar
x ondb linked --id t1 --direction incoming                      # relasi masuk (siapa yang menaut KE-nya)
x ondb related --id proj_001 --rel has_task --json              # entitas lengkap di sisi lain

x ondb ls --type Task                                           # daftar menurut tipe
x ondb query --type Task --where status=open --json             # saring menurut properti
```

`linked` = metadata relasi. `related` = entitas lengkap di sisi lain. Pakai `--dir <path>` / `-d <path>` untuk direktori data (→ `path/ondb.tsv`).

## Skema & validasi

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # cek required, enum, referensi menggantung, kardinalitas, siklus
```

Direktif: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Validasi terpisah dari penulisan.

## Prinsip arsitektur

- **Log adalah sumber** — log TSV bersifat otoritatif; SQLite adalah materialized view
- **Append-only** — `set`, `rm`, `unlink` menambahkan baris; tidak pernah mengubah baris yang sudah ada
- **Banyak instans** — satu ondb per sub-domain (bawaan); penggabungan hanya untuk rantai lintas-domain
- **Tipe = Konsep** — nama tipe yang sama selalu berarti konsep yang sama
- **Validasi sesuai kebutuhan** — tidak ada cek skema saat menulis; jalankan `validate` setelah perubahan massal

## Backend

| Backend | Kapan | |
|---|---|---|
| **AWK** (bawaan) | < 2k entitas | Tanpa dependensi, streaming |
| Python | Sedang | Struktur data yang kaya |
| JS/Bun | Aplikasi web | JSON bawaan |
| SQLite | > 5k entitas | Dibuat otomatis dari log TSV |

## Struktur direktori

```
<datadir>/ONDB.DESC.txt    # Wajib. Mengidentifikasi instans ondb
<datadir>/ondb.tsv         # Log append-only
<datadir>/schema.tsv       # Opsional. Batasan
<datadir>/ondb.db          # Opsional. Materialized view SQLite
```

## Untuk informasi lebih lanjut

- `x ondb --help` — referensi CLI
- `x ondb libpath {awk,py,js}` — path library untuk query kustom
- [ondb SKILL.md](../../../ondb/SKILL.md) — dokumentasi lengkap (skenario, integrasi, query kustom, konfigurasi WAL SQLite)

## Terkait

- [yfm](../yfm/SKILL.md) — `metadata:` yfm adalah permukaan ingest yang direkomendasikan
- [rule](../rule/SKILL.md) — aturan validasi skema tinggal di kerangka rule