---
name: naming
description: |
  x-cmd modülleri / komutları / alt komutları için adlandırma çerçevesi. Öznel + senaryo güdümlü; yetenek
  ince bir kabuktur, kural kitabı DEĞİLDİR. Üç katman: araştır (amaç), naming.<kullanıcı-görevi>.yml
  (OKR + oturum kaydı, bir .rule dosyası), naming.okr-creator.yml (oturumu denetleyen meta-kural).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Adlandırma **öznel + senaryo güdümlüdür**. Bu yetenek bir kural kitabı değil, bir **çerçevedir** — öznel adlandırma kurallarını içine gömmez.

## Hızlı harita

```
┌─────────────────────────────────────────────────────────┐
│  1. amaç ARAŞTIR                                        │
│     Ne adlandırılıyor? Hangi rol? Hangi kavram?        │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<kullanıcı-görevi>.yml  (.rule dosyası)      │
│     - goal-*        (adlandırma görevi)                 │
│     - keyresult-*   (doğrulanabilir sonuçlar)           │
│     - task-*        (göreve özel kısıtlar)              │
│     - session:      (amaç kuralına denetim izi)         │
│         prefer     (5 init-004 sorusu)                  │
│         init_verdicts  (aday başına kapı kararları)     │
│         scores     (aday başına D1-D7 çıpeleme)          │
│         final      (seçim + yedek)                      │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. template/naming.okr-creator.yml ile DENETLE          │
│     x rule check -r <naming-dizini> naming.<kullanıcı-görevi>.yml │
└─────────────────────────────────────────────────────────┘
```

## İş akışı — adım adım

### Adım 1 · Amacı araştır

Bir şey yazmadan önce şu soruları yanıtla. ATLAMA — yanıtlar olmadan puanlayıcı D4'ü (TRIAL/REAL) veya D5'i (RUN/TEST) çıpeleyemez.

- **Ne adlandırılıyor?** — modül / alt komut / alan / değişken — farklı adlandırma biçim kuralları geçerli
- **Hangi rolü oynuyor?** — kavramı çıpeler (ör. "deneme çalıştırma modülü" → bağımsız çalıştırıcı, iki aşamalı testin 1. Aşaması)
- **Hangi ön bilgiyi TAŞIMALI?** — baskın çıplak kelime anlamı tutmalı (ör. trial-run, TRIAL+RUN taşımalı, REAL+TEST değil)
- **Hangi ön bilgilerden KAÇINMALI?** — unittest kirliliği (`*test`/`*case`), sahte (`*mock`/`*fake`/`*stub`/`*dry`), gerçek dağıtım (`field*`/`*live*`)
- **Hangi arketip uyuyor?** — gemi / uçak / roket / fabrika / soyut — D6/D7'yi yönlendirir

Çıktı: tek satırlık amaç ifadesi, ör.
> "Trial-run (iki aşamalı testin 1. Aşaması) için bağımsız bir x-cmd modül adı seç; D1-D7'de 8.0+ alsın, ilk bakışta kendini açıklasın ve tüm kırmızı çizgi / sözlük / uzunluk hızlı- başarısızlıklarından sağ çıksın."

### Adım 2 · Oturum kaydını oluştur

Şablonu kopyala ve kırp / doldur.

```bash
cp naming.template.yml naming.<kullanıcı-görevi>.yml
```

Ardından 4 bölümü doldur (yukarıdan aşağıya):

#### 2a. Amaç kuralı (adlandırma görevi)

