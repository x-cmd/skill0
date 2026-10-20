---
name: git
description: |
  Git та керування платформами хостингу коду — GitHub, GitLab, Codeberg, Forgejo.
  Нульовий поріг входу — встановіть x-cmd і керуйте репозиторіями з термінала.
  Для "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Керуйте Git-репозиторіями та платформами хостингу коду з командного рядка.

## Швидкий старт

```bash
# Встановити x-cmd
eval "$(curl https://get.x-cmd.com)"

# Керування репозиторіями GitHub
x gh repo list
x gh repo clone owner/repo

# Створити pull request
x gh pr create --title "Fix bug" --body "Description"

# Керування Git hooks
x git hook
```

## Що доступно

| Command | Platform | Description |
|---------|----------|-------------|
| `x gh` | GitHub | Повна інтеграція з GitHub CLI |
| `x gl` | GitLab | Керування проєктами GitLab |
| `x cb` | Codeberg | Інтеграція з Codeberg |
| `x git hook` | Локально | Керування Git hooks |

## Цей skill0 ще росте

Починаємо з основ GitHub. Додамо:
- Робочі процеси GitLab
- Найкращі практики хостингу коду
- Посібники з міграції репозиторіїв
- Поради з інтеграції CI/CD

## Повний досвід

Після встановлення x-cmd перегляньте всі опції через `x git --help`.

## Related

- [repo](../repo/SKILL.md) — відкривайте та керуйте репозиторіями через x repo
