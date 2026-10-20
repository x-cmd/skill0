---
name: install
description: |
  Yazılımı sistemin izin verdiği her şekilde kur. `x install` önerilir — her yöntemi listeleyip en iyisini seçen
  tek kapı; ayrıca `x eget`/`x env use`/`x pixi` kanalları ve ayna değiştirme yeteneğine sahip sistem paket
  yöneticileri. Tüm x-cmd kanalları $HOME içine kurar — sudo yok, kirlilik yok.
  "install", "apt", "brew", "eget", "pixi", "package manager", "mirror" için kullan.
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Yazılımı sistemin izin verdiği her şekilde kur. **Tüm x-cmd kanalları (`x eget`, `x env use`, `x pixi`) `$HOME` içine kurar — sudo yok, sistem kirliliği yok.** Yalnızca sistem paket yöneticileri (`x apt`, `x brew`, …) işletim sistemine dokunur ve sudo gerektirebilir.

## Bir kanal seç

- `x install` — **Önerilen.** Tek kapı — bir araç için her yöntemi listeler, en iyisini seçer
- `x eget` — Upstream repo'lardan (GitHub / Codeberg release) doğrudan en güncel ikili dosyalar
- `x env use` — x-cmd'nin barındırdığı runtime'lar ve araçlar (`x pkg use` sarmalayıcısı)
- `x pixi` — conda / pixi-ekosistemi paketleri
- `x apt/brew/dnf/pacman` — Sistem paket yöneticileri (sudo gerektirebilir)

## Ön koşullar

x-cmd yukarıdaki her kanalı sağlar:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — önerilen ön kapı

Her araç birkaç kurulum yoluyla gelir; `x install` en iyisini otomatik seçer. Aşağıdaki tüm biçimler etkileşimsizdir (agent / CI güvenli):
```bash
x install bun                            # kur — en iyi yöntemi otomatik seçer
x install --printinfo ripgrep            # önce her kurulum yöntemini listele (salt okunur)
x install --withtool brew jq             # bir yöneticiyi zorla; ya da önek biçimi: brew/jq
x install --sys bun                      # yalnızca sistem paket yöneticisi
x install --printcmd bun vim             # komutu önizle, çalıştırma
x install --env                          # platform / mimari / dağıtım yoklaması
x install --available-tool --installed   # burada hangi paket yöneticileri var
```

### Nelerin kurulabilir olduğini keşfet

`x install --ls`, dizine eklenmiş her aracı TSV olarak verir — çevrimdışı olarak grep / awk ile tara:
```bash
x install --ls --tsv | head -1                  # başlık
x install --ls --tsv | grep -i json             # anahtar kelimeyle ara
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # dile göre filtrele
x install --search http                         # registry'ler arası toplu arama
```
TSV sütunları: `name category lang source desc_cn desc_en binlist rule other`.

## Aynaları değiştir (daha hızlı indirme)

Yavaş bir sistem paket yöneticisini daha hızlı / yerel bir aynaya yönlendir. Her birinin `mirror ls` (seçenekleri listele) ve `mirror set <code>` (uygula, etkileşimsiz) komutu vardır:
```bash
x brew mirror ls          # listele: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # Tsinghua aynasını uygula
x apt mirror set tuna     # Debian / Ubuntu'da aynı biçim (ayrıca dnf, pacman)
```
Hedef paket yöneticisinin kurulu olmasını gerektirir.

## Daha fazlası için

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## İlgili

- [x-cmd](../x-cmd/SKILL.md) — install'in önünde duran şemsiye giriş
- [agent-browser](../../it/agent-browser/SKILL.md) — ikili dosya yokken install, agent-browser'a yönlendirir
- [env](../env/SKILL.md) — install ve env aynı kanal mimarisini paylaşır