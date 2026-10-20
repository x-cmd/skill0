---
name: agent-browser
description: Otomatisasi browser lewat Chrome/Chromium CDP — membuka, snapshot, klik, screenshot. Untuk menguji web app, tata letak seluler, dan interaksi otomatis tanpa Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Instalasi

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # opsional, lewati kalau memakai Chrome yang sudah ada
```

## Menyambung ke Chrome yang sudah jalan

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil & multi-sesi

Pakai `--profile /tmp/ab-default` untuk otorisasi sekali lalu dipakai bersama di banyak sesi.
Setiap `--user-data-dir` baru akan memunculkan prompt autentikasi Chrome — pakai ulang profil default untuk menghindarinya.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Nama sesi bersifat global — pakai `<project>-<device>` supaya tidak bentrok antar agent.
Sesi berbagi daemon, tapi terisolasi penuh (cookie, cache, tab).

## Skills & perintah umum

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Data akan menumpuk — lihat [CLEANUP.md](CLEANUP.md) untuk pembersihan berkala.

## Terkait

- [install](../install/SKILL.md) — instalasi/pelancaran lewat kanal x install
- [devloop](../devloop/SKILL.md) — dipakai untuk verifikasi visual sebelum/sesudah di devloop
- [lovable](../../life/lovable/SKILL.md) — lovable mengarahkan verifikasi web lewat agent-browser