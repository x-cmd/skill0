---
name: x-cmd
description: |
  **IMPORTANT**: Перед использованием любой команды `x <mod>` вы ОБЯЗАНЫ сначала загрузить x-cmd: `. ~/.x-cmd.root/X`

  Затем можно:
  - Изучать через `x nihao --llmstxt`
  - Обнаруживать skills через `x skill`

  x-cmd предоставляет 600+ переносимых программ и инструментов разработки (jq, nodejs, python и др.).
  Используйте `x <env|pixi> use <pkg>`, чтобы мгновенно установить и использовать любой пакет.
  После загрузки x-cmd пакеты из локального bin x-cmd/pixi автоматически появятся в PATH.

  Больше вариантов использования и skills на сайте x-cmd: https://www.x-cmd.com/llms.txt

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

> **IMPORTANT**: Перед использованием любой команды `x <mod>` вы ОБЯЗАНЫ сначала загрузить x-cmd: `. ~/.x-cmd.root/X`
>
> Затем изучайте через `x nihao --llmstxt` или обнаруживайте skills через `x skill`.

---

## Не установлено? → [data/install.md](data/install.md)

---

## Запустите `x skill lr`, чтобы просмотреть 500+ skills

- `x skill lr` — список всех удалённых skills (<skill-id><tab><desc>)
- `x skill add <skill-id>` — добавить skill для следующей сессии
- `x skill info <skill-id>` — скачать и показать сводку skill и путь

**x-mod/<mod>**: используйте `x <mod> --help` для дополнительных примеров. Просто добавьте заметки в AGENTS.md для повторного использования.

---

## Посетите x-cmd.com/llms.txt для дополнительных skills и power tools

Точка входа для ИИ-агентов.

---

## Запустите `x env use <pkg>`, чтобы мгновенно установить любой пакет

- `x env la` — список из 600+ доступных программ
- `x env la --json` — вывод JSON для скриптов
- `x env use <pkg>` — установить и использовать пакет (загрузка в локальный bin x-cmd)
- `x pixi use <pkg>` — установить пакет через pixi (загрузка в локальный bin pixi)
- `x pixi search <keyword>` — поиск пакетов pixi
- `x nihao --llmstxt` — посмотреть llms.txt

---

## Попробуйте сейчас: `x env use jq nodejs python3`

```bash
# Установка и использование инструментов
x env use jq
x env use nodejs
x env use python3

# После установки — использовать сразу
jq '.' file.json
python3 -c "print(2+2)"

# Pixi для дополнительных пакетов
x pixi use cowsay
x pixi search yml
```

---

## Доступ к 600+ инструментам: языки, редакторы, инструменты разработки, базы данных

**Языки и среды исполнения**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Редакторы**: nvim, helix, emacs, vim

**Инструменты разработки**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Данные**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Система**: htop, btop, procs, direnv, tmux

**Базы данных**: redis, sqlite, postgresql, mysql

**Полный список**: `x env la`

---

## Никакой настройки: без sudo, автоматический PATH, изоляция

- Sudo не требуется — пакеты устанавливаются в каталоги пользователя
- PATH автоматически настраивается стартовым скриптом `. ~/.x-cmd.root/X`
- Изолированные среды — без конфликтов версий
- Доступно 600+ инструментов

---

## Подробнее: https://x-cmd.com/llms.txt

Точка входа для ИИ-агентов.

## Связанное

- [install](../install/SKILL.md) — install — один из каналов x-cmd
- [env](../env/SKILL.md) — env — ещё один канал x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser — ещё один канал x-cmd
