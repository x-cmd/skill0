---
name: env
description: |
  Yazılım paketlerini, dil runtime'larını ve CLI araçlarını anında kur ve yönet.
  Sıfır engel — x-cmd'yi kur, saniyeler içinde her aracı al. sudo gerekmez.
  "install", "package", "python", "node", "jq", "runtime", "tool" için kullan.

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Herhangi bir yazılımı anında kur. sudo yok. Sistem kirliliği yok.

## Hızlı Başlangıç

```bash
# x-cmd'yi kur
eval "$(curl https://get.x-cmd.com)"

# Python kur
x env use python

# Node.js kur
x env use node

# CLI araçları kur
x env use jq
x env use fzf

# Kalıcı kurmadan dene
x env try python3 script.py
```

## Neler Var

Şunları içeren 600+ paket:

- Diller — python, node, go, bun, java, rust
- CLI araçları — jq, yq, fzf, himalaya
- Geliştirme araçları — claude-code, code-server

## Temel Özellikler

- **sudo yok** — kullanıcı dizinine kurar
- **Sürüm yönetimi** — kur ve sürümler arasında geçiş yap
- **Kurulumdan önce dene** — geçici kullanım için `x env try`
- **Temizlik** — `x env clean` kullanılmayan paketleri kaldırır

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Yaygın kurulum kalıpları
- Sürüm sabitleme ipuçları
- Çok dilli proje kurulum rehberleri

## Tam deneyim

x-cmd'yi kurduktan sonra tüm seçenekler için `x env --help`.

## İlgili

- [install](../install/SKILL.md) — `x env use`, install'ın kanallarından biri
- [x-cmd](../x-cmd/SKILL.md) — env için şemsiye giriş noktası