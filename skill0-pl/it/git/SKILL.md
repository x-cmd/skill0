---
name: git
description: |
  Zarządzanie Gitem i platformami hostingu kodu — GitHub, GitLab, Codeberg, Forgejo.
  Bez barier — zainstaluj x-cmd i zarządzaj repozytoriami z terminala.
  Użyj dla "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Zarządzaj repozytoriami Git i platformami hostingu kodu z wiersza poleceń.

## Szybki start

```bash
# Zainstaluj x-cmd
eval "$(curl https://get.x-cmd.com)"

# Zarządzanie repozytoriami na GitHubie
x gh repo list
x gh repo clone owner/repo

# Utwórz pull request
x gh pr create --title "Fix bug" --body "Description"

# Zarządzanie gitowymi hookami
x git hook
```

## Co jest dostępne

| Polecenie | Platforma | Opis |
|---------|----------|-------------|
| `x gh` | GitHub | Pełna integracja z GitHub CLI |
| `x gl` | GitLab | Zarządzanie projektami GitLab |
| `x cb` | Codeberg | Integracja z Codeberg |
| `x git hook` | Lokalnie | Zarządzanie gitowymi hookami |

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw GitHuba. Planowane dodatki:
- Przepływy pracy w GitLabie
- Najlepsze praktyki hostingu kodu
- Przewodniki po migracji repozytoriów
- Wskazówki do integracji CI/CD

## Pełne doświadczenie

`x git --help` dla wszystkich opcji po zainstalowaniu x-cmd.

## Powiązane

- [repo](../repo/SKILL.md) — wykrywaj i zarządzaj repozytoriami przez x repo