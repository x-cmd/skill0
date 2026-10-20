---
name: skill0-writer
description: skill0 belgeleri için yazım konvansiyonları — piramit yapı, satır sınırları ve yerleşim kuralları.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Skill0 belgeleri **piramit ilkesini** izler: agent'lar yalnızca ilk 10–30 satırı okuyabilir, bu yüzden en önemli bilgi en başta gelmelidir. 30. satırdan sonraki ayrıntı yük değil, bonustur.

## Hiçbir kuralın yakalamadıkları

- **Kısalık üstünlük değil netliktir.** Yanlış cevap veren kısa belge, doğru cevap veren uzun belgeden kötüdür.
- **Güvenlik / emniyet uyarıları AÇIK olmalıdır** — MUST, NEVER, DO NOT kullan. Uyarıları parantez içi aside değil, tam ifade olarak belirt.
- **Genel bilgiyi uzatma.** Bir konvansiyon kelimesi + bir iki cümle noktayı anlatıyorsa dur. Okuyucu YAML'in, git'in ve cache'in ne olduğunu zaten biliyor; bağlamı bu repoya özgü olan şeye harca. Gerekçe genellikle suçlu olan: bir kuralın nedenini yalnızca nedeni olmadan yanlış göründüğünde ver. (`sw-1200`)
- **Tablolar yalnızca gerçek matrisler için.** Satırları birbirine karşı okunması gereken 3+ sütun. İki sütunlu tablo, tablo sözdizimi giymiş bir listedir — listeyi yaz. Veri seti, belgenin yanına harici `.tsv` olarak konup bağlanmalı, böylece `x tsv` sorgulayabilsin. (`sw-1250`)

## YFM — yalnızca `SKILL.md`

```yaml
---
name: <slug>                  # dizin adıyla aynı olmalı
description: <agent'ın yükleyip yüklemeyeceğine karar vermek için kullandığı 1-2 cümlelik özet>
---
```

`name` ve `description` yük taşıyıcıdır. Geri kalan her şey [yfm](../yfm/SKILL.md) dosyasındaki `metadata:` bloğu altında virgülle ayrılmış skalerler olarak yuvalanır — isteğe bağlıdır ve dizinleme, keşif ve ontoloji kancaları için yapı katar.

**Alt dosyalar YFM taşımaz.** Yalnızca `SKILL.md` bir yükleyici tarafından filtrelendiği için yalnızca o front matter'a ihtiyaç duyar. Diğer her dosya (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) zaten onu açmayı seçmiş bir agent tarafından doğrudan okunur — oradaki YFM tamamen token maliyetidir, başlık ve ilk satırın zaten verdiği amacı tekrar eder. Bu dosyaları `#` başlığıyla başlat. Sapma, dosyanın kendi içinde belirtilmiş bir gerekçe gerektirir.

Çince yerelleştirilmiş sürümler için paralel bir `SKILL.cn.md` kullan (yetenek başına bir tane). Tek dosya içinde dilleri karıştırma.

## Mekanik kontroller

[skill0-writer.rule.yml](skill0-writer.rule.yml) içinde yaşar. `x rule lint skill0-writer.rule.yml` ve `x rule check -r skill0-writer.rule.yml lib/skill0/` çalıştır. Kapsam: YFM varlığı + name/description alanları, name biçimi, satır sayısı ≤ 100 (ideal 50), bölüm sırası install → usage → advanced → links, yalnızca İngilizce, giriş yok / sonuç yok / tekrar yok, yetim dosya yok.

## Kesilme güvenliği kontrolü

Yazdıktan sonra 30. satırda gözden geçir: burada duran bir agent yanlış bir anlayış mı oluştururdu?

Evetse, kritik niteleyiciyi daha yukarı taşı. İlk 30 satır doğru (eksik olsa da) bir zihinsel model vermeli. 30. satırdan sonra ayrıntıyla genişlet — piramit kendini düzeltir.

## İki katmanlı yükleme: eşleştirme için description, referans için gövde

