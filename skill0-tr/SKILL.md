---
name: skill0
description: "x-cmd skill0 alt yeteneklerinin kök dizini. OKR tarzı agent iş akışını (hedef → kuralla doğrulanmış sonuç → yürütme), yetenek keşfini ve agent araç tercihlerini tanımlar. Stil: önce ilke, kısa ol; ayrıntıları yetkili dış kaynaklara devret."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 veri değil, ilkeleri kodlar

LLM genel bilgiyi sürekli içine alır; skill0'ın işi konvansiyonları ve kaynak işaretçilerini kodlamak, sonra LLM yetiştiççe zamanla inceltmektir. Birinci taraf verilerle (`x rfc`, `x cve`, `x wkp`, `agent-browser`) ve güncel en iyi uygulamalarla (`x skill`, `x clawhub`) doğrula, sonra ezberlemek yerine biçimsel mantıkla yeniden kur.

## Alt yetenekler 4 bucket içinde yönlü bir grafik oluşturur

Bucket'lar: `core/`, `data/`, `it/`, `life/`. Yol: `<bucket>/<slug>/SKILL.md`. Makine tarafından okunabilir katalog (name + description) [index.tsv](index.tsv) içinde. Burada daha önce bir yönetici/yaşam tarzı etkileşim rehberi olarak duran bir belge vardı; skill0 grafiğinin parçası olmadığı için [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) dosyasına taşındı.

## Hedef → keyresults → x-rule, OKR iş akışıdır

Amaç: Neye ulaşılacak
Anahtar Sonuçlar: Nasıl doğrulanacak
Doğrulama: `x rule check/audit`

## İskelet kurulduktan sonra yürütme için x-cmd araçlarını tercih et

- `x skill` — x-cmd'nin seçilmiş, insan elinden geçmiş yetenek kataloğu.
- `x clawhub` — global yetenek kayıt merkezi. **Dikkat**: serbest yükleme var, otomatik üretilen güvenlik raporu için **mutlaka** `x clawhub skill moderate <name>` çalıştır.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — proje yönetimi, zamanlama, arka plan agent'ları, ontoloji, wiki. `x [mod] --help` çalıştır.

## Her SKILL.md skill0-writer'dan geçmelidir

Konvansiyonlar için [skill0-writer](core/skill0-writer/SKILL.md) dosyasına bak.