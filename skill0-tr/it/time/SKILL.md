---
name: time
description: |
  Komut yürütme zamanlaması — mikrosaniye hassasiyeti, istatistiksel analiz, karşılaştırma.
  Sıfır engel — x-cmd ya da kabuğun yerleşik time komutuyla kullan.
  "timing", "benchmark", "performance", "profiling" için kullan.

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Komut yürütme süresini ölç. Tek seferlik mikrosaniye zamanlamadan çok koşulu istatistiksel analize kadar.

## Hızlı Başlangıç

```bash
# x-cmd ile
x time <komut>                      # Tek mikrosaniye zamanlama
x time stress -c 100 <komut>        # 100 koşul istatistik
x time cmp 'cmd1' 'cmd2' 'cmd3'     # Komutları karşılaştır

# x-cmd'siz — kabuğun yerleşiklerini kullan
time <komut>                        # Temel zamanlama
# Karşılaştırmalı ölçüm için bir döngü kullan:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <komut>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Neler Var

- `x time <cmd>` — Tek koşu, mikrosaniye hassasiyeti
- `x time getms <cmd>` — Milisaniye hassasiyeti
- `x time stress -c N <cmd>` — N koşu, tüm istatistiklerle
- `x time stress -b N <cmd>` — Bütçe dahilinde koşu sayısına otomatik karar ver
- `x time cmp 'c1' 'c2'` — Birden çok komutu karşılaştır

## Çıktı Biçimleri

- `--csv` Programatik analiz için CSV
- `--tsv` Sekmeyle ayrılmış
- `--yml` YAML

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Karşılaştırmalı ölçüm kalıpları
- İstatistiksel yorum rehberi
- Yaygın performans kötü kalıpları

## İlgili