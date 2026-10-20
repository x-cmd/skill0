---
name: agent-browser
description: Automazione del browser via CDP di Chrome/Chromium — apri, ispeziona, clicca, fai screenshot. Per testare app web, layout mobili e interazioni automatizzate senza Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Installazione

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # facoltativo, salta se usi il Chrome già presente
```

## Collegamento a un Chrome già aperto

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profilo e multi-sessione

Usa `--profile /tmp/ab-default` per autorizzarti una volta sola e condividere tra le sessioni.
Ogni nuovo `--user-data-dir` fa comparire un prompt di autenticazione di Chrome — riusa quello predefinito per evitarlo.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

I nomi delle sessioni sono globali — usa `<progetto>-<dispositivo>` per evitare collisioni tra agenti.
Le sessioni condividono il daemon ma sono completamente isolate (cookie, cache, schede).

## Skill e comandi comuni

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

I dati si accumulano — vedi [CLEANUP.md](CLEANUP.md) per la pulizia periodica.

## Related

- [install](../install/SKILL.md) — installa/avvia tramite i canali x install
- [devloop](../devloop/SKILL.md) — usato per la verifica visiva prima/dopo nel devloop
- [lovable](../../life/lovable/SKILL.md) — lovable instrada la verifica web attraverso agent-browser