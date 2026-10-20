---
name: agent-browser
description: Automatisation de navigateur via Chrome/Chromium CDP — open, snapshot, click, screenshot. Pour tester des apps web, des layouts mobile, et des interactions automatisées sans Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Installer

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # optionnel, sautez si vous utilisez un Chrome existant
```

## Se connecter à un Chrome existant

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil & multi-session

Utilisez `--profile /tmp/ab-default` pour vous autoriser une fois et partager entre sessions.
Chaque nouveau `--user-data-dir` déclenche un prompt d'auth Chrome — réutilisez le défaut pour l'éviter.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Les noms de session sont globaux — utilisez `<projet>-<appareil>` pour éviter les collisions entre agents.
Les sessions partagent le daemon mais sont totalement isolées (cookies, cache, onglets).

## Skills & commandes courantes

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Les données s'accumulent — voir [CLEANUP.md](CLEANUP.md) pour le nettoyage périodique.

## Related

- [install](../install/SKILL.md) — install/launch via les canaux x install
- [devloop](../devloop/SKILL.md) — utilisé pour la vérification visuelle avant/après dans devloop
- [lovable](../../life/lovable/SKILL.md) — lovable route la vérification web via agent-browser
