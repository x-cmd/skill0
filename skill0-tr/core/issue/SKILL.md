---
name: issue
description: devloop için issue yönetimi — hedef, rule.yml, anahtar sonuçlar ve issue yaşam döngüsü şablonları.
metadata:
  related: "devloop,repo"
---


# issue

[devloop](../devloop/SKILL.md)'un bir parçası.

## Yeni geliştirme issue şablonu

```
gh issue create --title "<kapsam>: <kısa açıklama>" --body "$(cat <<'EOF'
## Hedef
<tek satırlık amaç>

## Anahtar Sonuçlar
- [ ] KR-1: <doğrulanabilir sonuç>
- [ ] KR-2: <doğrulanabilir sonuç>

## rule.yml
```yaml
goal: "<yukarıdakiyle aynı>"
keyresults:
  - kr-1: "<yukarıdakiyle aynı>"
  - kr-2: "<yukarıdakiyle aynı>"
rules:
  - id: <rule-id>
    name: <ad>
    apply: "<dosya deseni>"
    level: error
    desc:
    - <ölçüt>
```

## Ekran Görüntüleri
- Önce: <görsel veya "Yok">
- Sonra: <görsel veya "beklemede">
EOF
)"
```

## Issue yaşam döngüsü

| Aşama | Eylem | Yorum içeriği |
|-------|--------|-----------------|
| Oluşturuldu | Şablonla `gh issue create` | hedef, anahtar sonuçlar, rule.yml |
| Sürüyor | Çalışma ilerledikçe güncelle | ilerleme notları, ara ekran görüntüleri |
| Doğrulandı | `x rule check` geçti | rule check sonucu, sonrası ekran görüntüsü |
| Kapatıldı | `gh issue close` | commit SHA, nihai doğrulama özeti |

## Tamamlanma yorumu şablonu

```
gh issue comment <n> --body "$(cat <<'EOF'
## Doğrulandı
- rule.yml: <kod bloğu veya bağlantı>
- x rule check: GEÇTİ
- Önce: <görsel>
- Sonra: <görsel>
- Commit: <sha>
EOF
)"
```

## Kurallar

- Her geliştirme issue'sunda `goal` ve `keyresults` **zorunlu** — istisnasız
- rule.yml, issue gövdesinde ya da ilk yorumda kod bloğu olarak **gönderilmeli**
- Frontend değişiklikleri için önce ve sonra **mutlaka** ekran görüntüsü alınmalı
- Doğrulama kanıtı olmadan issue **asla** kapatılmamalı
- Issue'ları proje panosuna bağla, roadmap görünürlüğü için

## İlgili

- [devloop](../devloop/SKILL.md) — hedef güdümlü döngülerin tracker'ı (hedef/rule.yml/KR'ler)
- [repo](../repo/SKILL.md) — issue'lar x-repo yerleşiminde repolara bağlanır