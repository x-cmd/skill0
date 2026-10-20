---
name: repo
description: Convención + herramientas sobre dónde viven los repos clonados por el agente y cómo se organizan sus worktrees. Repos bare por defecto en `~/.x-repo/.bare/<provider>/<owner>/<name>.git` con árboles de trabajo enlazados bajo `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Se descubren con `x repo ls`. Gestión de worktrees vía `x repo wt`. Úsalo para "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Por qué

Todos los clones convergen en `~/.x-repo/<provider>/<owner>/<name>`. La misma ruta para cualquier agente, persona o CI — montable en contenedores o sandboxes de agente para que compartan sin volver a clonar. Una sola raíz que respaldar; descubrible con `x repo ls`. La disposición replica las rutas de github, así que `../<hermano>` desde cualquier worktree resuelve al worktree por defecto de ese hermano — las configs y scripts que referencian hermanos funcionan igual en todos los wts y agentes.

## Disposición de rutas

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt por defecto: `~/.x-repo/<provider>/<owner>/<name>`
- wt diseñado: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname es cualquier identificador de este espacio de trabajo: nombre de agente/trabajador, nombre de rama, tag, SHA corto, id de incidencia, cadena libre. El `/` en wtname se codifica como `~`.

Por defecto, los repos son bare con worktrees enlazados — el bare en `.bare/`, en un directorio separado de los worktrees, para que un `rm -rf` de un wt no pueda alcanzarlo. También se acepta un `git clone` normal (`x repo ls/which/update` lo ven) pero sin protección geométrica. Ten cuidado en ese caso: no uses `rm -rf`, prefiere `git worktree remove`, y evita heurísticas de limpieza que apunten a `.git/`. El trabajo a medias que se pierda así no se puede realinear con el repo original.

## Comandos

```bash
x repo <id>                      # cd al wt por defecto (clona si falta)
x repo wt <id> <wtname>          # engancharse a una rama existente, o crear nueva desde HEAD
x repo wt ls <id>                # listar wts
x repo wt rm <id> <wtname>       # borrado ordenado (usa esto, no rm -rf)
x repo update <id>               # refrescar el wt por defecto tras cambios upstream
x repo ls [--raw|--tsv]          # descubrir qué está clonado
x repo which <id>[@<wtname>]     # resolver id a ruta absoluta
```

## No hagas

- `rm -rf` de un worktree diseñado. Deja entradas obsoletas en el registro `worktrees/` del bare. Usa `x repo wt rm`. Si es imprescindible, ejecuta `git -C <bare> worktree prune` después.

## Relacionadas

- [doc/path-layout.md](doc/path-layout.md) — gramática completa de rutas y nomenclatura de worktrees
- [doc/workflow.md](doc/workflow.md) — procedimiento operativo y principios de limpieza sin borrado
- [doc/design.md](doc/design.md) — por qué la disposición tiene esta forma
