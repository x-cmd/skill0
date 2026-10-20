---
name: agent-browser
description: Automatyzacja przeglądarki przez CDP Chrome/Chromium — otwieranie, migawka, klikanie, zrzuty ekranu. Do testowania aplikacji webowych, układów mobilnych i zautomatyzowanych interakcji bez Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Instalacja

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # opcjonalne, pomiń jeśli używasz istniejącego Chrome
```

## Podłączenie do istniejącego Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil i wiele sesji

Użyj `--profile /tmp/ab-default`, aby autoryzować raz i dzielić wynik między sesjami.
Każdy nowy `--user-data-dir` wywołuje monit o zalogowanie w Chrome — używaj ponownie domyślnego, żeby go uniknąć.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Nazwy sesji są globalne — używaj `<projekt>-<urządzenie>`, żeby uniknąć kolizji między agentami.
Sesje dzielą demona, ale są w pełni odizolowane (ciasteczka, cache, karty).

## Umiejętności i typowe polecenia

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Dane się kumulują — zobacz [CLEANUP.md](CLEANUP.md), jeśli chcesz je okresowo sprzątać.

## Powiązane

- [install](../install/SKILL.md) — instalacja/uruchomienie przez kanały x install
- [devloop](../devloop/SKILL.md) — używany do wizualnej weryfikacji przed/po w devloop
- [lovable](../../life/lovable/SKILL.md) — lovable kieruje weryfikację webową przez agent-browser