---
name: tldr
description: |
  tldr-pages projesinden pratik örneklerle komut referansı.
  Sıfır engel — x-cmd, curl ya da herhangi bir tldr istemcisiyle kullan.
  "tldr", "cheatsheet", "command help", "examples", "how to" için kullan.

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Gerçek dünya örnekleriyle hızlı komut referansı. "Bu komutu nasıl kullanırım?" sorusu için man sayfalarından daha iyidir.

## Hızlı Başlangıç

```bash
# x-cmd ile
x tldr git                    # Git kullanım örnekleri
x tldr --lang zh python       # Çince belgeler
x tldr --fz                   # Etkileşimli arama

# x-cmd'siz — curl kullan
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Ya da bir tldr istemcisi kur
pip install tldr
npm install -g tldr
tldr tar
```

## Neler Var

- `x tldr <cmd>` — Bir komut için örnekler göster
- `x tldr --lang zh <cmd>` — Çince dil
- `x tldr --fz` — Etkileşimli fzf araması
- `x tldr --cat <cmd>` — Ham markdown gösterimi
- `x tldr --ls` — Kullanılabilir tüm komutları listele
- `x tldr --update` — Sayfa önbelleğini güncelle

## Bağımsız Alternatifler

- Çevrimiçi: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Ham sayfalar: github.com/tldr-pages/tldr

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Yaygın komut kalıpları
- Platforma özgü notlar
- Agent iş akışlarıyla entegrasyon

## İlgili

- [git](../git/SKILL.md) — sık kullanılan git alt komutlarının tldr'ı
- [install](../install/SKILL.md) — install alt komutlarının tldr'ı