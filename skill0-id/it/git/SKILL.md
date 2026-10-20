---
name: git
description: |
  Manajemen Git dan platform hosting kode — GitHub, GitLab, Codeberg, Forgejo.
  Tanpa hambatan — pasang x-cmd dan kelola repo langsung dari terminal.
  Gunakan untuk "git", "github", "gitlab", "repo", "pull request", "hosting kode".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Kelola repo Git dan platform hosting kode dari baris perintah.

## Mulai Cepat

```bash
# Pasang x-cmd
eval "$(curl https://get.x-cmd.com)"

# Manajemen repo GitHub
x gh repo list
x gh repo clone owner/repo

# Membuat pull request
x gh pr create --title "Fix bug" --body "Description"

# Manajemen Git hooks
x git hook
```

## Yang Tersedia

| Perintah | Platform | Keterangan |
|---------|----------|-------------|
| `x gh` | GitHub | Integrasi GitHub CLI penuh |
| `x gl` | GitLab | Manajemen proyek GitLab |
| `x cb` | Codeberg | Integrasi Codeberg |
| `x git hook` | Lokal | Manajemen Git hooks |

## skill0 Ini Berkembang

Mulai dari dasar-dasar GitHub. Akan ditambahkan:
- Alur kerja GitLab
- Praktik terbaik hosting kode
- Panduan migrasi repo
- Tips integrasi CI/CD

## Pengalaman Lengkap

`x git --help` untuk semua opsi setelah memasang x-cmd.

## Terkait

- [repo](../repo/SKILL.md) — temukan/kelola repo lewat x repo