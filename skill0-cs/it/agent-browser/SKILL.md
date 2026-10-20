---
name: agent-browser
description: Automatizace prohlížeče přes Chrome/Chromium CDP — otevření, snímek stránky, kliknutí, screenshot. Pro testování webových aplikací, mobilních rozvržení a automatizovaných interakcí bez Playwrightu/Puppeteeru.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Instalace

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # volitelné, přeskočit, pokud používáte existující Chrome
```

## Připojení k existujícímu Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profil a více session

Použijte `--profile /tmp/ab-default` pro jednorázové autorizování sdílené napříč sessionmi.
Každé nové `--user-data-dir` vyvolá vyzvání k přihlášení v Chrome — výchozí profil znovu použijte, abyste se mu vyhnuli.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Názvy sessioní jsou globální — používejte `<project>-<device>`, abyste se vyhnuli kolizím mezi agenty.
Sessione sdílejí daemon, ale jsou zcela izolované (cookies, cache, panely).

## Skills a běžné příkazy

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Data se hromadí — pravidelné čištění najdete v [CLEANUP.md](CLEANUP.md).

## Související

- [install](../install/SKILL.md) — instalace/spuštění přes kanály x install
- [devloop](../devloop/SKILL.md) — používá se pro vizuální ověření před/po v devloop
- [lovable](../../life/lovable/SKILL.md) — lovable vede webové ověřování přes agent-browser
