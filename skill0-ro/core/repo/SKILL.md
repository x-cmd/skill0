---
name: repo
description: Convenție + tooling pentru unde stau repo-urile clonate de agenți și cum sunt aranjate worktree-urile lor. Repo bare implicit la `~/.x-repo/.bare/<provider>/<owner>/<name>.git` cu working tree-uri legate sub `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Descoperite via `x repo ls`. Managementul worktree-urilor via `x repo wt`. Folosește pentru "unde clonez", "git clone path", "layout workspace", "repo-uri partajate între agenți", "worktree path".
metadata:
  related: "git"
---

# repo

## De ce

Toate clonările converg la `~/.x-repo/<provider>/<owner>/<name>`. Aceeași cale pentru orice agent, om, CI — montabilă în containere sau sandbox-uri de agenți, ca să împărțească fără reclonare. O singură rădăcină de backup; descoperibilă prin `x repo ls`. Layout-ul oglindește căile github, astfel încât `../<sibling>` din orice worktree rezolvă către worktree-ul implicit al acelui sibling — configurațiile și scripturile care fac referire la siblings funcționează uniform peste toate wt-urile și agenții.

## Layout-ul căilor

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- wt implicit: `~/.x-repo/<provider>/<owner>/<name>`
- wt proiectat: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname e orice identificator pentru acest workspace: nume de agent/worker, nume de branch, tag, SHA scurt, id de issue, string liber. `/` din wtname se codifică în `~`.

Implicit, repo-urile sunt bare cu worktree-uri legate — bare-ul în `.bare/`, un director separat de worktree-uri, ca un `rm -rf` pe un wt să nu ajungă la el. Și `git clone` obișnuit e acceptat (`x repo ls/which/update` îl vede) dar fără protecție geometrică. Te rugăm să fii atent în cazul acesta: nu `rm -rf`, preferă `git worktree remove` și evită euristicile de curățare care țintește `.git/`. Munca de la mijlocul taskului pierdută astfel nu mai poate fi realiniată cu repo-ul original.

## Commands

```bash
x repo <id>                      # cd to default wt (auto-clones if missing)
x repo wt <id> <wtname>          # attach to existing branch, or create new from HEAD
x repo wt ls <id>                # list wts
x repo wt rm <id> <wtname>       # graceful remove (use this, not rm -rf)
x repo update <id>               # refresh default wt after upstream changes
x repo ls [--raw|--tsv]          # discover what's cloned
x repo which <id>[@<wtname>]     # resolve id to absolute path
```

## Nu

- `rm -rf` pe un worktree proiectat. Lăsă intrări stale în registrul `worktrees/` al bare-ului. Folosește `x repo wt rm`. Dacă e obligatoriu, rulează `git -C <bare> worktree prune` după.

## Related

- [doc/path-layout.md](doc/path-layout.md) — gramatică completă a căilor și denumirea worktree-urilor
- [doc/workflow.md](doc/workflow.md) — procedura de operare și principiile curățării fără ștergere
- [doc/design.md](doc/design.md) — de ce layout-ul are forma asta