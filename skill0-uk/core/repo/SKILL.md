---
name: repo
description: Convention + tooling for where agent-cloned repos live and how their worktrees are arranged. Default bare repo at `~/.x-repo/.bare/<provider>/<owner>/<name>.git` with linked working trees under `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Discovered via `x repo ls`. Worktree management via `x repo wt`. Use for "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Чому

Усі клони сходяться до `~/.x-repo/<provider>/<owner>/<name>`. Той самий шлях для кожного агента, людини, CI — його можна монтувати в контейнери або пісочниці агентів, щоб вони спільно користувалися репозиторієм без повторного клонування. Один корінь для резервної копії; виявляється через `x repo ls`. Структура дублює шляхи github, тому `../<sibling>` з будь-якого worktree веде до worktree-а за замовчуванням цього sibling-а — конфіги та скрипти, які посилаються на sibling-ів, працюють однаково для всіх wt і агентів.

## Структура шляхів

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- default wt: `~/.x-repo/<provider>/<owner>/<name>`
- designed wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname є будь-яким ідентифікатором цього workspace: назвою агента/воркера, назвою гілки, тегом, коротким SHA, issue id, довільним рядком. `/` у wtname кодується як `~`.

За замовчуванням репозиторії є bare з приєднаними worktree — bare лежить у `.bare/`, в окремому каталозі від worktree, тому `rm -rf` одного wt не може його дістати. Звичайний `git clone` також приймається (його бачать `x repo ls/which/update`), але без геометричного захисту. У такому разі будьте обережні: не використовуйте `rm -rf`, надайте перевагу `git worktree remove` і уникайте евристик прибирання, що цілять у `.git/`. Роботу, втрачену посеред задачі таким чином, уже неможливо зіставити з оригінальним репозиторієм.

## Команди

```bash
x repo <id>                      # cd to default wt (auto-clones if missing)
x repo wt <id> <wtname>          # attach to existing branch, or create new from HEAD
x repo wt ls <id>                # list wts
x repo wt rm <id> <wtname>       # graceful remove (use this, not rm -rf)
x repo update <id>               # refresh default wt after upstream changes
x repo ls [--raw|--tsv]          # discover what's cloned
x repo which <id>[@<wtname>]     # resolve id to absolute path
```

## Не робіть

- Не робіть `rm -rf` на designed worktree. Це залишає застарілі записи в реєстрі `worktrees/` bare-репозиторію. Скористайтеся `x repo wt rm`. Якщо все ж доводиться, після цього виконайте `git -C <bare> worktree prune`.

## Пов'язане

- [doc/path-layout.md](doc/path-layout.md) — повна граматика шляхів і найменування worktree
- [doc/workflow.md](doc/workflow.md) — порядок роботи та принципи «прибирання без видалення»
- [doc/design.md](doc/design.md) — чому структура має саме такий вигляд