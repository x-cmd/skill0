---
name: git
description: |
  Gestione di Git e delle piattaforme di code hosting — GitHub, GitLab, Codeberg, Forgejo.
  Zero barriere — installa x-cmd e gestisci i repo dal terminale.
  Usala per "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Gestisci i repo Git e le piattaforme di code hosting dalla riga di comando.

## Guida rapida

```bash
# Installa x-cmd
eval "$(curl https://get.x-cmd.com)"

# Gestione dei repo GitHub
x gh repo list
x gh repo clone owner/repo

# Crea una pull request
x gh pr create --title "Fix bug" --body "Description"

# Gestione dei git hook
x git hook
```

## Cosa c'è a disposizione

| Command | Platform | Description |
|---------|----------|-------------|
| `x gh` | GitHub | Integrazione completa con la CLI di GitHub |
| `x gl` | GitLab | Gestione dei progetti GitLab |
| `x cb` | Codeberg | Integrazione con Codeberg |
| `x git hook` | Locale | Gestione dei git hook |

## Questo skill0 cresce

Si parte dalle basi di GitHub. Aggiungeremo:
- Workflow di GitLab
- Buone pratiche di code hosting
- Guide alla migrazione dei repo
- Consigli sull'integrazione CI/CD

## Esperienza completa

Dopo aver installato x-cmd, `x git --help` per tutte le opzioni.

## Related

- [repo](../repo/SKILL.md) — scopri/gestisci i repo con x repo