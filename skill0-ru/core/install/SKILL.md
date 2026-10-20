---
name: install
description: |
  Установка ПО любым доступным системе способом. Рекомендует `x install` — единый вход, который
  перечисляет все способы и выбирает лучший; плюс каналы `x eget`/`x env use`/`x pixi` и системные
  пакетные менеджеры с переключением зеркал. Все каналы x-cmd ставят в $HOME — без sudo, без мусора.
  Используй для "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Установка ПО любым доступным системе способом. **Все каналы x-cmd (`x eget`, `x env use`, `x pixi`) ставят в `$HOME` — без sudo, без засорения системы.** Только системные пакетные менеджеры (`x apt`, `x brew`, …) трогают ОС и могут потребовать sudo.

## Выбери канал

- `x install` — **Рекомендуется.** Единый вход — перечисляет все способы для инструмента, выбирает лучший
- `x eget` — свежие бинарники напрямую из upstream-репозиториев (релизы GitHub / Codeberg)
- `x env use` — рантаймы и инструменты, хостимые x-cmd (обёртка над `x pkg use`)
- `x pixi` — пакеты conda / экосистемы pixi
- `x apt/brew/dnf/pacman` — системные пакетные менеджеры (могут потребовать sudo)

## Предварительные требования

x-cmd даёт все перечисленные выше каналы:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — рекомендуемый единый вход

У каждого инструмента несколько путей установки; `x install` сам выбирает лучший. Все формы ниже неинтерактивны (безопасно для агента и CI):
```bash
x install bun                            # установить — сам выберет лучший способ
x install --printinfo ripgrep            # сначала перечислить все способы установки (только чтение)
x install --withtool brew jq             # задать менеджер принудительно; или префиксная форма: brew/jq
x install --sys bun                      # только системный пакетный менеджер
x install --printcmd bun vim             # показать команду, не выполнять
x install --env                          # определить платформу / архитектуру / дистрибутив
x install --available-tool --installed   # какие пакетные менеджеры тут есть
```

### Узнай, что доступно для установки

`x install --ls` выдаёт TSV со всеми проиндексированными инструментами — грепай / обрабатывай awk офлайн:
```bash
x install --ls --tsv | head -1                  # заголовок
x install --ls --tsv | grep -i json             # поиск по ключевому слову
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # фильтр по языку
x install --search http                         # агрегированный поиск по реестрам
```
Колонки TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Смени зеркало (быстрее загрузка)

Перенаправь медленный системный пакетный менеджер на более быстрое / локальное зеркало. У каждого есть `mirror ls` (список вариантов) и `mirror set <code>` (применить, неинтерактивно):
```bash
x brew mirror ls          # список: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # применить зеркало Tsinghua
x apt mirror set tuna     # та же форма на Debian / Ubuntu (также dnf, pacman)
```
Требуется, чтобы целевой пакетный менеджер был установлен.

## Подробнее

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Связанное

- [x-cmd](../x-cmd/SKILL.md) — umbrella-запись, перед которой стоит install
- [agent-browser](../../it/agent-browser/SKILL.md) — install перенаправляет на agent-browser, когда бинарника нет
- [env](../env/SKILL.md) — install и env разделяют архитектуру x-каналов