`goal-TBD_task_id` yerine gerçek bir ID koy. ID soneki göreyi yansıtmalı (ör. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <Adım 1'den tek satırlık amaç ifadesi>
  apply: "naming.<kullanıcı-görevi>.yml (self)"
  level: error
  desc:
  - <Adım 1'den kavram + rol + karşı-ön bilgiler>
```

#### 2b. Anahtar sonuçlar (doğrulanabilir sonuçlar)

Her `keyresult-kr*_TBD_short_label` öğesini değiştir. Her KR, PASS olabilmesi gereken bir kuraldır. Görevin gerektirdiği kadar ekle.

```yaml
keyresult-kr1-top-pick-committed:
  name: <doğrulanabilir sonuç 1>
  level: error
  desc:
  - <geçmenin ne sayıldığı — somut ölçüt, "iyi görünüyor" değil>
```

#### 2c. Göreve özel kurallar (adaylar üzerindeki kısıtlar)

Her `TBD_task_id-*` öğesini, amacın task-id sonekiyle eşleşen gerçek bir kısıt ID'siyle değiştir. Uygulanmayanları kırp, gerektiğinde yenilerini ekle.

Yaygın kalıplar:
- `must-be-X-not-Y` — kavram hizası (ör. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — D1 sert aralığı
- `must-imply-<arketip>` — D7 bağlayıcı
- `<alan>-specific-acceptable` / `not-acceptable` — dar alan izni
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <kısıt, ör. "must-be-TRIAL-not-REAL">
  apply: "<task-id> için aday kelimeler"
  level: error | warn
  desc:
  - <adayın karşılaması gereken şey>
  - <bu kısıtın hangi D1-D7 boyutunu kısıtladığı>
  tldr:
  - wrong: <karşı örnek>
  - right: <iyi örnek>
```

#### 2d. Oturum kaydı (amaç kuralına denetim izi)

4 alt bölümün tamamını doldur:

**prefer** — Yanıt "hayır / zayıf" olsa bile 5 sorunun **tamamını** yanıtlamalı:
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<kabul edilen dar alanların listesi, ör. [naval]>]   # [] = kabul edilen dar alan yok
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — değerlendirilen her aday için bir girdi, reddedilenler dahil:
```yaml
init_verdicts:
  - { name: <aday>, gate: init-005 | init-006 | init-007 | pass, reason: "<neden>" }
  # init-005 = kırmızı çizgi kalıp eşleşmesi (otomatik ret)
  # init-006 = sözlükteki ilk anlam hedefle çelişiyor
  # init-007 = uzunluk aralık dışı (< 2 veya > 8)
  # pass     = tüm init kapılarından geçti, puanlamaya uygun
```

**scores** — init'ten geçen her aday için bir girdi. Tüm puanlar >= 6.0. Her puan **mutlaka** çıpeklere sahip olmalı:
```yaml
scores:
  - name: <aday>
    score: <0-10>
    anchors:
      - "D1: <harf sayısı kanıtı>"
      - "D2: <sözlükteki ilk anlam kanıtı>"
      - "D3: <bileşik kelimenin harfi harfine kanıtı>"
      - "D4: <trial mi real mi kanıtı>"
      - "D5: <run mı test mi kanıtı>"
      - "D6: <canlılık kanıtı>"
      - "D7: <büyük ekipman kanıtı>"
    misses:
      - "<eksik olan — her zaman 7'sini de yazma, yalnızca gerçek eksikler>"
```

**final** — seçimi + yedeği bildir:
```yaml
final:
  pick: <kazanan aday>
  backup: <ikinci sıradaki ya da null>
```

### Adım 3 · Meta-kural ile denetle

```bash
x rule check -r <naming-dizini> naming.<kullanıcı-görevi>.yml
```

OKR-creator (`template/naming.okr-creator.yml` konumunda) 11 kontrol çalıştırır (error ve warn karışımı):

