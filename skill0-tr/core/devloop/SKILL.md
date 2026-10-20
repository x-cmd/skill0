---
name: devloop
description: Hedef güdümlü geliştirme döngüsü — amacı tanımla, anahtar sonuçlarla kuralları yaz, görsel olarak doğrula, issue tracker'a senkronla.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Kurulum

```
x rule init :ror                          # ya da projeye özel kural seti
x env use agent-browser                   # görsel doğrulama için
```

## İş akışı

```
hedef → rule.yml → kod → doğrulama → issue
```

### 1. Hedefi tanımla → rule.yml yaz

Koda başlamadan önce bu görev için bir rule.yml oluştur:

```yaml
goal: "Features bölümünde İngilizce sürümün Çince etiketler göstermesini düzelt"
keyresults:
  - kr-1: "İngilizce modda Features etiketlerinin tümü İngilizce"
  - kr-2: "Çince modda Features etiketleri Çince kalır"
  - kr-3: "Build, regresyon olmadan geçer"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - language=en olduğunda details[] içindeki tüm öğeler İngilizce olmalı
    - İngilizce modda hiçbir etiket rozetinde Çince karakter bulunmamalı
```

Kural alanları: `id`, `name`, `apply`, `level`, `desc`, `tldr`. `x rule -h` dosyasına bak.

Her geliştirme görevi için `goal` ve `keyresults` **zorunlu** alanlardır.

### 2. Yürüt → görsel doğrulama (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... değişiklikleri yap ...
agent-browser --session <proj> screenshot /tmp/after.png
```

Önce ve sonra **mutlaka** ekran görüntüsü al. Niyetle karşılaştır:
1. AI görüş kontrolü: after.png hedefle örtüşüyor mu?
2. Uyuşmuyorsa → yinele ve yeniden ekran görüntüsü al
3. Yüklemeden önce **tüm gizlilik verilerini temizle** (token'lar, e-postalar, kişisel bilgiler)

### 3. x rule ile doğrula

```
x rule scan <dosyalar>     # hızlı (~1 dk), iç döngü için
x rule check <dosyalar>    # kapsamlı (~10 dk)
x rule audit <dosyalar>    # tam rapor (~30 dk)
```

### 4. Issue tracker'a senkronla

[issue/SKILL.md](../issue/SKILL.md) dosyasına bak. Asgari: hedefi, anahtar sonuçları, rule.yml'i, önce/sonra ekran görüntülerini issue'ya gönder.

## Agent araçları

- `x rule scan` — iterasyon sırasında hızlı kontrol
- `x rule check` — commit öncesi tam uyum
- `agent-browser screenshot` — önce/sonra görsel kanıt
- `gh issue create/comment` — hedef + rule.yml'i tracker'a senkronla

## İlgili

- [rule](../rule/SKILL.md) — rule.yml doğrulama iskeletidir
- [score](../score/SKILL.md) — KR puanlaması score çerçevesini kullanır
- [install](../install/SKILL.md) — geliştirme ortamını kurar
- [agent-browser](../../it/agent-browser/SKILL.md) — görsel önce/sonra doğrulaması
- [issue](../issue/SKILL.md) — hedef + KR + ekran görüntülerini issue tracker'a senkronlar
- [repo](../repo/SKILL.md) — repo içinde çalışmayı çeker/gönderir
- [prompt](../prompt/SKILL.md) — prompt konvansiyonları çoğu zaman devloop görevlerini yönlendirir