---
name: ontology-database
description: TSV ekleme-günlüğü üzerinden tipli bilgi grafiği — varlık CRUD, yönlü ilişkiler, şema doğrulama, çok atlamalı akıl yürütme. `x ondb` ile CLI, AWK/Python/JS/SQLite tarafından okunabilir protokol.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Tipli bilgi grafiği: her şey **varlıktır** (id + type + properties) ve **yönlü ilişkilerle** (from → rel → to) bağlıdır. Tüm değişiklikler TSV satırı ekler — asla üzerine yazmaz. TSV günlüğü veritabanının kendisidir.

## TSV günlük biçimi (protokol)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # varlık oluştur
set     <id>  <epoch_ms>  key  val                             # özelliği güncelle
rm      <id>  <epoch_ms>                                       # varlığı sil
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # ilişki oluştur
unlink  <from>  <rel>  <to>  <epoch_ms>                        # ilişkiyi kaldır
# sekmeyle ayrılmış; kaçış: \t → tab, \n → satır sonu, \\ → ters eğik çizgi
# özellikler ardışık gelen key/val çiftleridir (her biri ayrı bir tab alanı)
```

Bu dili her dil okuyabilir. AWK akıtır, Python sözlük kullanır, SQLite somutlaştırır. **Günlük gerçek kaynaktır.**

## CLI kullanımı

```
x ondb add --type Person --name Alice                            # otomatik UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # varlık detayı
x ondb set --id t1 status=done                                  # özelliği güncelle
x ondb rm --id t1                                               # sil

x ondb link --from proj_001 --rel has_task --to t1              # ilişki oluştur
x ondb link --from t1 --rel blocks --to t2                      # bağlantı özellikleriyle: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # giden ilişkiler
x ondb linked --id t1 --direction incoming                      # gelen (kimi BAĞLIyor)
x ondb related --id proj_001 --rel has_task --json              # karşı taraftaki tam varlık

x ondb ls --type Task                                           # türe göre listele
x ondb query --type Task --where status=open --json             # özelliklere göre filtrele
```

`linked` = ilişki metadatası. `related` = karşı taraftaki tam varlık. Veri dizini için `--dir <yol>` / `-d <yol>` kullan (→ `<yol>/ondb.tsv`).

## Şema ve doğrulama

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # required, enum, sarkan referanslar, kardinalite, döngüler kontrol edilir
```

Yönergeler: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Doğrulama yazmadan ayrıdır.

## Mimari ilkeler

- **Günlük kaynaktır** — TSV günlüğü yetkilidir; SQLite somutlaştırılmış bir görünümdür
- **Yalnızca ekleme** — `set`, `rm`, `unlink` satır ekler; var olan satırları asla değiştirmez
- **Çoklu örnek** — alt alan başına bir ondb (varsayılan); yalnızca alanlar arası zincirler için birleştir
- **Tür = Kavram** — aynı tür adı her zaman aynı kavramı ifade eder
- **İstek üzerine doğrula** — yazma anında şema kontrolü yok; toplu değişikliklerden sonra `validate` çalıştır

## Backend'ler

| Backend | Ne zaman | |
|---|---|---|
| **AWK** (varsayılan) | < 2k varlık | Bağımlılık yok, akış |
| Python | Orta | Zengin veri yapıları |
| JS/Bun | Web uygulamaları | JSON native |
| SQLite | > 5k varlık | TSV günlüğünden otomatik üretilir |

## Dizin yapısı

```
<datadir>/ONDB.DESC.txt    # Zorunlu. ondb örneğini tanımlar
<datadir>/ondb.tsv         # Yalnızca ekleme günlüğü
<datadir>/schema.tsv       # İsteğe bağlı. Kısıtlar
<datadir>/ondb.db          # İsteğe bağlı. SQLite somutlaştırılmış görünüm
```

## Daha fazla bilgi için

- `x ondb --help` — CLI referansı
- `x ondb libpath {awk,py,js}` — özel sorgular için kütüphane yolları
- [ondb SKILL.md](../../../ondb/SKILL.md) — tam dokümantasyon (senaryolar, entegrasyon, özel sorgular, SQLite WAL yapılandırması)

## İlgili

- [yfm](../yfm/SKILL.md) — yfm `metadata:` önerilen içe aktarma yüzeyidir
- [rule](../rule/SKILL.md) — şema doğrulama kuralları rule çerçevesinde yaşar