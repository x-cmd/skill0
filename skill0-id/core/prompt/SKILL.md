---
name: prompt
description: Konvensi rekayasa prompt untuk x-cmd — pakai ulang lewat variabel template, aturan struktur, pola penegakan keamanan.
metadata:
  related: "devloop,rule"
---


# Prompt

## Prinsip inti: pakai ulang, jangan duplikasi

Prompt di x-cmd dirakit dari potongan-potongan yang bisa dipakai ulang, bukan ditulis sebagai monolit. Sebuah template prompt memuat variabel `<PLACEHOLDER>` yang diselesaikan saat runtime oleh modul shell.

Contoh dari `claw`:
```
first_contact.md          # mandiri — dimuat ke dalam <FIRST_CONTACT_PROMPT>
msg_telegram.md           # merakit: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # potongan sama, adapter platform berbeda
heartbeat.md              # alur kerja berbeda, berbagi <CHECK_PROMPT>
```

**Kenapa**: satu perbaikan menyebar ke mana-mana. Adapter platform (Telegram, Feishu, WeChat) berbagi aturan perilaku tetapi berbeda dalam perintah kirim dan batas format.

Lihat [reusing.md](reusing.md) untuk pola pakai ulang yang lebih rinci.

## Aturan struktur

- Setiap file prompt adalah satu set instruksi yang lengkap dan mandiri untuk satu skenario
- Pakai placeholder `<UPPER_CASE>` untuk variabel — jangan pernah menyisipkan data asli secara inline
- Placeholder diselesaikan oleh modul pemanggil, bukan oleh prompt itu sendiri
- Potongan = fungsi (logika dan alur), data ditambahkan saat runtime (mirip dengan menyetel argumen)

## Pola penegakan keamanan

Aturan keamanan dan perilaku WAJIB eksplisit dan tegas:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Pakai MUST, NEVER, DO NOT. Lihat [skill0-writer](../skill0-writer/SKILL.md) untuk aturan bahasa keamanan.

## Pola panduan format

Saat sebuah prompt menyasar beberapa platform dengan kemampuan format berbeda:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Contoh nyata

Potongan prompt saat ini berada di `lib/data/prompt/` tiap modul (mis. `claw/lib/data/prompt/`).
Nanti akan pindah ke `skill0/lib/skill0/<subskill>/` — struktur sama, lokasi kanonik.

Contoh saat ini di `claw/lib/data/prompt/`:
- `first_contact.md` — sapaan workspace baru, potongan yang bisa dipakai ulang
- `heartbeat.md` — agent latar belakang, membaca status workspace
- `msg_<platform>.md` — penanganan pesan per-platform, berbagi potongan umum

## Terkait

- [devloop](../devloop/SKILL.md) — prompt sering mendorong tugas devloop
- [rule](../rule/SKILL.md) — aturan struktur prompt ditegakkan oleh x rule