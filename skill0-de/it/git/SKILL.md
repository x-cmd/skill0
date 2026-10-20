---
name: git
description: |
  Git- und Code-Hosting-Plattform-Verwaltung — GitHub, GitLab, Codeberg, Forgejo.
  Null Hürde — x-cmd installieren und Repos vom Terminal aus verwalten.
  Für "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Git-Repos und Code-Hosting-Plattformen von der Kommandozeile aus verwalten.

## Schnellstart

```bash
# x-cmd installieren
eval "$(curl https://get.x-cmd.com)"

# GitHub-Repo-Verwaltung
x gh repo list
x gh repo clone owner/repo

# Einen Pull Request erstellen
x gh pr create --title "Fix bug" --body "Description"

# Git-Hooks-Verwaltung
x git hook
```

## Was verfügbar ist

| Befehl | Plattform | Beschreibung |
|--------|-----------|--------------|
| `x gh` | GitHub | volle GitHub-CLI-Integration |
| `x gl` | GitLab | GitLab-Projektverwaltung |
| `x cb` | Codeberg | Codeberg-Integration |
| `x git hook` | Lokal | Git-Hooks-Verwaltung |

## Dieses skill0 wächst

Startet mit den GitHub-Grundlagen. Hinzu kommen:
- GitLab-Workflows
- Best Practices für Code-Hosting
- Anleitungen zur Repo-Migration
- Tipps zur CI/CD-Integration

## Volles Erlebnis

`x git --help` für alle Optionen, nachdem x-cmd installiert ist.

## Verwandt

- [repo](../repo/SKILL.md) — Repos über x repo entdecken/verwalten
