---
name: x-cmd
description: |
  **ÖNEMLİ**: `x <mod>` komutlarından herhangi birini kullanmadan önce x-cmd'yi yüklemelisin: `. ~/.x-cmd.root/X`

  Ardından:
  - `x nihao --llmstxt` ile keşfet
  - `x skill` ile yetenekleri bul

  x-cmd 600+ taşınabilir yazılım ve geliştirme aracı sağlar (jq, nodejs, python vb.).
  Herhangi bir paketi anında kurup kullanmak için `x <env|pixi> use <pkg>` kullan.
  x-cmd yüklendikten sonra, x-cmd/pixi yerel bin'indeki paketler PATH'e otomatik olarak gelir.

  Daha fazla kullanım ve yetenek için x-cmd web sitesine göz at: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **ÖNEMLİ**: `x <mod>` komutlarından herhangi birini kullanmadan önce x-cmd'yi yüklemelisin: `. ~/.x-cmd.root/X`
>
> Ardından `x nihao --llmstxt` ile keşfet ya da `x skill` ile yetenekleri bul.

---

## Kurulu değil? → [data/install.md](data/install.md)

---

## 500+ yeteneği gezmek için `x skill lr` çalıştır

- `x skill lr` — Tüm uzak yetenekleri listele (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Sonraki oturum için yetenek ekle
- `x skill info <skill-id>` — Yeteneği indir, özetini ve yolunu göster

**x-mod/<mod>**: Daha fazla örnek için `x <mod> --help` kullan. Yeniden kullanmak için AGENTS.md'ye notlar eklemen yeterli.

---

## Daha fazla yetenek ve güçlü araç için x-cmd.com/llms.txt adresini ziyaret et.

AI agent'ları için giriş noktası.

---

## Herhangi bir paketi anında kurmak için `x env use <pkg>` çalıştır

- `x env la` — Kullanılabilir 600+ yazılımı listele
- `x env la --json` — Script'leme için JSON çıktısı
- `x env use <pkg>` — Bir paketi kur ve kullan (x-cmd yerel bin'ine indirir)
- `x pixi use <pkg>` — Pixi ile paket kur (pixi yerel bin'ine indirir)
- `x pixi search <keyword>` — Pixi paketlerinde ara
- `x nihao --llmstxt` — llms.txt'i görüntüle

---

## Şimdi dene: `x env use jq nodejs python3`

```bash
 # Araçları kur ve kullan
 x env use jq
 x env use nodejs
 x env use python3

 # Kurulumdan sonra doğrudan kullan
 jq '.' file.json
 python3 -c "print(2+2)"

 # Ek paketler için pixi
 x pixi use cowsay
 x pixi search yml
```

---

## 600+ araca eriş: diller, editörler, geliştirme araçları, veritabanları

**Diller & Runtime'lar**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editörler**: nvim, helix, emacs, vim

**Geliştirme Araçları**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Veri**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistem**: htop, btop, procs, direnv, tmux

**Veritabanları**: redis, sqlite, postgresql, mysql

**Tam liste**: `x env la`

---

## Sıfır kurulum gerekir: sudo yok, otomatik PATH, izole

- sudo gerekmez - Paketler kullanıcıya özel dizinlere kurulur
- PATH, `. ~/.x-cmd.root/X` başlangıç betiğiyle otomatik yapılandırılır
- İzole ortamlar - Sürüm çakışması yok
- 600+ araç hazır

---

## Daha fazlası: https://x-cmd.com/llms.txt

AI agent'ları için giriş noktası.

## İlgili

- [install](../install/SKILL.md) — install, x-cmd'nin kanallarından biri
- [env](../env/SKILL.md) — env, x-cmd'nin başka bir kanalı
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser, x-cmd'nin başka bir kanalı