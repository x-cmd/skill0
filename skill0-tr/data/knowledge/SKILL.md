---
name: knowledge
description: |
  Hacker News, Wikipedia, DuckDuckGo, RFC belgeleri ve Stack Exchange'i komut satırından ara.
  Sıfır engel — x-cmd'yi kur ve aramaya başla.
  "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow" için kullan.

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

İnternetin bilgi kaynaklarını komut satırından ara.

## Hızlı Başlangıç

```bash
# x-cmd'yi kur
eval "$(curl https://get.x-cmd.com)"

# Hacker News en üst gönderileri
x hn top

# Wikipedia araması
x wkp "artificial intelligence"

# DuckDuckGo araması
x ddgo "rust programming language"

# RFC belgeleri
x rfc 2616

# Stack Exchange araması
x se "how to exit vim"
```

## Neler Var

| Komut | Kaynak | Örnek |
|---------|--------|---------|
| `x hn top` | Hacker News | En trend 10 gönderi |
| `x hn new` | Hacker News | En son gönderimler |
| `x wkp <sorgu>` | Wikipedia | Makale ara |
| `x ddgo <sorgu>` | DuckDuckGo | Web araması |
| `x rfc <numara>` | RFC belgeleri | RFC şartnamelerini oku |
| `x se <sorgu>` | Stack Exchange | Soru-cevap ara |

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Daha fazla kaynak (Project Gutenberg, arxiv)
- Gelişmiş arama kalıpları
- Sonuç filtreleme ve biçimlendirme ipuçları

## Tam deneyim

x-cmd'yi kurduktan sonra tüm seçenekler için `x knowledge --help`.

## İlgili