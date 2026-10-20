---
name: agent-browser
description: Automatización de navegador vía Chrome/Chromium CDP — abrir, capturar el árbol, hacer clic, sacar capturas. Para probar apps web,layouts móviles e interacciones automatizadas sin Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Instalar

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # opcional, sáltalo si ya usas un Chrome instalado
```

## Conectar a un Chrome existente

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Perfil y multi-sesión

Usa `--profile /tmp/ab-default` para autorizar una vez y compartirlo entre sesiones.
Cada `--user-data-dir` nuevo dispara un aviso de autenticación de Chrome — reutiliza el por defecto para evitarlo.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Los nombres de sesión son globales — usa `<proyecto>-<dispositivo>` para evitar colisiones entre agentes.
Las sesiones comparten el demonio pero están totalmente aisladas (cookies, caché, pestañas).

## Skills y comandos comunes

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Los datos se acumulan — consulta [CLEANUP.md](CLEANUP.md) para la limpieza periódica.

## Relacionadas

- [install](../install/SKILL.md) — instalación/lanzamiento vía los canales de x install
- [devloop](../devloop/SKILL.md) — se usa para la verificación visual antes/después en devloop
- [lovable](../../life/lovable/SKILL.md) — lovable enruta la verificación web a través de agent-browser
