---
name: agent-browser
description: Automação de navegador via Chrome/Chromium CDP — abrir, capturar snapshot, clicar, screenshot. Para testar aplicações web, layouts mobile e interações automatizadas sem Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Instalação

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # opcional, pule se já estiver usando um Chrome instalado
```

## Conectar a um Chrome já aberto

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profile & múltiplas sessões

Use `--profile /tmp/ab-default` para autorizar uma vez e compartilhar entre sessões.
Cada novo `--user-data-dir` dispara um prompt de autenticação do Chrome — reaproveite o default para evitá-lo.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Nomes de sessão são globais — use `<projeto>-<device>` para evitar colisões entre agents.
As sessões compartilham o daemon, mas são totalmente isoladas (cookies, cache, abas).

## Skills & comandos comuns

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Os dados se acumulam — veja [CLEANUP.md](CLEANUP.md) para a limpeza periódica.

## Relacionados

- [install](../install/SKILL.md) — instalar/iniciar via canais do x install
- [devloop](../devloop/SKILL.md) — usado para verificação visual antes/depois no devloop
- [lovable](../../life/lovable/SKILL.md) — o lovable encaminha a verificação web pelo agent-browser