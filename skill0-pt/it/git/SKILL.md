---
name: git
description: |
  Gerenciamento de Git e de plataformas de hospedagem de código — GitHub, GitLab, Codeberg, Forgejo.
  Zero barreira — instale o x-cmd e gerencie repos a partir do terminal.
  Use para "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Gerencie repos Git e plataformas de hospedagem de código pela linha de comando.

## Início rápido

```bash
# Instalar o x-cmd
eval "$(curl https://get.x-cmd.com)"

# Gerenciamento de repos no GitHub
x gh repo list
x gh repo clone owner/repo

# Criar um pull request
x gh pr create --title "Corrige o bug" --body "Descrição"

# Gerenciamento de git hooks
x git hook
```

## O que está disponível

| Comando | Plataforma | Descrição |
|---------|------------|-----------|
| `x gh` | GitHub | Integração completa com o GitHub CLI |
| `x gl` | GitLab | Gerenciamento de projetos no GitLab |
| `x cb` | Codeberg | Integração com o Codeberg |
| `x git hook` | Local | Gerenciamento de git hooks |

## Este skill0 cresce

Começando pelo básico do GitHub. Vamos adicionar:
- Fluxos de trabalho do GitLab
- Boas práticas de hospedagem de código
- Guias de migração de repos
- Dicas de integração com CI/CD

## Experiência completa

`x git --help` para todas as opções depois de instalar o x-cmd.

## Relacionados

- [repo](../repo/SKILL.md) — descobrir/gerenciar repos via x repo