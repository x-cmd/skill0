---
name: score
description: |
  AI agent'ları için ağırlıklı boyut puanlama çerçevesi — "Tahmin etme. Puanla." Temel fikir: önce
  ihtiyaçları anla, sonra taslak çıkar ve yinele, agent analisttir. `x score compute` ile sıralı TSV çıktısı.
metadata:
  related: "rule,naming"
---


# Score
"Tahmin etme. Puanla."
AI agent'ları için ağırlıklı boyut puanlama çerçevesi.
## Nasıl kullanılır
**Önce anla, sonra puanla.** Boyutları tanımlamadan önce yeterince soru sor. Yanlış boyutlar → yanlış puanlar, ne kadar hassas olursa olsun.
**Taslak çıkar, sonra yinele.** İhtiyaçlar tam net değilse elinden gelenin en iyisini yap, puanla ve sonuçları göster. Kullanıcılar somut sıralamalara tepki verir — "bu faktör daha yüksek olmalı", "X'i atlamışsın". Bu sinyaldir. İyileştir ve yeniden puanla. Bir tur, on tur tahmin etmekten iyidir.
**Agent analisttir.** compute'dan sonra TSV'yi oku. X'in Y'yi neden yendiğini açıkla. Sürprizleri vurgula. Ayarlamalar öner. Sıralama sohbeti başlatır, bitirmez.
## Çekirdek akış
```
① İhtiyaçları anla  →  ② score.yml tanımla  →  ③ score.tsv puanla  →  ④ x score compute  →  ⑤ Raporla ve yinele
```
Çıktı: `target, total, rank, block, reason, <dim> (X%), evidence`. Toplam 0–100, azalan sıralı. rank=1 en iyi.
## Örnek — kullanıcının tanıtım sloganlarına karar vermesine yardım etmek
1. Değerlendirme boyutlarını ve kriterleri tanımlamak için kullanıcıyla görüş. `slogan.score.yml` yaz.
2. AI her sloganı boyut başına puanlar (0–10, kanıtla) → `slogan.score.tsv`. Toplam ve rank boş bırak.
3. `x score compute slogan.score.yml slogan.score.tsv` → toplam + rank'i doldurur.
4. Sonuçları oku, kullanıcıyla görüş. Puanları ayarla veya aday ekle, tekrarla.
5. Ya da: `x score iter -f slogan.score.yml slogan.score.tsv "<geri bildirim>"`
Daha fazla örnek: [EXAMPLE.md](EXAMPLE.md).
## İki dosyalı model
- `*.score.yml` — Yeniden kullanılabilir standart: boyutlar, faktörler, açıklamalar
- `**.score.tsv` — Hedefler + puanlar + kanıt; 1. sütun = hedef adı
`x score compute <yml> <tsv>` — `python compute.py` ile aynı.
## Uygulama senaryoları
1. **Agent'lara karar iş akışı verir.** score.yml, agent'ı yapılandırılmış bir sürece çıpeklidir — agent son mesajın ruh haline değil standarda uyar.
2. **Kararlar kural tabanlıdır.** Boyutlar × faktörler × kanıt → ağırlıklı toplam → rank. Her puan olgulara çıpeklidir. Akıl yürütme saydamdır.
3. **Farklı ihtiyaçlara ayarlanır.** Boyutları değiştir, faktörleri ayarla, sert filtreler ekle (`block` sütunu). Aynı şablon, farklı kullanıcılar.
4. **İhtiyaçlar netleştikçe evrilir.** Taslak → puan → geri bildirim → iyileştir → keskinleştir.
5. **Her yetenek için standart dosya + arşivlenmiş sonuçlar.** score.yml = karar standardı. score.tsv = karar kaydı. İkisi de arşivlenebilir, incelenebilir, paylaşılabilir.
---
## Formül
```
total = Σ(faktör × puan) ÷ Σ(faktör) × 10   →   0–100
```
- **faktör** — 1–10 tam sayı. Temel = 2. 1=minor, 4=2×, 6=3×, 8=4×, 10=5×. Otomatik normalize edilir.
- **puan** — boyut başına 0–10, kanıta çıpeklidir.
- **toplam** — ağırlıklı toplam 0–100.
Boyut başlıkları ağırlık yüzdesini gösterir: `faktör ÷ Σ(faktör) × 100`.
## Çıktı sütunları
| Sütun | Kaynak | Açıklama |
|--------|--------|-------------|
| `target` | girdi | Aday adı |
| `total` | hesaplanır | Ağırlıklı puan (0–100) |
| `rank` | hesaplanır | 1 = en iyi. Engelliyse `X` |
| `block` | girdi | Sert filtre — boş değilse elendi, sona atıldı, rank=X |
| `reason` | girdi/çıktı | İsteğe bağlı: AI'ın puan nüanslarına dair notları |
| `<dim> (X%)` | hesaplanır | Boyut başına puanlar, başlık ağırlık %'sini gösterir |
| `evidence` | girdi | Her puanı destekleyen olgular |
## Ölçek
- 9–10 — Mükemmel — kriterleri tamamen karşılıyor
- 7–8 — İyi — kriterleri karşılıyor, küçük eksik
- 5–6 — Yeterli — yön doğru, kayda değer eksik
- 3–4 — Zayıf — belirgin boşluk
- 1–2 — Başarısız — ancak ucunu karşılıyor
- 0 — Geçerli değil — uygulanamaz
## Kurallar
1. **Kanıta çıpekleme** — her puan **mutlaka** kanıt taşımalı. Duygular değil, olgular.
2. **Tüm aralığı kullan** — 5 orta noktadır, varsayılan değil. 0 ve 10 nadirdir ama mümkündür.
3. **Faktörler göreli çarpanlardır** — faktör 2, faktör 1'in 2 katı etki demektir. Otomatik normalize edilir.
4. **Hedefler benzersiz ve boş olmayan** — her satırın 1. sütununda bir hedef adı olmalı. Tekrar yok, boşluk yok.
5. **Agent okur, raporlar, karar verir** — compute'dan sonra sonuçları açıkla. Gerektiğinde yeniden puanla ya da yeniden ağırlıklandır.
## Dosyalar
- `SKILL.cn.md` — Çince sürüm
- `compute.py` — Doğrular + toplam + rank hesaplar
- `template/*.score.yml` — 35+ şablon. `x score ls` listeler, `x score init -t <ad>` kopyalar
- `EXAMPLE.md` — Daha fazla kullanım örneği
- `rule-vs-score.md` — rule ile score arasında ne zaman ne kullanılır
- `score-template-writer.md` — Puanlama şablonları nasıl yazılır
## İlgili

- [rule](../rule/SKILL.md) — eşleşen uyum yoldaşı
- [naming](../naming/SKILL.md) — aday adlar burada puanlanır