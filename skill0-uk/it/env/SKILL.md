---
name: env
description: |
  Миттєве встановлення та керування програмними пакетами, мовними рантаймами та CLI-інструментами.
  Нульовий поріг входу — встановіть x-cmd і отримайте будь-який інструмент за секунди. Без sudo.
  Для "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Миттєво встановлюйте будь-яке ПО. Без sudo. Без засмічення системи.

## Швидкий старт

```bash
# Встановити x-cmd
eval "$(curl https://get.x-cmd.com)"

# Встановити Python
x env use python

# Встановити Node.js
x env use node

# Встановити CLI-інструменти
x env use jq
x env use fzf

# Спробувати без постійного встановлення
x env try python3 script.py
```

## Що доступно

Понад 600 пакетів, зокрема:

- Мови — python, node, go, bun, java, rust
- CLI-інструменти — jq, yq, fzf, himalaya
- Інструменти розробки — claude-code, code-server

## Ключові можливості

- **Без sudo** — встановлення в каталог користувача
- **Керування версіями** — встановлення та перемикання версій
- **Спробувати перед встановленням** — `x env try` для тимчасового використання
- **Очищення** — `x env clean` видаляє невикористані пакети

## Цей skill0 ще росте

Починаємо з основ. Додамо:
- Поширені патерни встановлення
- Поради з фіксації версій
- Посібники з налаштування мультимовних проєктів

## Повний досвід

Після встановлення x-cmd перегляньте всі опції через `x env --help`.

## Related

- [install](../install/SKILL.md) — x env use є одним із каналів install
- [x-cmd](../x-cmd/SKILL.md) — umbrella-точка входу для env
