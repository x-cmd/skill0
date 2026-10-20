---
name: agent-browser
description: Автоматизация браузера через Chrome/Chromium CDP — open, snapshot, click, screenshot. Для тестирования веб-приложений, мобильных макетов и автоматизированного взаимодействия без Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Установка

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # опционально, пропустите, если используете существующий Chrome
```

## Подключение к существующему Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Профиль и несколько сессий

Используйте `--profile /tmp/ab-default`, чтобы авторизоваться один раз и делиться состоянием между сессиями.
Каждый новый `--user-data-dir` вызывает запрос авторизации Chrome — переиспользуйте дефолтный, чтобы избежать его.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Имена сессий глобальны — используйте формат `<project>-<device>`, чтобы избежать коллизий между агентами.
Сессии разделяют демон, но полностью изолированы (cookies, кэш, вкладки).

## Навыки и частые команды

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Данные накапливаются — периодическую очистку смотрите в [CLEANUP.md](CLEANUP.md).

## Связанное

- [install](../install/SKILL.md) — установка / запуск через каналы x install
- [devloop](../devloop/SKILL.md) — используется для визуальной проверки до/после в devloop
- [lovable](../../life/lovable/SKILL.md) — lovable направляет верификацию веб-страниц через agent-browser
