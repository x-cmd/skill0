---
name: tldr
description: |
  Довідник команд із практичними прикладами з проєкту tldr-pages.
  Нульовий бар'єр — працює з x-cmd, curl або будь-яким клієнтом tldr.
  Використовувати для "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Швидкий довідник команд із прикладами з реального життя. Зручніший за man-сторінки, коли питання «як скористатися цією командою?».

## Швидкий старт

```bash
# З x-cmd
x tldr git                    # Приклади використання git
x tldr --lang zh python       # Документація китайською
x tldr --fz                   # Інтерактивний пошук

# Без x-cmd — скористайтеся curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Або встановіть клієнт tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Доступні команди

- `x tldr <cmd>` — показати приклади для команди
- `x tldr --lang zh <cmd>` — китайською мовою
- `x tldr --fz` — інтерактивний пошук через fzf
- `x tldr --cat <cmd>` — показати сирий markdown
- `x tldr --ls` — перелік усіх доступних команд
- `x tldr --update` — оновити кеш сторінок

## Окремі альтернативи

- Онлайн: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Сирі сторінки: github.com/tldr-pages/tldr

## Цей skill0 ще зростає

Починаємо з основного. Далі додамо:
- типові шаблони команд
- нюанси під конкретні платформи
- інтеграцію з робочими процесами агентів

## Related

- [git](../git/SKILL.md) — tldr для часто використовуваних підкоманд git
- [install](../install/SKILL.md) — tldr для підкоманд install