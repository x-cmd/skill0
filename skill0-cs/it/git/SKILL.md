---
name: git
description: |
  Správa Gitu a hostovacích platforem pro kód — GitHub, GitLab, Codeberg, Forgejo.
  Bez jakýchkoli překážek — nainstalujte x-cmd a spravujte repozitáře z terminálu.
  Použijte pro "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Spravujte Git repozitáře a hostovací platformy pro kód z příkazové řádky.

## Rýchlý start

```bash
# Nainstalovat x-cmd
eval "$(curl https://get.x-cmd.com)"

# Správa repozitářů na GitHubu
x gh repo list
x gh repo clone owner/repo

# Vytvořit pull request
x gh pr create --title "Fix bug" --body "Description"

# Správa Git hooků
x git hook
```

## Co je k dispozici

| Příkaz | Platforma | Popis |
|---------|----------|-------------|
| `x gh` | GitHub | Plná integrace s GitHub CLI |
| `x gl` | GitLab | Správa projektů v GitLabu |
| `x cb` | Codeberg | Integrace s Codeberg |
| `x git hook` | Lokálně | Správa Git hooků |

## Tento skill0 poroste

Začínáme základy GitHubu. Bude přidáno:
- Workflow v GitLabu
- Osvědčené postupy pro hostování kódu
- Návody na migraci repozitářů
- Tipy pro integraci CI/CD

## Plné možnosti

`x git --help` pro všechny možnosti po instalaci x-cmd.

## Související

- [repo](../repo/SKILL.md) — objevování/správa repozitářů přes x repo
