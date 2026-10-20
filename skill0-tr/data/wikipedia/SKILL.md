---
name: wikipedia
description: |
  Wikipedia'yı `x wkp` ile ara ve oku — MediaWiki API, API anahtarı yok,
  sıfır kurulum; sorgu, özet çıkarma, öneri ve DDG yönlendirme tek modülde.
  wiki, wikipedia, ansiklopedi araması, makale özeti için yükle.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

Çıktı, düz metin bir özetdir (~ilk paragraf + bilgi kutusu). Fiil biçimindeki alt komut biçimi belirler — arama-sonra-özet için `hop`, bilinen başlıklar için `extract`, adaylar için `search`, "bunu mu demek istediniz" için `suggest`. Varsayılan site İngilizce Wikipedia'dır; `--lang` / `--api-url` diğer wiki'lere geçiş yapar.

## `x wkp` ile Hızlı Başlangıç

```bash
x wkp hop Python                      # arama + ilk sonucun özeti tek seferde
x wkp extract OpenAI                  # bilinen bir sayfanın özeti
x wkp search "Linux kernel"           # başlık belirsizse adayları listele
x wkp suggest pythen                  # bunu mu demek istediniz: aramadan önce düzeltme ipuçları
```

Tüm bayraklar ve alt komutlar için `x wkp -h`.

## Veri ve komşu araçlar

Upstream: `https://en.wikipedia.org/w/api.php` — MediaWiki eylem API'si. Kardeş projeler (Wikidata, Wiktionary, Commons) aynı şekilde erişilebilir; `--api-url`'yi ilgili alt alan adına yönlendir.

Bir wikitext özetinin bir atlam ötesine geçen sorular için:
- `x wkp : <sorgu>` / `x wkp ddgo <sorgu>` — aynı `x wkp` modülü, DuckDuckGo'nun Wikipedia dizini üzerinden yönlendirilir (başlık aramasından daha iyi işe yarayan belirsiz ya da gündelik sorgular)
- `x ddgo <sorgu>` — genel web araması, Wikipedia'da makale yokken ama konu açık web'de varken işe yarar
- Daha geniş `x hn` / `x rfc` / `x se` araştırma araç takımı için [knowledge](../knowledge/SKILL.md) yeteneğine bak
- `x wkp open <sayfa>` — işlenmiş sayfayı gerçekten istediğinde tarayıcıya geri dön (bilgi kutuları, tablolar, görseller)