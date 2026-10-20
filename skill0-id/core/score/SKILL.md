---
name: score
description: |
  Kerangka penilaian dimensi berbobot untuk agent AI — "Jangan menebak. Nilailah." Ide inti: pahami kebutuhan dulu, susun draf lalu iterasi, agent adalah analisnya. Menghasilkan TSV terperingkat lewat `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Don't guess. Score."
Kerangka penilaian dimensi berbobot untuk agent AI.
## Cara memakainya
**Pahami dulu, nilai belakangan.** Ajukan pertanyaan cukup banyak sebelum menentukan dimensi. Dimensi yang salah → skor yang salah, sedetik rinci apa pun.
**Susun draf lalu iterasi.** Saat kebutuhan belum sepenuhnya jelas, buat standar secukupnya, nilailah, dan tampilkan hasilnya. Pengguna bereaksi pada peringkat konkret — "faktor ini seharusnya lebih tinggi", "kamu kelewatan X". Itulah sinyalnya. Perhalus dan nilai ulang. Satu iterasi mengalahkan sepuluh Tebakan buta.
**Agent adalah analisnya.** Setelah compute, baca TSV. Jelaskan mengapa X mengalahkan Y. Soroti hal yang mengejutkan. Sarankan penyesuaian. Peringkat memulai percakapan, bukan mengakhiri.
## Alur inti
```
① Understand needs  → ② Define score.yml  → ③ Score score.tsv  → ④ x score compute  → ⑤ Report & iterate
```
Keluaran: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, terurut menurun. rank=1 terbaik.
## Contoh — membantu pengguna memutuskan slogan promosi
1. Diskusikan dengan pengguna untuk menentukan dimensi dan kriteria evaluasi. Tulis `slogan.score.yml`.
2. AI menilai tiap slogan per dimensi (0–10, beserta bukti) → `slogan.score.tsv`. Biarkan total dan rank kosong.
3. `x score compute slogan.score.yml slogan.score.tsv` → mengisi total + rank.
4. Baca hasilnya, diskusikan dengan pengguna. Sesuaikan skor atau tambah kandidat, ulangi.
5. Atau: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Contoh lebih banyak: [EXAMPLE.md](EXAMPLE.md).
## Model dua file
- `*.score.yml` — Standar yang bisa dipakai ulang: dimensi, faktor, deskripsi
- `**.score.tsv` — Target + skor + bukti; kolom 1 = nama target
`x score compute <yml> <tsv>` sama dengan `python compute.py`.
## Skenario penerapan
1. **Memberi agent alur kerja pengambilan keputusan.** score.yml mengikat agent ke proses terstruktur — agent mengikuti standar, bukan suasana hati pesan terakhir.
2. **Keputusan berbasis aturan.** Dimensi × faktor × bukti → total berbobot → peringkat. Setiap skor terikat pada fakta. Penalarannya transparan.
3. **Menyesuaikan kebutuhan berbeda.** Tukar dimensi, sesuaikan faktor, tambah filter keras (kolom `block`). Template sama, pengguna berbeda.
4. **Berkembang seiring kebutuhan clarifies.** Draf → nilai → umpan balik → perhalus → makin tajam.
5. **File standar + hasil terarsip untuk skill apa pun.** score.yml = standar keputusan. score.tsv = catatan keputusan. Keduanya bisa diarsipkan, ditinjau, dibagikan.
---
## Rumus
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — bilangan bulat 1–10. Dasar = 2. 1=minor, 4=2×, 6=3×, 8=4×, 10=5×. Dinormalisasi otomatis.
- **score** — 0–10 per dimensi, terikat pada bukti.
- **total** — total berbobot 0–100.
Header dimensi menampilkan bobot %: `factor ÷ Σ(factor) × 100`.
## Kolom keluaran
| Kolom | Sumber | Deskripsi |
|--------|--------|-------------|
| `target` | input | Nama kandidat |
| `total` | dihitung | Skor berbobot (0–100) |
| `rank` | dihitung | 1 = terbaik. `X` bila diblokir |
| `block` | input | Filter keras — tidak kosong = gugur, didorong ke bawah, rank=X |
| `reason` | input/output | Opsional: catatan AI tentang nuansa skor |
| `<dim> (X%)` | dihitung | Skor per dimensi, header menampilkan bobot % |
| `evidence` | input | Fakta yang menopang setiap skor |
## Skala
- 9–10 — Sangat baik — sepenuhnya memenuhi kriteria
- 7–8 — Baik — memenuhi kriteria, ada kekurangan kecil
- 5–6 — memadai — arahnya benar, ada yang terlewat berarti
- 3–4 — Lemah — kekurangannya signifikan
- 1–2 — Gagal — nyaris tidak tersentuh
- 0 — N/A — tidak berlaku
## Aturan
1. **Pengikatan bukti** — setiap skor WAJIB punya bukti. Fakta, bukan perasaan.
2. **Pakai seluruh rentang** — 5 adalah titik tengah, bukan pilihan bawaan. 0 dan 10 jarang tapi mungkin.
3. **Faktor adalah penguat relatif** — factor 2 = pengaruh 2× dari factor 1. Dinormalisasi otomatis.
4. **Target unik dan tidak kosong** — kolom 1 tiap baris harus punya nama target. Tanpa duplikat, tanpa kosong.
5. **Agent membaca, melaporkan, memutuskan** — setelah compute, jelaskan hasilnya. Nilai ulang atau beri bobot ulang sesuai kebutuhan.
## Berkas
- `SKILL.cn.md` — versi bahasa Mandarin
- `compute.py` — Validasi + menghitung total + rank
- `template/*.score.yml` — 35+ template. `x score ls` menampilkan, `x score init -t <name>` menyalin
- `EXAMPLE.md` — Contoh penggunaan lebih banyak
- `rule-vs-score.md` — Kapan memakai rule vs score
- `score-template-writer.md` — Cara menulis template penilaian

## Terkait

- [rule](../rule/SKILL.md) — pendamping kepatuhan berpasangan
- [naming](../naming/SKILL.md) — nama kandidat dinilai di sini