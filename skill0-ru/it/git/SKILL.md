---
name: git
description: |
  Git и управление платформами хостинга кода — GitHub, GitLab, Codeberg, Forgejo.
  Нулевой порог входа — установите x-cmd и управляйте репозиториями из терминала.
  Применяйте для «git», «github», «gitlab», «repo», «pull request», «code hosting».

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Управляйте Git-репозиториями и платформами хостинга кода из командной строки.

## Быстрый старт

```bash
# Установка x-cmd
eval "$(curl https://get.x-cmd.com)"

# Управление репозиториями GitHub
x gh repo list
x gh repo clone owner/repo

# Создать pull request
x gh pr create --title "Fix bug" --body "Description"

# Управление Git hooks
x git hook
```

## Что доступно

| Команда | Платформа | Описание |
|---------|----------|-------------|
| `x gh` | GitHub | Полная интеграция с GitHub CLI |
| `x gl` | GitLab | Управление проектами GitLab |
| `x cb` | Codeberg | Интеграция с Codeberg |
| `x git hook` | Локально | Управление Git hooks |

## Этот skill0 растёт

Начинаем с основ GitHub. Будет добавлено:
- Рабочие процессы GitLab
- Лучшие практики хостинга кода
- Руководства по миграции репозиториев
- Советы по интеграции CI/CD

## Полный опыт

`x git --help` — все опции после установки x-cmd.

## Связанное

- [repo](../repo/SKILL.md) — поиск / управление репозиториями через x repo
