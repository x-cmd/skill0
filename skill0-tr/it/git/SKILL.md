---
name: git
description: |
  Git ve kod barındırma platformu yönetimi — GitHub, GitLab, Codeberg, Forgejo.
  Sıfır engel — x-cmd'yi kur, repoları terminalden yönet.
  "git", "github", "gitlab", "repo", "pull request", "code hosting" için kullan.

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Git repolarını ve kod barındırma platformlarını komut satırından yönet.

## Hızlı Başlangıç

```bash
# x-cmd'yi kur
eval "$(curl https://get.x-cmd.com)"

# GitHub repo yönetimi
x gh repo list
x gh repo clone owner/repo

# Pull request oluştur
x gh pr create --title "Fix bug" --body "Description"

# Git hook yönetimi
x git hook
```

## Neler Var

| Komut | Platform | Açıklama |
|---------|----------|-------------|
| `x gh` | GitHub | Tam GitHub CLI entegrasyonu |
| `x gl` | GitLab | GitLab proje yönetimi |
| `x cb` | Codeberg | Codeberg entegrasyonu |
| `x git hook` | Yerel | Git hook yönetimi |

## Bu skill0 büyüyor

GitHub temelleriyle başlıyor. Eklenecekler:
- GitLab iş akışları
- Kod barındırma en iyi uygulamaları
- Repo taşıma rehberleri
- CI/CD entegrasyon ipuçları

## Tam deneyim

x-cmd'yi kurduktan sonra tüm seçenekler için `x git --help`.

## İlgili

- [repo](../repo/SKILL.md) — repoları `x repo` ile keşfet/yönet