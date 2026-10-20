---
name: devloop
description: Loop pengembangan bertumpu pada tujuan — tetapkan objektif, tulis aturan beserta key-results, verifikasi secara visual, sinkronkan ke pelacak issue.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Persiapan

```
x rule init :ror                          # atau ruleset spesifik proyek
x env use agent-browser                   # untuk verifikasi visual
```

## Alur kerja

```
goal → rule.yml → code → verify → issue
```

### 1. Tetapkan goal → tulis rule.yml

Sebelum menulis kode, buat rule.yml untuk tugas ini:

```yaml
goal: "Perbaiki versi Bahasa Inggris yang menampilkan tag Bahasa Mandarin di bagian Features"
keyresults:
  - kr-1: "Tag Features pada mode Bahasa Inggris semuanya berbahasa Inggris"
  - kr-2: "Tag Features pada mode Bahasa Mandarin tetap berbahasa Mandarin"
  - kr-3: "Build lolos tanpa regresi"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Saat language=en, semua item details[] harus berbahasa Inggris
    - Tidak ada karakter Mandarin pada badge tag mana pun dalam mode Bahasa Inggris
```

Field aturan: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Lihat `x rule -h`.

**WAJIB** sertakan `goal` dan `keyresults` — dua field wajib untuk setiap tugas devs.

### 2. Eksekusi → verifikasi visual (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... lakukan perubahan ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**WAJIB** ambil screenshot sebelum dan sesudah. Bandingkan dengan maksud awal:
1. Pemeriksaan visual AI: apakah after.png sesuai dengan goal?
2. Jika tidak cocok → iterasi dan ambil ulang screenshot
3. **Hapus semua data privasi** (token, email, informasi pribadi) sebelum mengunggah

### 3. Verifikasi dengan x rule

```
x rule scan <files>     # cepat (~1 menit), untuk loop internal
x rule check <files>    # menyeluruh (~10 menit)
x rule audit <files>    # laporan lengkap (~30 menit)
```

### 4. Sinkronkan ke pelacak issue

Lihat [issue/SKILL.md](../issue/SKILL.md). Minimal: unggah goal, key-results, rule.yml, serta screenshot sebelum/sesudah ke issue.

## Alat untuk agent

- `x rule scan` — pemeriksaan cepat saat iterasi
- `x rule check` — kepatuhan penuh sebelum commit
- `agent-browser screenshot` — bukti visual sebelum/sesudah
- `gh issue create/comment` — sinkronkan goal + rule.yml ke pelacak

## Terkait

- [rule](../rule/SKILL.md) — rule.yml adalah kerangka verifikasi
- [score](../score/SKILL.md) — penilaian KR memakai kerangka score
- [install](../install/SKILL.md) — menyiapkan lingkungan devs
- [agent-browser](../../it/agent-browser/SKILL.md) — verifikasi visual sebelum/sesudah
- [issue](../issue/SKILL.md) — sinkronkan goal + KR + screenshot ke pelacak issue
- [repo](../repo/SKILL.md) — menarik/mendorong pekerjaan di dalam repo
- [prompt](../prompt/SKILL.md) — konvensi prompt sering mendorong tugas devloop