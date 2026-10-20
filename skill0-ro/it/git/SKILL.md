---
name: git
description: |
  Management Git și al platformelor de găzduire de cod — GitHub, GitLab, Codeberg, Forgejo.
  Fără bariere — instalează x-cmd și gestionează repo-uri din terminal.
  Folosește pentru "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Gestionează repo-uri Git și platforme de găzduire de cod din linia de comandă.

## Quick Start

```bash
# Install x-cmd
eval "$(curl https://get.x-cmd.com)"

# GitHub repo management
x gh repo list
x gh repo clone owner/repo

# Create a pull request
x gh pr create --title "Fix bug" --body "Description"

# Git hooks management
x git hook
```

## Ce e disponibil

| Comandă | Platformă | Descriere |
|---------|----------|-------------|
| `x gh` | GitHub | Integrare completă cu GitHub CLI |
| `x gl` | GitLab | Management de proiecte GitLab |
| `x cb` | Codeberg | Integrare Codeberg |
| `x git hook` | Local | Managementul git hooks |

## Acest skill0 crește

Pornim de la bazele GitHub. Vom adăuga:
- Workflow-uri GitLab
- Cele mai bune practici de găzduire de cod
- Ghiduri de migrare a repo-urilor
- Sfaturi de integrare CI/CD

## Experiența completă

`x git --help` pentru toate opțiunile, după instalarea x-cmd.

## Related

- [repo](../repo/SKILL.md) — descoperă/gestionează repo-uri prin x repo