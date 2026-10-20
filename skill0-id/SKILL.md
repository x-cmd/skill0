---
name: skill0
description: "Indeks akar sub-skill x-cmd skill0. Mendefinisikan alur kerja agent bergaya OKR (tujuan → hasil terverifikasi aturan → eksekusi), penemuan skill, dan preferensi perkakas agent. Gaya: prinsip lebih dulu, ringkas, serahkan detail ke sumber eksternal otoritatif."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 mengodekan prinsip, bukan data

LLM menyerap pengetahuan umum terus-menerus; tugas skill0 adalah mengodekan konvensi dan penunjuk sumber, lalu menipis seiring waktu ketika LLM menyusul. Verifikasi lewat data pihak pertama (`x rfc`, `x cve`, `x wkp`, `agent-browser`) dan praktik terbaik terkini (`x skill`, `x clawhub`), lalu bangun ulang dengan logika formal alih-alih menghafal.

## Sub-skill membentuk graf berarah di 4 bucket

Bucket: `core/`, `data/`, `it/`, `life/`. Path: `<bucket>/<slug>/SKILL.md`. Katalog yang bisa dibaca mesin (name + description) ada di [index.tsv](index.tsv).Dulu ada satu dokumen yang berada di sini sebagai panduan interaksi manager/lifestyle; dokumen itu dipindahkan ke [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) karena bukan bagian dari graf skill0.

## Tujuan → keyresults → x-rule adalah alur kerja OKR

Objective: apa yang ingin dicapai
Key Results: bagaimana cara memverifikasinya
Verification: `x rule check/audit`

## Setelah kerangka siap, utamakan perkakas x-cmd untuk eksekusi

- `x skill` — katalog skill pilihan x-cmd yang sudah ditinjau manusia.
- `x clawhub` — registri skill global. **Hati-hati**: unggah bebas, **WAJIB** jalankan `x clawhub skill moderate <name>` untuk laporan keamanan yang dihasilkan otomatis.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — manajemen proyek, penjadwalan, agent latar belakang, ontologi, wiki. Jalankan `x [mod] --help`.

## Setiap SKILL.md harus lolos skill0-writer

Lihat [skill0-writer](core/skill0-writer/SKILL.md) untuk konvensinya.