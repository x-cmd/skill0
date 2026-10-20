---
name: tldr
description: |
  Referência de comandos com exemplos práticos do projeto tldr-pages.
  Zero barreira — use com x-cmd, curl ou qualquer cliente tldr.
  Use para "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Referência rápida de comandos com exemplos do mundo real. Melhor que man pages para "como eu uso este comando?".

## Início rápido

```bash
# Com x-cmd
x tldr git                    # Exemplos de uso do git
x tldr --lang zh python       # Documentação em chinês
x tldr --fz                   # Busca interativa

# Sem x-cmd — use curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Ou instale um cliente tldr
pip install tldr
npm install -g tldr
tldr tar
```

## O que está disponível

- `x tldr <cmd>` — Mostra exemplos de um comando
- `x tldr --lang zh <cmd>` — Em chinês
- `x tldr --fz` — Busca interativa com fzf
- `x tldr --cat <cmd>` — Exibe o markdown bruto
- `x tldr --ls` — Lista todos os comandos disponíveis
- `x tldr --update` — Atualiza o cache de páginas

## Alternativas avulsas

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Páginas brutas: github.com/tldr-pages/tldr

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões de comandos comuns
- Notas específicas de plataforma
- Integração com fluxos de trabalho de agentes

## Relacionados

- [git](../git/SKILL.md) — tldr dos subcomandos do git mais usados
- [install](../install/SKILL.md) — tldr dos subcomandos do install