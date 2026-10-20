---
name: prompt
description: x-cmd için prompt mühendisliği konvansiyonları — şablon değişkenleriyle yeniden kullanım, yapı kuralları, güvenlik uygulama kalıpları.
metadata:
  related: "devloop,rule"
---


# Prompt

## Çekirdek ilke: kopyalama, yeniden kullan

x-cmd'deki prompt'lar tek parça olarak yazılmaz, yeniden kullanılabilir parçalardan birleştirilir. Bir prompt şablonu, runtime'da kabuk modülü tarafından çözülen `<PLACEHOLDER>` değişkenleri içerir.

`claw`'dan örnek:
```
first_contact.md          # bağımsız — <FIRST_CONTACT_PROMPT> içine yüklenir
msg_telegram.md           # birleştirir: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # aynı parçalar, farklı platform adaptörü
heartbeat.md              # farklı iş akışı, <CHECK_PROMPT>'u paylaşır
```

**Neden**: bir düzeltme her yere yayılır. Platform adaptörleri (Telegram, Feishu, WeChat) davranış kurallarını paylaşır ama gönderme komutları ve biçimlendirme sınırları farklıdır.

Ayrıntılı yeniden kullanım kalıpları için [reusing.md](reusing.md) dosyasına bak.

## Yapı kuralları

- Her prompt dosyası, tek bir senaryo için eksiksiz ve kendi kendine yeten bir talimat setidir
- Değişkenler için `<BÜYÜK_HARF>` placeholder'ları kullan — gerçek veriyi asla satır içine gömme
- Placeholder'ları çağıran modül çözer, prompt'un kendisi değil
- Parça = fonksiyon (mantık ve akış), veri runtime'da eklenir (argüman set etmek gibi)

## Güvenlik uygulama kalıbı

Güvenlik ve davranış kuralları **açık ve güçlü** olmalıdır:

```
=== KIRILMAZ KURALLAR ===
>> KURAL 1: stdout'un GÖRÜNMEZ. Her yanıt gönderme komutu kullanmalı. <<
>> KURAL 2: Önce yanıtla, sonra düşün. Önemsiz olmayan görevlerde hemen onay gönder. <<
>> KURAL 3: Karmaşık/uzun görevler → `x agent run` kullan. Kullanıcıyı bloklama. <<
```

MUST, NEVER, DO NOT kullan. Güvenlik dili kuralı için [skill0-writer](../skill0-writer/SKILL.md) dosyasına bak.

## Biçim rehberi kalıbı

Prompt'lar farklı biçimlendirme yeteneklerine sahip çoklu platformları hedeflediğinde:

```
BİÇİM REHBERİ:
- WeChat / Enterprise WeChat: Sınırlı biçimlendirme. Düz metin, liste, emoji. Tablo yok.
- Telegram: Tablolar dahil tam markdown. En fazla 4096 karakter.
- Feishu: Tam markdown. Kart mesajları JSON gerektirir.
```

## Gerçek örnekler

Prompt parçaları şu anda her modülün `lib/data/prompt/` dizininde yaşıyor (ör. `claw/lib/data/prompt/`).
Bunlar `skill0/lib/skill0/<altyetenek>/` konumuna taşınacak — aynı yapı, kanonik konum.

`claw/lib/data/prompt/` içindeki güncel örnekler:
- `first_contact.md` — yeni çalışma alanı selamı, yeniden kullanılabilir parça
- `heartbeat.md` — arka plan agent'ı, çalışma alanı durumunu okur
- `msg_<platform>.md` — platform başına mesaj işleyicileri, ortak parçaları paylaşır

## İlgili

- [devloop](../devloop/SKILL.md) — prompt'lar çoğu zaman devloop görevlerini yönlendirir
- [rule](../rule/SKILL.md) — prompt yapı kuralları x rule ile uygulanır