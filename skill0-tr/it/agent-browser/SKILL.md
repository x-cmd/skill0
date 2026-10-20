---
name: agent-browser
description: Chrome/Chromium CDP üzerinden tarayıcı otomasyonu — aç, anlık görüntü al, tıkla, ekran görüntüsü al. Web uygulamalarını, mobil yerleşimleri ve otomatik etkileşimleri Playwright/Puppeteer olmadan test etmek için.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Kurulum

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # isteğe bağlı, mevcut Chrome'u kullanıyorsan atla
```

## Var olan Chrome'a bağlan

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil ve çoklu oturum

Bir kez yetkilendirip oturumlar arasında paylaşmak için `--profile /tmp/ab-default` kullan.
Her yeni `--user-data-dir` bir Chrome kimlik doğrulama istemi tetikler — bundan kaçınmak için varsayılanı yeniden kullan.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Oturum adları globaldir — agent'lar arasında çakışmayı önlemek için `<proje>-<cihaz>` kullan.
Oturumlar daemon'u paylaşır ama tamamen izole birimdir (çerezler, önbellek, sekmeler).

## Yetenekler ve sık kullanılan komutlar

```
agent-browser skills get core --full
agent-browser open <url> --session <ad> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Veri birikir — periyodik temizlik için [CLEANUP.md](CLEANUP.md) dosyasına bak.

## İlgili

- [install](../install/SKILL.md) — x install kanallarıyla kur/başlat
- [devloop](../devloop/SKILL.md) — devloop'ta görsel önce/sonra doğrulaması için kullanılır
- [lovable](../../life/lovable/SKILL.md) — lovable, web doğrulamasını agent-browser üzerinden yapar