---
name: repo
description: Convenzione + strumenti per dove vivono i repo clonati dagli agenti e come sono organizzati i loro worktree. Repo bare predefinito in `~/.x-repo/.bare/<provider>/<owner>/<name>.git` con working tree collegati sotto `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Si scoprono con `x repo ls`. Gestione dei worktree con `x repo wt`. Usala per "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Perché

Tutti i clone convergono su `~/.x-repo/<provider>/<owner>/<name>`. Lo stesso percorso per ogni agente, umano, CI — montabile in container o sandbox di agenti, così lo condividono senza dover riclonare. Una sola radice da mettere in backup; scopribile con `x repo ls`. Il layout rispecchia i percorsi di github, così `../<sibling>` da qualsiasi worktree punta al worktree predefinito di quel sibling — configurazioni e script che referenziano i sibling funzionano allo stesso modo su tutti i wt e gli agenti.

## Layout dei percorsi

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt predefinito: `~/.x-repo/<provider>/<owner>/<name>`
- wt con nome: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname è un identificatore qualsiasi di questo workspace: nome dell'agente/worker, nome del branch, tag, SHA abbreviato, issue id, stringa libera. Il carattere `/` nel wtname viene codificato come `~`.

Per impostazione predefinita i repo sono bare con working tree collegati — il bare sta in `.bare/`, in una directory separata dai worktree, così un `rm -rf` su un wt non può raggiungerlo. Anche un `git clone` normale è accettato (`x repo ls/which/update` lo vedono) ma senza la protezione geometrica. In quel caso fai attenzione: niente `rm -rf`, preferisci `git worktree remove` ed evita le euristiche di pulizia che puntano a `.git/`. Un lavoro perso a metà task in questo modo non può più essere riallineato al repo originale.

## Comandi

```bash
x repo <id>                      # cd al wt predefinito (clona automaticamente se manca)
x repo wt <id> <wtname>          # aggancia a un branch esistente, o ne crea uno nuovo da HEAD
x repo wt ls <id>                # elenca i wt
x repo wt rm <id> <wtname>       # rimozione pulita (usa questo, non rm -rf)
x repo update <id>               # aggiorna il wt predefinito dopo i cambi upstream
x repo ls [--raw|--tsv]          # scopri cosa è stato clonato
x repo which <id>[@<wtname>]     # risolve l'id in un percorso assoluto
```

## Non fare

- Non fare `rm -rf` su un worktree con nome. Lascia voci obsolete nel registro `worktrees/` del bare. Usa `x repo wt rm`. Se proprio devi, esegui dopo `git -C <bare> worktree prune`.

## Related

- [doc/path-layout.md](doc/path-layout.md) — grammatica completa dei percorsi e naming dei worktree
- [doc/workflow.md](doc/workflow.md) — procedura operativa e principi di "pulire senza cancellare"
- [doc/design.md](doc/design.md) — perché il layout è fatto così