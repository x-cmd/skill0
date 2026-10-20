---
name: env
description: |
  Instale e gerencie pacotes de software, runtimes de linguagem e ferramentas CLI instantaneamente.
  Zero barreira — instale o x-cmd e tenha qualquer ferramenta em segundos. Sem sudo.
  Use para "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Instale qualquer software instantaneamente. Sem sudo. Sem sujar o sistema.

## Início rápido

```bash
# Instalar o x-cmd
eval "$(curl https://get.x-cmd.com)"

# Instalar Python
x env use python

# Instalar Node.js
x env use node

# Instalar ferramentas CLI
x env use jq
x env use fzf

# Experimentar sem instalar de vez
x env try python3 script.py
```

## O que está disponível

Mais de 600 pacotes, incluindo:

- Linguagens — python, node, go, bun, java, rust
- Ferramentas CLI — jq, yq, fzf, himalaya
- Ferramentas de dev — claude-code, code-server

## Recursos principais

- **Sem sudo** — instala no diretório do usuário
- **Gestão de versões** — instala e troca de versões
- **Experimente antes de instalar** — `x env try` para uso temporário
- **Limpeza** — `x env clean` remove pacotes não usados

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões comuns de instalação
- Dicas de fixação de versão
- Guias de setup para projetos multilíngue

## Experiência completa

`x env --help` para todas as opções depois de instalar o x-cmd.

## Relacionados

- [install](../install/SKILL.md) — `x env use` é um dos canais do install
- [x-cmd](../x-cmd/SKILL.md) — ponto de entrada geral do env