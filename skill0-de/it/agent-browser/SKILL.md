---
name: agent-browser
description: Browser-Automatisierung über Chrome/Chromium CDP — öffnen, snapshotten, klicken, screenshotten. Zum Testen von Web-Apps, mobilen Layouts und automatisierten Interaktionen ohne Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Installieren

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # optional, überspringen wenn du ein vorhandenes Chrome nutzt
```

## Mit einem vorhandenen Chrome verbinden

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil & Multi-Session

Nutze `--profile /tmp/ab-default`, um einmal zu autorisieren und sitzungsübergreifend zu teilen.
Jedes neue `--user-data-dir` löst eine Chrome-Authentifizierungsabfrage aus — verwende das Standardprofil weiter, um sie zu vermeiden.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Session-Namen sind global — nutze `<projekt>-<gerät>`, um Kollisionen zwischen Agenten zu vermeiden.
Sessions teilen sich den Daemon, sind aber vollständig isoliert (Cookies, Cache, Tabs).

## Skills & häufige Befehle

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Daten sammeln sich an — siehe [CLEANUP.md](CLEANUP.md) für die regelmäßige Bereinigung.

## Verwandt

- [install](../install/SKILL.md) — installieren/Starten über die x-install-Kanäle
- [devloop](../devloop/SKILL.md) — wird für die visuelle Verifikation vorher/nachher in devloop genutzt
- [lovable](../../life/lovable/SKILL.md) — lovable leitet die Web-Verifikation über agent-browser
