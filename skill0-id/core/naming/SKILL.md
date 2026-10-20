---
name: naming
description: |
  Kerangka penamaan untuk modul / perintah / subperintah x-cmd. Subjektif + bertumpu skenario; skill ini adalah cangkang tipis, BUKAN buku aturan. Tiga lapis: investigasi (tujuan), naming.<user-task>.yml (OKR + catatan sesi, sebuah file .rule), naming.okr-creator.yml (meta-rule yang mengaudit sesi tersebut).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Penamaan itu **subjektif + bertumpu skenario**. Skill ini adalah **kerangka kerja**, bukan buku aturan — ia tidak mem baked aturan penamaan subjektif ke dalam dirinya.

## Peta cepat

```
┌─────────────────────────────────────────────────────────┐
│  1. SELIDIKI tujuan                                      │
│     Apa yang sedang dinamai? Peran apa? Konsep apa?      │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (file .rule)                 │
│     - goal-*        (tugas penamaan)                    │
│     - keyresult-*   (hasil yang bisa diverifikasi)      │
│     - task-*        (batasan khas tugas)                │
│     - session:      (jejak audit pada aturan goal)      │
│         prefer     (5 jawaban init-004)                 │
│         init_verdicts  (keputusan gerbang per kandidat) │
│         scores     (D1-D7 bertumpu per kandidat)        │
│         final      (pilih + cadangan)                    │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDIT dengan template/naming.okr-creator.yml         │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Alur kerja — langkah demi langkah

### Langkah 1 · Selidiki tujuannya

Sebelum menulis apa pun, jawab pertanyaan-pertanyaan ini. JANGAN dilewati — tanpa jawaban, pemberi skor tidak akan dapat berlabuh pada D4 (TRIAL/REAL) atau D5 (RUN/TEST).

- **Apa yang sedang dinamai?** — modul / subperintah / field / variabel — aturan bentuk nama yang berbeda berlaku
- **Peran apa yang dimainkannya?** — mengikat konsepnya (mis. "modul trial-run" → runner mandiri, Tahap 1 dari pengujian dua tahap)
- **Prior apa yang WAJIB dibawa?** — makna kata tunggal yang dominan harus cocok (mis. trial-run butuh TRIAL+RUN, bukan REAL+TEST)
- **Prior apa yang WAJIB dihindari?** — polusi unittest (`*test`/`*case`), palsu (`*mock`/`*fake`/`*stub`/`*dry`), deployment nyata (`field*`/`*live*`)
- **Arketipe apa yang cocok?** — ship / plane / rocket / factory / abstract — menggerakkan D6/D7

Keluaran: pernyataan tujuan satu baris, mis.
> "Pilih nama modul x-cmd mandiri untuk trial-run (Tahap 1 dari pengujian dua tahap) yang mencapai skor 8.0+ pada D1-D7, langsung menjelaskan diri sejak pertama dilihat, dan bertahan dari semua fast-fail garis merah / kamus / panjang."

### Langkah 2 · Buat catatan sesi

Salin template lalu pangkas / isi.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Lalu isi 4 section (dari atas ke bawah):

#### 2a. Aturan goal (tugas penamaan)

Ganti `goal-TBD_task_id` dengan ID sungguhan. Sufiks ID harus mencerminkan tugasnya (mis. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <pernyataan tujuan satu baris dari Langkah 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <konsep + peran + anti-prior, dari Langkah 1>
```

#### 2b. Hasil kunci (hasil yang bisa diverifikasi)

Ganti setiap `keyresult-kr*_TBD_short_label`. Setiap KR adalah aturan yang harus bisa dibuat PASS. Tambahkan sebanyak yang tugasnya perlukan.

```yaml
keyresult-kr1-top-pick-committed:
  name: <hasil yang bisa diverifikasi 1>
  level: error
  desc:
  - <apa yang dihitung lolos — kriteria konkret, bukan "kelihatan bagus">
```

#### 2c. Aturan khas tugas (batasan pada kandidat)

Ganti setiap `TBD_task_id-*` dengan ID batasan sungguhan yang cocok dengan sufiks task-id milik goal. Pangkas yang tidak berlaku, tambahkan yang baru bila perlu.

