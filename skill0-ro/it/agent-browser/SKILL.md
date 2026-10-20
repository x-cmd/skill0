---
name: agent-browser
description: Automatizare de browser prin Chrome/Chromium CDP — deschide, snapshot, click, captură de ecran. Pentru testarea aplicațiilor web, layout-urilor mobile și interacțiunilor automatizate, fără Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Install

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # optional, skip if using existing Chrome
```

## Conectare la un Chrome existent

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil și multi-sesiune

Folosește `--profile /tmp/ab-default` ca să autorizezi o singură dată și să împărți între sesiuni.
Fiecare `--user-data-dir` nou declanșează un prompt de autentificare Chrome — reutilizează implicitul ca să-l eviți.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Numele sesiunilor sunt globale — folosește `<project>-<device>` ca să eviți coliziunile între agenți.
Sesiunile împart daemonul, dar sunt complet izolate (cookie-uri, cache, tab-uri).

## Skills și comenzi uzuale

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Datele se acumulează — vezi [CLEANUP.md](CLEANUP.md) pentru curățarea periodică.

## Related

- [install](../install/SKILL.md) — instalare/lansare prin canalele x install
- [devloop](../devloop/SKILL.md) — folosit pentru verificarea vizuală înainte/după în devloop
- [lovable](../../life/lovable/SKILL.md) — lovable rutează verificarea web prin agent-browser