Yetenek yükleyicileri (Claude Code, Cursor, Continue vb.) SKILL.md'yi iki aşamada yükler:

  1. **YFM `description:`** — eşleştirme için agent'ın kataloğuna
     otomatik yüklenir. Agent, yeteneği yükleyip yüklemeyeceğine
     karar vermek için description'ı okur.
  2. **Gövde** — eşleşmeden sonra ihtiyaç duyulduğunda yüklenir. Referans materyali.

Bunun sonuçları:

- **Description** = *ne olduğu + ne zaman yükleneceği* — anahtar kelime yoğun,
  tetikleyici zengin, kısa.
- **Gövde** = *nasıl kullanılacağı + referans* — örnekler, şemalar, uç durumlar,
  daha derin belgelere bağlantılar.

**İki katman arasında içerik tekrarlama.** Description neyi ifade ediyorsa gövde onu *genişletsin*, aynı yüzeyi tekrar etmesin. Özellikle gövdenin ilk paragrafı description'daki aynı özellikleri listelememeli — gövde referansla başlar, ikinci bir özetle değil.

Pratik bir test: description'ı tamamen silip yalnızca gövdenin ilk 30 satırını okursan, agent hâlâ yeteneğin ne yaptığını ve ne zaman yükleneceğini görmeli. Eğer bu bilgi yalnızca description'da taşınıyorsa, gövdenin tepesinde ekleyecek bir şey yoktur — açıklamayı gövdeye taşı ve headline'ı description'da bırak.

## Bir yetenek eğitim değil, bilgi paketidir

Yetenek gövdesi, acemi için bir kurs değil, **LLM için brifingdir**.

- **Yetenek** LLM'de yaşar. Gövde öğretmez.
- **Bilgi** x-cmd veri araçlarında (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) ve dış kaynaklarda yaşar. Gövde işaret eder; agent yeniden getirir.
- **Çerçeveleme** yeteneğin işidir: sorunun biçimini, konvansiyonu, yapılandırılmış çıktıyı, kullanılacak x-cmd aracını adlandırır.

Bir yetenek çözüm açısını, konvansiyonu, çıktı biçimini ve kaynak işaretçilerini taşır. **Taşımaz**: yetkinliği (LLM'de zaten var), statik veriyi (bayatlar), eğitimleri (yan dosyaları kullan).

Spesifikler çok ayrıntılı ya da çok güncel olduğunda, bir yan dosyaya (`references/`, `ANALYTICS.md`) ya da her zaman güncellenen harici bir belgeye it.

## Harici bağlantılar

İki tür topla: **kök bağlantılar** (`llms.txt`, belge dizini gibi giriş noktaları) ve **faydalı bağlantılar** (vakaların %80'ini kapsayan %20 doküman için hedefli bağlantılar). Önce kökü, sonra faydalıları listele — AI sırayı anlar. **Tekrar yok**; vurgu kritikse istisna.

## Yumuşak uyarılar (yargı gerektiren konular)

- **Alt dosyalar (CLEANUP.md, references/*)** SKILL.md'den uzun olabilir ama ilk 20 satır yine yükü taşır (aynı piramit).
- Her alt dosyaya üst SKILL.md'den **mutlaka** bağlantı ver (ileri bağlantı zorunlu). Bir alt dosyadan üst SKILL.md'ye geri bağlantı **isteğe bağlıdır** — usecase dosyaları yollarıyla üste dolaylı olarak atıfta bulunur. [skill0-writer.rule.yml](skill0-writer.rule.yml) içindeki `sw-1000-no-orphan-docs` ile uygulanır.
- **Tahmin** — test edilmiş olguları belirt ya da "test edilmemiş" diye etiketle.
- **Emoji** ancak yeteneğin konusu gerektiriyorsa.

## İlgili

- [yfm](../yfm/SKILL.md) — skill0-writer'ın 1. katmanı olarak uyguladığı YFM konvansiyonu
- [naming](../naming/SKILL.md) — adlandırma da yazım kurallarını izler
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — mekanik uygulama