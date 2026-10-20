---
name: agent-browser
description: Автоматизація браузера через Chrome/Chromium CDP — open, snapshot, click, screenshot. Для тестування вебзастосунків, мобільних макетів та автоматизованих взаємодій без Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Встановлення

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # необов'язково, пропустіть, якщо використовуєте наявний Chrome
```

## Підключення до наявного Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profile та кілька session

Використайте `--profile /tmp/ab-default`, щоб авторизуватися один раз і мати спільний доступ між сесіями.
Кожен новий `--user-data-dir` спричиняє запит на авторизацію в Chrome — перевикористовуйте дефолтний, щоб уникнути його.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Назви session є глобальними — використовуйте `<project>-<device>`, щоб уникнути конфліктів між різними agent.
Session мають спільний daemon, але повністю ізольовані (cookies, cache, tabs).

## Вміння та поширені команди

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Дані накопичуються — про періодичне очищення див. [CLEANUP.md](CLEANUP.md).

## Related

- [install](../install/SKILL.md) — встановлення / запуск через канали x install
- [devloop](../devloop/SKILL.md) — використовується для візуальної перевірки «до / після» у devloop
- [lovable](../../life/lovable/SKILL.md) — lovable проганяє вебперевірку через agent-browser
