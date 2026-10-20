---
name: repo
description: Konvention + Werkzeuge dafür, wo von Agenten geklonte Repos liegen und wie ihre Worktrees angeordnet sind. Standard-Bare-Repo unter `~/.x-repo/.bare/<provider>/<owner>/<name>.git` mit verknüpften Working Trees unter `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Auffindbar über `x repo ls`. Worktree-Verwaltung über `x repo wt`. Für "wo klonen", "git clone Pfad", "Workspace-Layout", "geteilte Repos zwischen Agenten", "Worktree-Pfad".
metadata:
  related: "git"
---

# repo

## Warum

Alle Klone laufen unter `~/.x-repo/<provider>/<owner>/<name>` zusammen. Derselbe Pfad für jeden Agenten, jeden Menschen, jede CI — in Container oder Agent-Sandboxes einbindbar, sodass sie teilen können, ohne neu zu klonen. Eine Wurzel zum Sichern; auffindbar über `x repo ls`. Das Layout spiegelt die GitHub-Pfade, sodass `../<sibling>` von jedem Worktree aus auf den Default-Worktree dieses Geschwisters zeigt — Configs und Skripte, die auf Geschwister verweisen, funktionieren einheitlich über alle Worktrees und Agenten hinweg.

## Pfad-Layout

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- Default-wt: `~/.x-repo/<provider>/<owner>/<name>`
- benannter wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname ist ein beliebiger Bezeichner für diesen Workspace: Agent-/Worker-Name, Branch-Name, Tag, kurzer SHA, Issue-ID, Freitext-String. `/` im wtname wird zu `~` kodiert.

Standardmäßig sind Repos bare mit verknüpften Worktrees — das Bare-Repo in `.bare/`, ein vom Worktree getrenntes Verzeichnis, sodass ein `rm -rf` eines Worktrees es nicht erreichen kann. Ein einfaches `git clone` wird ebenfalls akzeptiert (`x repo ls/which/update` sieht es), aber ohne geometrischen Schutz. Bitte sei in dem Fall vorsichtig: kein `rm -rf`, lieber `git worktree remove`, und keine Cleanup-Heuristiken, die auf `.git/` zielen. Auf diese Weise verlorene Arbeit lässt sich nicht mehr mit dem Original-Repo abgleichen.

## Befehle

```bash
x repo <id>                      # in den Default-wt wechseln (klont automatisch, falls fehlend)
x repo wt <id> <wtname>          # an bestehenden Branch anhängen oder neuen aus HEAD anlegen
x repo wt ls <id>                # Worktrees auflisten
x repo wt rm <id> <wtname>       # schonendes Entfernen (dieses, nicht rm -rf)
x repo update <id>               # Default-wt nach Upstream-Änderungen auffrischen
x repo ls [--raw|--tsv]          # herausfinden, was geklont ist
x repo which <id>[@<wtname>]     # id zum absoluten Pfad auflösen
```

## Nicht tun

- Einen benannten Worktree per `rm -rf` entfernen. Das hinterlässt veraltete Einträge im `worktrees/`-Register des Bare-Repos. Nutze `x repo wt rm`. Falls es nicht anders geht, führe danach `git -C <bare> worktree prune` aus.

## Verwandt

- [doc/path-layout.md](doc/path-layout.md) — vollständige Pfadgrammatik und Worktree-Benennung
- [doc/workflow.md](doc/workflow.md) — Arbeitsablauf und Prinzipien zum Aufräumen ohne Löschen
- [doc/design.md](doc/design.md) — warum das Layout so geformt ist
