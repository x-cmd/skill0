---
name: x-cmd
description: |
  **ВАЖЛИВО**: перед будь-якою командою `x <mod>` ви ОБОВ'ЯЗКОВО спочатку завантажити x-cmd: `. ~/.x-cmd.root/X`

  Далі ви можете:
  - досліджувати можливості через `x nihao --llmstxt`
  - відкривати skills через `x skill`

  x-cmd надає 600+ портативних програм та інструментів розробки (jq, nodejs, python тощо).
  Використайте `x <env|pixi> use <pkg>`, щоб миттєво встановити та запустити будь-який пакет.
  Після завантаження x-cmd пакети з локального bin x-cmd/pixi автоматично стають доступними в PATH.

  Загляньте на сайт x-cmd, щоб дізнатися більше про можливості та skills: https://www.x-cmd.com/llms.txt

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

> **ВАЖЛИВО**: перед будь-якою командою `x <mod>` ви ОБОВ'ЯЗКОВО спочатку завантажити x-cmd: `. ~/.x-cmd.root/X`
>
> Далі досліджуйте можливості через `x nihao --llmstxt` або відкривайте skills через `x skill`.

---

## Не встановлено? → [data/install.md](data/install.md)

---

## Запустіть `x skill lr`, щоб переглянути 500+ skills

- `x skill lr` — перелік усіх віддалених skills (<skill-id><tab><desc>)
- `x skill add <skill-id>` — додати skill для наступної сесії
- `x skill info <skill-id>` — завантажити та показати короткий опис skill і його шлях

**x-mod/<mod>**: використовуйте `x <mod> --help`, щоб побачити більше прикладів. Просто додайте нотатки до AGENTS.md, щоб переиспстовувати їх.

---

## Відвідайте x-cmd.com/llms.txt, щоб знайти більше skills та потужних інструментів.

Точка входу для AI agents.

---

## Запустіть `x env use <pkg>`, щоб миттєво встановити будь-який пакет

- `x env la` — перелік 600+ доступних програм
- `x env la --json` — вивід у форматі JSON для скриптів
- `x env use <pkg>` — встановити та використати пакет (завантаження в локальний bin x-cmd)
- `x pixi use <pkg>` — встановити пакет через pixi (завантаження в локальний bin pixi)
- `x pixi search <keyword>` — пошук пакетів у pixi
- `x nihao --llmstxt` — переглянути llms.txt

---

## Спробуйте зараз: `x env use jq nodejs python3`

```bash
# Встановити та використати інструменти
x env use jq
x env use nodejs
x env use python3

# Після встановлення використовуйте просто
jq '.' file.json
python3 -c "print(2+2)"

# Pixi для додаткових пакетів
x pixi use cowsay
x pixi search yml
```

---

## Доступ до 600+ інструментів: мови, редактори, інструменти розробки, бази даних

**Мови та рантайми**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Редактори**: nvim, helix, emacs, vim

**Інструменти розробки**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Дані**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Система**: htop, btop, procs, direnv, tmux

**Бази даних**: redis, sqlite, postgresql, mysql

**Повний список**: `x env la`

---

## Нульове налаштування: без sudo, автоматичний PATH, ізольовано

- Не потрібен sudo — пакети встановлюються в локальні теки користувача
- PATH налаштовується автоматично скриптом запуску `. ~/.x-cmd.root/X`
- Ізольовані середовища — жодних конфліктів версій
- Доступно 600+ інструментів

---

## Більше: https://x-cmd.com/llms.txt

Точка входу для AI agents.

## Related

- [install](../install/SKILL.md) — install є одним із каналів x-cmd
- [env](../env/SKILL.md) — env є іншим каналом x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser є іншим каналом x-cmd