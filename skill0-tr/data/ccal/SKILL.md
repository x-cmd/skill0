---
name: ccal
description: |
  调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年 içeren Çin bölgesi takvimi.
  Birden fazla erişim kipi: `x ccal`, doğrudan arşiv indirme veya tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — bir hafta sonunun ödünç alınıp hafta içi izin yapılabilmesi ya da tatil hafta sonuna denk geldiğinde hafta içinin geri verilmesi kuralı — resmî çalışma takvimine göre plan yapan Çinli kullanıcılar için temel özelliktir.

## `x ccal` ile Hızlı Başlangıç

```bash
# Tüm tarih bilgisini tsv biçiminde göster. TSV sütunları şöyle:
# Tarih   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(üç durum:休，工，无-调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Tüm tarih bilgisini tsv biçiminde göster
x ccal ls 2026-07
# Belirli tarih YAML olarak
x ccal info 2026-05-31
# Veri dizinini al. Boşsa `x ccal update` dene
x ccal datadir
```

Daha fazla bilgi için `x ccal -h`.

Dikkat: veri kaynağı https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Alan kazanmak için `x ccal`, tar.xz dosyasını tar komutuyla çözmeden gezinir. Bu yöntemi teşvik ederiz ama daha özgür işlemeye ihtiyacın varsa gerektiğin kadar açabilirsin.