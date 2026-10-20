---
name: skill0-writer
description: Konvensi penulisan untuk dokumen skill0 — struktur piramida, batas jumlah baris, dan aturan tata letak.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Dokumen skill0 mengikuti **prinsip piramida**: agent mungkin hanya membaca 10–30 baris pertama, jadi informasi terpenting harus datang lebih dulu. Detail setelah baris 30 adalah bonus, bukan beban.

## Hal yang tidak ditangkap aturan mana pun

- **Kejelasan lebih penting daripada keringkasan.** Dokumen pendek yang memberi jawaban salah lebih buruk daripada dokumen panjang yang memberi jawaban benar.
- **Peringatan keamanan / keselamatan WAJIB eksplisit** — pakai MUST, NEVER, DO NOT. Nyatakan catatan attenuant sebagai pernyataan utuh, bukan sisipan dalam kurung.
- **Jangan Developing pengetahuan umum.** Kalau satu istilah konvensi ditambah satu atau dua kalimat sudah cukup menjelaskan maksudnya, berhenti. Pembaca sudah tahu apa itu YAML, git, dan cache; habiskan konteksmu untuk hal yang spesifik pada repo ini. Justifikasi biasanya offenders — berikan alasan sebuah aturan hanya kalau ia terlihat salah tanpanya. (`sw-1200`)
- **Tabel hanya untuk matriks yang nyata.** 3+ kolom yang barisnya harus dibaca saling terhadap. Tabel dua kolom hanyalah daftar yang memakai sintaks tabel — tulis daftarnya. Dataset sebaiknya berada di `.tsv` eksternal di samping dokumen, ditautkan, supaya bisa ditanyakan dengan `x tsv`. (`sw-1250`)

## YFM — hanya untuk `SKILL.md`

```yaml
---
name: <slug>                  # harus sama dengan nama direktori
description: <1-2 kalimat ringkasan yang dipakai agent untuk memutuskan perlu memuat atau tidak>
---
```

`name` dan `description` bersifat struktural. Selebihnya bersarang di blok `metadata:` dari [yfm](../yfm/SKILL.md) sebagai skalar yang dipisahkan koma — opsional, dan menambah struktur untuk pengindeksan, penemuan, dan kaitan ontologi.

**Sub-file tidak membawa YFM.** Hanya `SKILL.md` yang difilter oleh loader, jadi hanya dia yang butuh front matter. Semua file lain (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) dibaca langsung oleh agent yang sudah memutuskan untuk membukanya — YFM di sana murni pemborosan token, mengulang tujuan yang sudah diberikan judul dan baris pertama. Mulai file-file itu dari heading `#`. Menyimpang dari aturan ini perlu alasan yang dinyatakan di dalam file itu sendiri.

Untuk versi terlokalisasi ke bahasa Mandarin, gunakan `SKILL.cn.md` yang paralel (satu per skill). Jangan mencampur bahasa di dalam satu file.

## Pemeriksaan mekanis

Tersedia di [skill0-writer.rule.yml](skill0-writer.rule.yml). Jalankan `x rule lint skill0-writer.rule.yml` dan `x rule check -r skill0-writer.rule.yml lib/skill0/`. Cakupannya: keberadaan YFM + field name/description, format name, jumlah baris ≤ 100 (ideal 50), urutan section install → usage → advanced → links, hanya Bahasa Inggris, tanpa intro / tanpa kesimpulan / tanpa pengulangan, tanpa file terlantar.

## Pemeriksaan keamanan terhadap pemotongan

Setelah menulis, tinjau pada baris 30: apakah agent yang berhenti di sana akan membentuk pemahaman yang salah?

Jika ya, pindahkan keterangan kritis ke posisi lebih awal. 30 baris pertama harus memberi model mental yang benar (meski belum lengkap). Setelah baris 30, kembangkan dengan detail — piramidnya bersifat memperbaiki diri.

## Dua lapis pemuatan: description untuk pencocokan, body untuk rujukan

Skill loader (Claude Code, Cursor, Continue, dll.) memuat SKILL.md dalam dua tahap:

  1. **YFM `description:`** — otomatis dimuat ke katalog agent
     untuk pencocokan. Agent membaca description untuk memutuskan
     apakah skill itu perlu dimuat.
  2. **Body** — dimuat sesuai kebutuhan setelah ada kecocokan. Materi rujukan.

Implikasi:

- **Description** = *apa itu dan kapan memuatnya* — padat kata kunci,
  kaya pemicu, ringkas.
- **Body** = *cara memakainya dan rujukan* — contoh, skema, kasus tepi,
  tautan ke dokumen yang lebih dalam.

**Jangan duplikasi konten di kedua lapis.** Apa pun yang disampaikan description, body seharusnya *mengembangkan*nya, bukan mengulang permukaan yang sama. Paragraf pembuka body khususnya tidak boleh mencantumkan fitur yang sama dengan description — body diawali rujukan, bukan ringkasan kedua.

Uji praktisnya: kalau description dihapus seluruhnya dan hanya 30 baris pertama body yang dibaca, agent tetap harus melihat apa yang dilakukan skill itu dan kapan memuatnya. Kalau informasi itu hanya dibawa description, body tidak punya apa pun untuk ditambahkan di bagian atas — pindahkan penjelasannya ke dalam body dan biarkan description membawa judul besarnya.

## Sebuah skill adalah paket pengetahuan, bukan tutorial

Body sebuah skill adalah **peng briefings untuk LLM**, bukan kursus untuk pemula.

- **Kemampuan** ada di LLM. Body tidak mengajarkan.
- **Pengetahuan** ada di alat data x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) dan sumber eksternal. Body hanya menunjuk; agent mengambil ulang sendiri.
- **Kerangka berpikir** adalah tugas skill: menyebut bentuk masalahnya, konvensinya, keluaran terstrukturnya, alat x-cmd yang harus dipakai.

Sebuah skill membawa sudut pandang penyelesaian, konvensi, bentuk keluaran, dan penunjuk sumber. Ia **tidak** membawa kemampuan (LLM sudah memilikinya), data statis (jadi basi), atau tutorial (pakai sidecar).

Kalau detailnya terlalu spesifik atau terlalu cepat berubah, dorong ke sidecar (`references/`, `ANALYTICS.md`) atau ke dokumen eksternal yang selalu terbarui.

## Tautan eksternal

Kumpulkan dua jenis: **tautan akar** (titik masuk seperti `llms.txt`, indeks dokumentasi) dan **tautan berguna** (tautan tertuju untuk 20% dokumentasi yang mencakup 80% kasus penggunaan). Daftar akar lebih dulu, yang berguna sesudahnya — AI memahami urutan. **Tanpa duplikasi** kecuali penekanan sangat penting.

## Catatan lunak (pilihan penilaian)

- **Sub-file (CLEANUP.md, references/*)** boleh lebih panjang dari SKILL.md tapi 20 baris pertamanya tetap menanggung beban (piramida yang sama).
- **WAJIB** menautkan setiap sub-file dari SKILL.md induknya (tautan maju wajib). Tautan balik ke SKILL.md induk dari sub-file bersifat **opsional** — file usecase merujuk induknya secara implisit lewat path-nya. Ditegakkan oleh `sw-1000-no-orphan-docs` di [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Spekulasi** — nyatakan fakta yang sudah diuji, atau beri label "belum diuji".
- **Emoji** kecuali topik skill memang memerlukannya.

## Terkait

- [yfm](../yfm/SKILL.md) — konvensi YFM yang ditegakkan skill0-writer di lapis 1
- [naming](../naming/SKILL.md) — penamaan juga mengikuti aturan penulis
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — tegakan mekanis