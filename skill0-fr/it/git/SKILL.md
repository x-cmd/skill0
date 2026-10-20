---
name: git
description: |
  Gestion de Git et plateformes d'hébergement de code — GitHub, GitLab, Codeberg, Forgejo.
  Zéro barrière — installez x-cmd et gérez vos repos depuis le terminal.
  À utiliser pour « git », « github », « gitlab », « repo », « pull request », « code hosting ».

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Gérez les repos Git et plateformes d'hébergement de code depuis la ligne de commande.

## Démarrage rapide

```bash
# Installer x-cmd
eval "$(curl https://get.x-cmd.com)"

# Gestion de repo GitHub
x gh repo list
x gh repo clone owner/repo

# Créer une pull request
x gh pr create --title "Fix bug" --body "Description"

# Gestion des git hooks
x git hook
```

## Ce qui est disponible

| Commande | Plateforme | Description |
|---------|------------|-------------|
| `x gh` | GitHub | Intégration GitHub CLI complète |
| `x gl` | GitLab | Gestion de projet GitLab |
| `x cb` | Codeberg | Intégration Codeberg |
| `x git hook` | Local | Gestion des git hooks |

## Ce skill0 grandit

Commence avec les bases GitHub. Ajoutera :
- Workflows GitLab
- Best practices d'hébergement de code
- Guides de migration de repo
- Astuces d'intégration CI/CD

## Expérience complète

`x git --help` pour toutes les options après avoir installé x-cmd.

## Related

- [repo](../repo/SKILL.md) — découvrir/gérer les repos via x repo
