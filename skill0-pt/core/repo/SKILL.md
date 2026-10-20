---
name: repo
description: Convenção + ferramentas para onde ficam os repos clonados por agentes e como seus worktrees são organizados. Repo bare padrão em `~/.x-repo/.bare/<provider>/<owner>/<name>.git` com árvores de trabalho linkadas em `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Descoberto via `x repo ls`. Gerenciamento de worktree via `x repo wt`. Use para "onde clonar", "caminho do git clone", "layout do workspace", "repos compartilhados entre agentes", "caminho de worktree".
metadata:
  related: "git"
---

# repo

## Por quê

Todos os clones convergem em `~/.x-repo/<provider>/<owner>/<name>`. O mesmo caminho para todo agente, pessoa, CI — pode ser montado em containers ou sandboxes de agente para que compartilhem sem reclonar. Uma única raiz para fazer backup; descobrível via `x repo ls`. O layout espelha os caminhos do github, então `../<irmão>` a partir de qualquer worktree resolve para o worktree padrão desse irmão — configs e scripts que referenciam irmãos funcionam de forma uniforme entre wts e agentes.

## Layout de caminhos

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt padrão: `~/.x-repo/<provider>/<owner>/<name>`
- wt projetado: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname é qualquer identificador deste workspace: nome do agente/worker, nome de branch, tag, SHA curto, id de issue, string livre. `/` no wtname é codificado como `~`.

Por padrão os repos são bare com worktrees linkados — o bare fica em `.bare/`, um diretório separado dos worktrees, então um `rm -rf` em um wt não o alcança. Um `git clone` puro também é aceito (`x repo ls/which/update` o enxerga) mas sem a proteção geométrica. Nesse caso, tenha cuidado: não use `rm -rf`, prefira `git worktree remove` e evite heurísticas de limpeza que miram `.git/`. Trabalho em andamento perdido assim não pode ser realinhado ao repo original.

## Comandos

```bash
x repo <id>                      # cd para o wt padrão (clona sozinho se faltar)
x repo wt <id> <wtname>          # anexar a uma branch existente, ou criar nova a partir do HEAD
x repo wt ls <id>                # listar wts
x repo wt rm <id> <wtname>       # remoção graciosa (use esta, não rm -rf)
x repo update <id>               # atualizar o wt padrão após mudanças no upstream
x repo ls [--raw|--tsv]          # descobrir o que está clonado
x repo which <id>[@<wtname>]     # resolver o id para um caminho absoluto
```

## Não faça

- `rm -rf` em um worktree projetado. Isso deixa entradas obsoletas no registro `worktrees/` do bare. Use `x repo wt rm`. Se for inevitável, rode `git -C <bare> worktree prune` depois.

## Relacionados

- [doc/path-layout.md](doc/path-layout.md) — gramática completa de caminhos e nomenclatura de worktree
- [doc/workflow.md](doc/workflow.md) — procedimento operacional e princípios de limpeza-sem-exclusão
- [doc/design.md](doc/design.md) — por que o layout tem essa forma