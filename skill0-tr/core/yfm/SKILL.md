---
name: yfm
description: |
  Herhangi bir markdown makalesi için YAML front matter (YFM). x-cmd'nin varsayılanı üç üst düzey alandır: `tags`, `description`, `memo`. Varsayılan, Agent Skills frontmatter biçimini ödünç alır — bkz. <https://agentskills.io/specification>. yfm modülü bir yardımcıdır: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## YFM benimse

Bir agent, dizin ya da ontoloji hattının tarayabileceği her markdown için YFM kullan. **Başka bir lehçe zaten kullanılıyorsa ona uy** (Agent Skills, Obsidian, Jekyll, Hugo vb.) — x-cmd varsayılanı yalnızca başka bir lehçe yönetmiyorsa geçerlidir.

## x-cmd varsayılanı: üç alan

```yaml
---
tags: [design, front-matter]
description: Okuyucunun bu dosyayı açıp açmayacağına karar vermek için kullandığı tek cümlelik özet.
memo:
  2026-07-31T14:30:00+08:00: Cut aliases; üçüncü alanın adı memo olarak değiştirildi.
---

# Başlık

Gövde...
```

- **`tags`** — slug'lardan oluşan üst düzey liste `[a-z0-9-]`. Tüketici: ontoloji dizinleme için toplayıcı.
- **`description`** — üst düzey metin. Tek cümle. Agent Skills `description:` değildir (bu yalnızca SKILL.md gereksinimidir, `skill0-writer` tarafından yönetilir).
- **`memo:`** — üst düzey harita, dosyanın revizyon günlüğü. Anahtarlar ISO 8601 zaman damgalarıdır (`YYYY-MM-DDTHH:mm:ss±HH:mm`, yazarın yerel ofseti); değerler kısa değişiklik açıklamalarıdır. Önce yeni. Kaydedilmeye değer geçmiş yoksa atla.

### Uygulanabilir kapsam

- `<proje>/.x-cmd/story/` — `issue:` ile genişler — bkz. [usecase/story.md](usecase/story.md).
- GitHub issue / PR gövdeleri — `repo:`, `number:` ile genişler — bkz. [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- GitHub `README.md` — yalnızca varsayılan alanlar.

## Modül

yfm modülü bir yardımcıdır. Üç komut:

- `x yfm ls [yol]` — YFM bloklarını listele; varsayılan olarak mevcut dizin
- `x yfm init [yol]` — yol altındaki her markdown dosyasına x-cmd varsayılan bloğu yaz
- `x yfm lint [yol]` — her YFM bloğunun geçerli YAML olduğunu ve iddia ettiği lehçeyi izlediğini denetle

## Yabancı front matter okuma

Toplayıcı birçok lehçeyi içe aktarır. Varsayılanın ödünç aldığı şartname için bkz. <https://agentskills.io/specification>. Lehçe başına:

- [Agent Skills](usecase/agentskills.md) — `metadata:` string→string'dir; üst düzey kapalıdır
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` ayrılmıştır
- [Jekyll](usecase/jekyll.md) — liste veya **boşlukla** ayrılmış
- [Hugo](usecase/hugo.md) — TOML mümkün; site yapılandırmasından gelen taksonomi