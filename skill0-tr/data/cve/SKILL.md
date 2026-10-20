---
name: cve
description: |
  CVE kayıtlarını `x cve` ile ara — önbellekli, API anahtarı gerektirmez, günlük xz TSV.
  cve, açık id, kev, epss, nvd, cvelist veya güvenlik duyurusu için yükle.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

Yıl başına xz sıkıştırılmış TSV; içinde bulunulan yıl ve geçen yıl otomatik yenilenir (1 saat TTL), daha eski yıllar 180 gün donmuş kalır. İlk çevrimiçi günün ardından `x cve` süresiz çevrimdışı çalışır.

## `x cve` ile Hızlı Başlangıç

```bash
x cve info CVE-2024-0001      # id ile ara (kısaltma: x cve 2024-0001)
x cve year 2024               # yıl bazlı akış, pipe'a uygun TSV
x cve detail CVE-2024-0001    # tam upstream kaydı (ürünler, CWE, referanslar, ADP)
```

Tüm bayraklar, alt komutlar ve kısaltma biçimleri için `x cve -h`.

## Veri ve komşu araçlar

Günlük xz TSV, `github.com/x-cmd/cve/releases/download/data/` adresinde yayımlanır (şema release içinde belgelenmiştir). Önbelleğe alınan kayıt ince bir yansımadır — onun bir atlam ötesine geçen sorular için:

- `x shodan cve CVE-X` — EPSS puanı, KEV üyeliği, istismar yazıları, satıcı duyuruları
- `x kev ls` — CISA KEV kataloğu (bilinen-istismar listesi, tam tablo)
- `x osv` — paket sürümü düzeyinde sorgu ("benim sürümüm savunmasız mı"); `osv-*` ve `cve-*` id'lerini kabul eder
- `x cve detail` — ham `CVEProject/cvelistV5` JSON'ı (kanonik upstream, ihtiyaç duyulduğunda getirilir)