Pola umum:
- `must-be-X-not-Y` — keselarasan konsep (mis. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — rentang keras D1
- `must-imply-<archetype>` — ikatan D7
- `<domain>-specific-acceptable` / `not-acceptable` — izin domain sempit
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <batasan, mis. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <yang harus dipenuhi kandidat>
  - <dimensi D1-D7 mana yang dibatasi ini>
  tldr:
  - wrong: <contoh salah>
  - right: <contoh benar>
```

#### 2d. Catatan sesi (jejak audit pada aturan goal)

Isi keempat sub-section:

**prefer** — WAJIB menjawab kelima pertanyaan, bahkan kalau jawabannya "tidak / lemah":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<daftar domain sempit yang OK, mis. [naval]>]   # [] = tidak ada domain sempit yang OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — satu entri per kandidat yang dipertimbangkan, termasuk yang ditolak:
```yaml
init_verdicts:
  - { name: <candidate>, gate: init-005 | init-006 | init-007 | pass, reason: "<mengapa>" }
  # init-005 = kecocokan pola garis merah (tolak otomatis)
  # init-006 = makna pertama kamus bertentangan dengan target
  # init-007 = panjang di luar rentang (< 2 atau > 8)
  # pass     = lolos semua gerbang init, berhak dinilai
```

**scores** — satu entri per kandidat yang lolos init. Semua skor >= 6.0. Setiap skor WAJIB punya jangkar:
```yaml
scores:
  - name: <candidate>
    score: <0_to_10>
    anchors:
      - "D1: <bukti jumlah huruf>"
      - "D2: <bukti makna pertama kamus>"
      - "D3: <bukti makna harfiah majemuk>"
      - "D4: <bukti trial vs real>"
      - "D5: <bukti run vs test>"
      - "D6: <bukti keg vividly>"
      - "D7: <bukti peralatan besar>"
    misses:
      - "<apa yang hilang — hanya cantumkan yang benar-benar hilang, tidak selalu 7>"
```

**final** — nyatakan pilihan + cadangan:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Langkah 3 · Audit dengan meta-rule

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

okr-creator (di `template/naming.okr-creator.yml`) menjalankan 11 pemeriksaan (campuran error dan warn):

| Pemeriksaan | Level | Apa yang diverifikasinya |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | file punya ≥1 aturan `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | file punya ≥1 aturan `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | file punya ≥1 aturan tugas (bukan goal/keyresult) |
| `okr-creator-010` has-session-record | error | aturan goal punya field `session:` |
| `okr-creator-011` prefer-answers-all-five | error | kelima pertanyaan init-004 terjawab |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts tidak kosong |
| `okr-creator-013` scores-have-anchors | error | setiap skor punya daftar anchors yang tidak kosong |
| `okr-creator-014` scores-no-below-6 | error | semua skor >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` dinyatakan |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | skor pick >= 7.0 |

**Jika ada pemeriksaan error yang gagal**: perbaiki file lalu jalankan ulang. Perbaikan umum:
- Field prefer hilang → tambahkan ke `session.prefer`
- Skor telanjang → tambahkan `anchors: [...]`
- Skor < 6 → pindahkan ke `init_verdicts` (ditolak) atau bingkai ulang skornya
- final hilang → tambahkan `final: { pick, backup }`

**Jika pemeriksaan warn gagal**: putuskan apakah akan ditangani atau didokumentasikan sebagai trade-off.

### Langkah 4 · Pengguna memilih nama akhirnya

Skill mengusulkan; pengguna memutuskan. Nama akhir dinyatakan di `session.final.pick` lalu di-commit.

## Berkas

| Berkas | Peran | Format |
|---|---|---|
| `SKILL.md` | Berkas ini — alur kerja + indeks berkas | markdown |
| `naming.template.yml` | TEMPLATE dengan placeholder `TBD_*` — salin, ganti nama, isi | `.rule` |
| `naming.trial-run-module.yml` | Contoh penerapan catatan sesi yang lengkap | `.rule` |
| `template/naming-concept.yml` | Kerangka evaluasi objektif (D1–D7, garis merah, jangkar skor) — sebagai entri `.rule` | `.rule` |
| `template/naming-brand.yml` | Aturan merek x-cmd (panjang, kapitalisasi, pilihan prior) — sebagai entri `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-rule: mengaudit `naming.<user-task>.yml` (11 pemeriksaan di atas) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset penamaan modul x-cmd opsional (catatan sesi awal) | `.rule` |

## Pemisahan subjektif vs objektif

| Objektif (di berkas / kode) | Subjektif (ditanyakan saat init, tidak dinilai) |
|---|---|
| Makna pertama kamus | "Saya ingin yang vivid vs abstrak" |
| Jumlah huruf | "Saya ingin domain X yang boleh" |
| Kelas semantik Trial / Real / Run / Test | "Saya ingin metafora nautis boleh atau tidak" |
| Makna harfiah majemuk | "Saya ingin asal China vs asal Inggris" |
| Polusi prior (unittest testcase, dryrun) | "Saya ingin yang pendek vs yang menjelaskan diri" |

## Aturan

- **WAJIB** selidiki tujuannya lebih dulu — apa yang sedang dinamai, peran apa yang dimainkannya, konsep apa yang mengikatnya.
- **WAJIB** mulai dari `naming.template.yml` (placeholder `TBD_*`) dan pangkas / isi sesuai kebutuhan tugas.
- **WAJIB** menghasilkan `naming.<user-task>.yml` (format `.rule`) berisi goal / hasil kunci / aturan tugas / catatan sesi.
- **WAJIB** jalankan `x rule check` dengan `template/naming.okr-creator.yml` untuk mengaudit catatan sesi.
- **WAJIB** berlabuhkan skor pada fakta objektif — jangan pernah menaikkan/menurunkan skor berdasarkan reaksi pengguna.
- **WAJIB** biarkan pengguna memilih nama akhir — skill mengusulkan, pengguna memutuskan.
- **DILARANG** menambahkan aturan subjektif ke `template/naming-concept.yml` — aturan itu masuk ke `session.prefer` per tugas.

## Terkait

- [rule](../rule/SKILL.md) — sesi penamaan diperiksa lewat x rule
- [score](../score/SKILL.md) — kandidat dinilai lewat kerangka score
- [ontology-database](../ontology-database/SKILL.md) — nama terpilih tersimpan di ondb