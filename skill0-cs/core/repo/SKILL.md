---
name: repo
description: Konvence + nástroje pro to, kde žijí repozitáře naklonované agenty a jak jsou uspořádány jejich worktrees. Výchozí bare repo v `~/.x-repo/.bare/<provider>/<owner>/<name>.git` s propojenými pracovními stromy pod `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Zjistíš přes `x repo ls`. Správa worktrees přes `x repo wt`. Použij pro "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Proč

Všechny klony se sbíhají v `~/.x-repo/<provider>/<owner>/<name>`. Stejná cesta pro každého agenta, člověka, CI — připojitelná do kontejnerů nebo sandboxů agentů, aby se sdílela bez opakovaného klonování. Jediný kořen pro zálohování; zjistitelný přes `x repo ls`. Layout zrcadlí cesty githubu, takže `../<sibling>` z libovolného worktree rozliší výchozí worktree toho sourozence — konfigurace a skripty odkazující na sourozence fungují stejně napříč wt a agenty.

## Rozvržení cest

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- výchozí wt: `~/.x-repo/<provider>/<owner>/<name>`
- navržený wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname je libovolný identifikátor tohoto workspace: název agenta/workera, název větve, tag, krátký SHA, id issue, volný řetězec. `/` ve wtname se kóduje jako `~`.

Ve výchozím stavu jsou repozitáře bare s propojenými worktrees — bare v `.bare/`, v adresáři odděleném od worktrees, takže ho `rm -rf` jednoho wt nedosáhne. Také čistý `git clone` se přijímá (`x repo ls/which/update` ho vidí), ale bez geometrické ochrany. V tom případě buď opatrný: nedělej `rm -rf`, používej radši `git worktree remove` a vyhni se heuristikám úklidu, které míří na `.git/`. Práce rozpracovaná uprostřed úkolu takto ztracená už nesrovnáš s původním repozitářem.

## Příkazy

```bash
x repo <id>                      # cd do výchozího wt (automaticky naklonuje, chybí-li)
x repo wt <id> <wtname>          # připojit k existující větvi, nebo vytvořit novou z HEAD
x repo wt ls <id>                # vypsat wty
x repo wt rm <id> <wtname>       # graceful remove (použij toto, ne rm -rf)
x repo update <id>               # obnovit výchozí wt po změnách z upstreamu
x repo ls [--raw|--tsv]          # zjistit, co je naklonované
x repo which <id>[@<wtname>]     # přeložit id na absolutní cestu
```

## Nedělejte

- `rm -rf` u navrženého worktree. Zanechá zastaralé záznamy v registru `worktrees/` bare repo. Použij `x repo wt rm`. Musíš-li přesto, následně spusť `git -C <bare> worktree prune`.

## Související

- [doc/path-layout.md](doc/path-layout.md) — úplná gramatika cest a pojmenování worktrees
- [doc/workflow.md](doc/workflow.md) — operační postup a principy uklízku bez mazání
- [doc/design.md](doc/design.md) — proč má layout tuto podobu
