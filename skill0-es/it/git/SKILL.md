---
name: git
description: |
  Gestión de Git y de plataformas de alojamiento de código — GitHub, GitLab, Codeberg, Forgejo.
  Sin barreras — instala x-cmd y gestiona repos desde el terminal.
  Úsalo para "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Gestiona repos Git y plataformas de alojamiento de código desde la línea de comandos.

## Inicio rápido

```bash
# Instala x-cmd
eval "$(curl https://get.x-cmd.com)"

# Gestión de repos en GitHub
x gh repo list
x gh repo clone owner/repo

# Crear un pull request
x gh pr create --title "Fix bug" --body "Description"

# Gestión de hooks de Git
x git hook
```

## Qué hay disponible

| Comando | Plataforma | Descripción |
|---------|----------|-------------|
| `x gh` | GitHub | Integración completa con GitHub CLI |
| `x gl` | GitLab | Gestión de proyectos de GitLab |
| `x cb` | Codeberg | Integración con Codeberg |
| `x git hook` | Local | Gestión de hooks de Git |

## Esta skill0 crece

Empezando por lo esencial de GitHub. Se añadirá:
- Flujos de trabajo de GitLab
- Buenas prácticas de alojamiento de código
- Guías de migración de repos
- Consejos de integración CI/CD

## Experiencia completa

`x git --help` para todas las opciones tras instalar x-cmd.

## Relacionadas

- [repo](../repo/SKILL.md) — descubre/gestiona repos vía x repo
