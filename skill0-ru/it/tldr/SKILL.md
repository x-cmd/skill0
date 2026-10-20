---
name: tldr
description: |
  Справочник по командам с практическими примерами из проекта tldr-pages.
  Нулевой порог входа — используйте с x-cmd, curl или любым tldr-клиентом.
  Применяйте для «tldr», «cheatsheet», «command help», «examples», «how to».

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Быстрый справочник по командам с реальными примерами. Лучше man-страниц для вопроса «как пользоваться этой командой?».

## Быстрый старт

```bash
# С x-cmd
x tldr git                    # Примеры использования Git
x tldr --lang zh python       # Документация на китайском
x tldr --fz                   # Интерактивный поиск

# Без x-cmd — используйте curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Или установите tldr-клиент
pip install tldr
npm install -g tldr
tldr tar
```

## Что доступно

- `x tldr <cmd>` — Показать примеры для команды
- `x tldr --lang zh <cmd>` — Китайский язык
- `x tldr --fz` — Интерактивный поиск через fzf
- `x tldr --cat <cmd>` — Показать исходный markdown
- `x tldr --ls` — Список всех доступных команд
- `x tldr --update` — Обновить кэш страниц

## Автономные альтернативы

- Онлайн: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Сырые страницы: github.com/tldr-pages/tldr

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Частые шаблоны команд
- Заметки по платформам
- Интеграция с рабочими процессами агентов

## Связанное

- [git](../git/SKILL.md) — tldr часто используемых подкоманд git
- [install](../install/SKILL.md) — tldr подкоманд install
