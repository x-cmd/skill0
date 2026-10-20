---
name: yfm
description: |
  YAML front matter (YFM) untuk artikel markdown apa pun. Bawaan x-cmd adalah tiga field tingkat atas: `tags`, `description`, `memo`. Bawaan ini meminjam bentuk frontmatter Agent Skills — lihat <https://agentskills.io/specification>. Modul yfm adalah pembantu: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Terapkan YFM

Pakai YFM untuk markdown apa pun yang mungkin dipindai agent, indeks, atau pipeline ontologi. **Ikuti dialek yang sudah dipakai** kalau sudah ada (Agent Skills, Obsidian, Jekyll, Hugo, dll.) — bawaan x-cmd hanya berlaku bila tidak ada dialek lain yang menaungi.

## Bawaan x-cmd: tiga field

```yaml
---
tags: [design, front-matter]
description: One-sentence summary a reader uses to decide whether to open this file.
memo:
  2026-07-31T14:30:00+08:00: Cut aliases; renamed third field to memo.
---

# Title

Body...
```

- **`tags`** — daftar slug tingkat atas `[a-z0-9-]`. Konsumen: kolektor untuk pengindeksan ontologi.
- **`description`** — string tingkat atas. Satu kalimat. Bukan `description:` milik Agent Skills (itu syarat khusus SKILL.md, diatur oleh `skill0-writer`).
- **`memo:`** — map tingkat atas, yaitu log revisi file. Kunci berupa timestamp ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, offset lokal penulis); nilai berupa deskripsi perubahan singkat. Yang terbaru di atas. Hilangkan bila tidak ada riwayat yang layak dicatat.

### Cakupan yang berlaku

- `<project>/.x-cmd/story/` — diperluas dengan `issue:` — lihat [usecase/story.md](usecase/story.md).
- Body issue / PR GitHub — diperluas dengan `repo:`, `number:` — lihat [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- `README.md` GitHub — hanya field bawaan.

## Modul

Modul yfm adalah pembantu. Tiga perintah:

- `x yfm ls [path]` — daftar blok YFM; bawaan ke direktori saat ini
- `x yfm init [path]` — tulis blok bawaan x-cmd ke setiap file markdown di bawah path
- `x yfm lint [path]` — cek bahwa setiap blok YFM adalah YAML valid dan mengikuti dialek yang diklaimnya

## Membaca front matter asing

Kolektor ingesting banyak dialek. Untuk spesifikasi yang dipinjam bawaan ini, lihat <https://agentskills.io/specification>. Per dialek:

- [Agent Skills](usecase/agentskills.md) — `metadata:` berupa string→string; tingkat atas bersifat tertutup
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` telah dipakai khusus
- [Jekyll](usecase/jekyll.md) — daftar atau dipisahkan **spasi**
- [Hugo](usecase/hugo.md) — mungkin TOML; taksonomi dikonfigurasi situs