| Kontrol | Seviye | Neyi doğrular |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | dosyada >=1 `goal-*` kuralı var |
| `okr-creator-002` has-keyresult-rules | error | dosyada >=1 `keyresult-*` kuralı var |
| `okr-creator-003` has-task-specific-rules | error | dosyada >=1 görev kuralı var (goal/keyresult değil) |
| `okr-creator-010` has-session-record | error | amaç kuralında `session:` alanı var |
| `okr-creator-011` prefer-answers-all-five | error | 5 init-004 sorusunun tamamı yanıtlandı |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts boş değil |
| `okr-creator-013` scores-have-anchors | error | her puanın boş olmayan anchors listesi var |
| `okr-creator-014` scores-no-below-6 | error | tüm puanlar >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` bildirildi |
| `okr-creator-020` pick-backup-gap-le-1 | warn | puan(pick) - puan(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | pick puanı >= 7.0 |

**Herhangi bir error kontrolü başarısız olursa**: dosyayı düzelt ve yeniden çalıştır. Yaygın düzeltmeler:
- Eksik prefer alanı → `session.prefer` içine ekle
- Çıpesiz puan → `anchors: [...]` ekle
- Puan < 6 → `init_verdicts` içine taşı (reddedildi) ya da puanı yeniden çerçevele
- Eksik final → `final: { pick, backup }` ekle

**Warn kontrolleri başarısız olursa**: ele alıp almamaya ya da dengeyi belgelemeye karar ver.

### Adım 4 · Kullanıcı nihai adı seçer

Yetenek önerir; kullanıcı karar verir. Nihai ad `session.final.pick` içinde bildirilir ve commit'lenir.

## Dosyalar

| Dosya | Rol | Biçim |
|---|---|---|
| `SKILL.md` | Bu dosya — iş akışı + dosya dizini | markdown |
| `naming.template.yml` | `TBD_*` placeholder'larıyla ŞABLON — kopyala, yeniden adlandır, doldur | `.rule` |
| `naming.trial-run-module.yml` | Eksiksiz bir oturum kaydının işlenmiş örneği | `.rule` |
| `template/naming-concept.yml` | Nesnel değerlendirme çerçevesi (D1–D7, kırmızı çizgiler, puanlama çıpeleme) — `.rule` girdileri olarak | `.rule` |
| `template/naming-brand.yml` | x-cmd marka kuralları (uzunluk, büyük/küçük harf, ön bilgi tercihleri) — `.rule` girdileri olarak | `.rule` |
| `template/naming.okr-creator.yml` | Meta-kural: bir `naming.<kullanıcı-görevi>.yml` denetler (yukarıdaki 11 kontrol) | `.rule` |
| `template/naming-x-cmd-mod.yml` | İsteğe bağlı x-cmd modül adlandırma ön ayarı (başlangıç oturum kaydı) | `.rule` |

## Öznel / nesnel ayrımı

| Nesnel (dosyalarda / kodda) | Öznel (init'te sorulur, puanlanmaz) |
|---|---|
| Sözlükteki ilk anlam | "Canlı mı soyut mu istiyorum" |
| Harf sayısı | "X alanının kabul edilmesini istiyorum" |
| Trial / Real / Run / Test anlam sınıfı | "Denizcilik metaforası olsun mu olmasın mı istiyorum" |
| Bileşik kelimenin harfi harfine anlamı | "Çince köken mi İngilizce köken mi istiyorum" |
| Ön bilgi kirliliği (unittest testcase, dryrun) | "Kısa mı, kendini açıklayan mı istiyorum" |

## Kurallar

- Önce amacı araştır **MUST** — ne adlandırılıyor, hangi rolü oynuyor, hangi kavram çıpeliyor.
- `naming.template.yml`'den (`TBD_*` placeholder'ları) başla ve göreve göre kırp / doldur **MUST**.
- Amaç / anahtar sonuçlar / görev kuralları / oturum kaydı içeren bir `naming.<kullanıcı-görevi>.yml` (`.rule` biçimi) üret **MUST**.
- Oturum kaydını denetlemek için `template/naming.okr-creator.yml` ile `x rule check` çalıştır **MUST**.
- Puanları nesnel olgulara çıpele **MUST** — kullanıcı tepkisine göre şişirme/indirme **asla**.
- Nihai adı kullananın seçmesine bırak **MUST** — yetenek önerir, kullanıcı karar verir.
- `template/naming-concept.yml`'ye öznel kurallar ekleme **MUST NOT** — bunlar görev başına `session.prefer` içine gider.

## İlgili

- [rule](../rule/SKILL.md) — adlandırma oturumu x rule ile denetlenir
- [score](../score/SKILL.md) — adaylar score çerçevesiyle puanlanır
- [ontology-database](../ontology-database/SKILL.md) — seçilen ad ondb'de kalıcıdır