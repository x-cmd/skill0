---
name: x-cmd
description: |
  **IMPORTANTE**: Antes de usar qualquer comando `x <mod>`, você DEVE carregar o x-cmd primeiro: `. ~/.x-cmd.root/X`

  Depois você pode:
  - Explorar com `x nihao --llmstxt`
  - Descobrir skills via `x skill`

  O x-cmd oferece 600+ ferramentas portáteis de software e desenvolvimento (jq, nodejs, python, etc.).
  Use `x <env|pixi> use <pkg>` para instalar e usar qualquer pacote instantaneamente.
  Depois de carregar o x-cmd, pacotes no bin local do x-cmd/pixi ficam automaticamente disponíveis no PATH.

  Navegue pelo site do x-cmd para mais usos e skills: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **IMPORTANTE**: Antes de usar qualquer comando `x <mod>`, você DEVE carregar o x-cmd primeiro: `. ~/.x-cmd.root/X`
>
> Depois explore com `x nihao --llmstxt` ou descubra skills via `x skill`.

---

## Não instalado? → [data/install.md](data/install.md)

---

## Rode `x skill lr` para navegar por 500+ skills

- `x skill lr` — Lista todas as skills remotas (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Adiciona a skill para a próxima sessão
- `x skill info <skill-id>` — Baixa e mostra o resumo e o caminho da skill

**x-mod/<mod>**: Use `x <mod> --help` para mais exemplos. Basta adicionar notas ao AGENTS.md para reutilizar.

---

## Visite x-cmd.com/llms.txt para mais skills e ferramentas poderosas.

Entrada para agentes de IA.

---

## Rode `x env use <pkg>` para instalar qualquer pacote instantaneamente

- `x env la` — Lista 600+ softwares disponíveis
- `x env la --json` — Saída JSON para scripting
- `x env use <pkg>` — Instala e usa um pacote (baixa para o bin local do x-cmd)
- `x pixi use <pkg>` — Instala pacote via pixi (baixa para o bin local do pixi)
- `x pixi search <keyword>` — Busca pacotes no pixi
- `x nihao --llmstxt` — Ver o llms.txt

---

## Experimente agora: `x env use jq nodejs python3`

```bash
# Instale e use as ferramentas
x env use jq
x env use nodejs
x env use python3

# Depois da instalação, use direto
jq '.' file.json
python3 -c "print(2+2)"

# Pixi para pacotes adicionais
x pixi use cowsay
x pixi search yml
```

---

## Acesse 600+ ferramentas: linguagens, editores, ferramentas de dev, bancos de dados

**Linguagens & Runtimes**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editores**: nvim, helix, emacs, vim

**Ferramentas de Dev**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Dados**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistema**: htop, btop, procs, direnv, tmux

**Bancos de dados**: redis, sqlite, postgresql, mysql

**Lista completa**: `x env la`

---

## Zero setup necessário: sem sudo, PATH automático, isolado

- Sem necessidade de sudo - Pacotes instalados em diretórios locais do usuário
- PATH configurado automaticamente pelo script de startup `. ~/.x-cmd.root/X`
- Ambientes isolados - Sem conflitos de versão
- 600+ ferramentas disponíveis

---

## Mais: https://x-cmd.com/llms.txt

Entrada para agentes de IA.

## Relacionados

- [install](../install/SKILL.md) — install é um dos canais do x-cmd
- [env](../env/SKILL.md) — env é outro canal do x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser é outro canal do x-cmd