---
name: env
description: |
  Мгновенная установка и управление пакетами, языковыми рантаймами и CLI-инструментами.
  Нулевой порог входа — установите x-cmd и получите любой инструмент за секунды. Sudo не требуется.
  Применяйте для «install», «package», «python», «node», «jq», «runtime», «tool».

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Мгновенная установка любого ПО. Без sudo. Без загрязнения системы.

## Быстрый старт

```bash
# Установка x-cmd
eval "$(curl https://get.x-cmd.com)"

# Установка Python
x env use python

# Установка Node.js
x env use node

# Установка CLI-инструментов
x env use jq
x env use fzf

# Попробовать без постоянной установки
x env try python3 script.py
```

## Что доступно

600+ пакетов, в том числе:

- Языки — python, node, go, bun, java, rust
- CLI-инструменты — jq, yq, fzf, himalaya
- Инструменты разработчика — claude-code, code-server

## Ключевые возможности

- **Без sudo** — установка в пользовательский каталог
- **Управление версиями** — установка и переключение версий
- **Попробовать до установки** — `x env try` для временного использования
- **Очистка** — `x env clean` удаляет неиспользуемые пакеты

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Частые шаблоны установки
- Советы по фиксации версий
- Руководства по настройке мультиязычных проектов

## Полный опыт

`x env --help` — все опции после установки x-cmd.

## Связанное

- [install](../install/SKILL.md) — x env use — один из каналов install
- [x-cmd](../x-cmd/SKILL.md) — umbrella-точка входа для env
