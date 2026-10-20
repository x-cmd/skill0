---
name: repo
description: Convention + outillage pour l'emplacement où vivent les repos clonés par les agents et l'agencement de leurs worktrees. Repo bare par défaut à `~/.x-repo/.bare/<provider>/<owner>/<name>.git` avec des worktrees liés sous `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Découverte via `x repo ls`. Gestion des worktrees via `x repo wt`. À utiliser pour « où cloner », « git clone path », « workspace layout », « repos partagés entre agents », « worktree path ».
metadata:
  related: "git"
---

# repo

## Pourquoi

Tous les clones convergent vers `~/.x-repo/<provider>/<owner>/<name>`. Même chemin pour chaque agent, humain, CI — montable dans des conteneurs ou des sandbox agents pour partager sans re-cloner. Une racine à sauvegarder ; découvrable via `x repo ls`. La disposition reflète les chemins github de sorte que `../<sibling>` depuis n'importe quel worktree résolve vers le worktree par défaut de ce sibling — les configs et scripts qui référencent des siblings fonctionnent uniformément à travers les wts et les agents.

## Disposition des chemins

- bare : `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt par défaut : `~/.x-repo/<provider>/<owner>/<name>`
- wt nommé : `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname est n'importe quel identifiant pour ce workspace : nom d'agent/worker, nom de branche, tag, SHA court, id d'issue, chaîne libre. `/` dans wtname s'encode en `~`.

Par défaut, les repos sont bare avec des worktrees liés — le bare dans `.bare/`, un répertoire séparé des worktrees, de sorte qu'un `rm -rf` d'un wt ne puisse pas l'atteindre. Un `git clone` classique est aussi accepté (`x repo ls/which/update` le voit) mais sans la protection géométrique. Dans ce cas, soyez prudent : évitez `rm -rf`, préférez `git worktree remove`, et évitez les heuristiques de nettoyage qui visent `.git/`. Le travail de mi-tâche perdu ainsi ne peut pas être réaligné avec le repo d'origine.

## Commandes

```bash
x repo <id>                      # cd vers le wt par défaut (auto-clone si manquant)
x repo wt <id> <wtname>          # attacher à une branche existante, ou en créer depuis HEAD
x repo wt ls <id>                # lister les wts
x repo wt rm <id> <wtname>       # suppression gracieuse (utilisez ceci, pas rm -rf)
x repo update <id>               # rafraîchir le wt par défaut après changements upstream
x repo ls [--raw|--tsv]          # découvrir ce qui est cloné
x repo which <id>[@<wtname>]     # résoudre id vers chemin absolu
```

## À ne pas faire

- `rm -rf` un worktree nommé. Ça laisse des entrées obsolètes dans le registre `worktrees/` du bare. Utilisez `x repo wt rm`. Si vous devez, lancez `git -C <bare> worktree prune` ensuite.

## Related

- [doc/path-layout.md](doc/path-layout.md) — grammaire complète des chemins et nommage des worktrees
- [doc/workflow.md](doc/workflow.md) — procédure opérationnelle et principes de non-suppression de nettoyage
- [doc/design.md](doc/design.md) — pourquoi la disposition est ainsi formée
