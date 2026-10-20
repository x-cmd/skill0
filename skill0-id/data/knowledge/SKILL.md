---
name: knowledge
description: |
  Cari di Hacker News, Wikipedia, DuckDuckGo, dokumen RFC, dan Stack Exchange dari command line.
  Tanpa hambatan — pasang x-cmd lalu mulai mencari.
  Gunakan untuk "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Cari berbagai sumber pengetahuan internet dari command line.

## Mulai Cepat

```bash
# Pasang x-cmd
eval "$(curl https://get.x-cmd.com)"

# Postingan teratas Hacker News
x hn top

# Pencarian Wikipedia
x wkp "artificial intelligence"

# Pencarian DuckDuckGo
x ddgo "rust programming language"

# Dokumen RFC
x rfc 2616

# Pencarian Stack Exchange
x se "how to exit vim"
```

## Yang Tersedia

| Perintah | Sumber | Contoh |
|---------|--------|---------|
| `x hn top` | Hacker News | 10 kiriman sedang tren |
| `x hn new` | Hacker News | Kiriman terbaru |
| `x wkp <query>` | Wikipedia | Cari artikel |
| `x ddgo <query>` | DuckDuckGo | Pencarian web |
| `x rfc <number>` | Dokumen RFC | Baca spesifikasi RFC |
| `x se <query>` | Stack Exchange | Cari tanya jawab |

## Skill0 ini terus berkembang

Mulai dari yang paling esensial. Nanti akan ditambahkan:
- Lebih banyak sumber (Project Gutenberg, arxiv)
- Pola pencarian lanjutan
- Tips penyaringan hasil dan pemformatannya

## Pengalaman lengkap

`x knowledge --help` untuk semua opsi setelah memasang x-cmd.

## Terkait