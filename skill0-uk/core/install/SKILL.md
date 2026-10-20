---
name: install
description: |
  Встановлення ПЗ будь-яким способом, який дозволяє система. Рекомендуємо `x install` — єдиний вхід,
  який перелічує всі методи й обирає найкращий; окрім того канали `x eget`/`x env use`/`x pixi`
  та системні пакетні менеджери з перемиканням дзеркал. Усі канали x-cmd встановлюють у $HOME —
  без sudo, без засмічення системи.
  Використовувати для "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Встановлюйте ПЗ будь-яким способом, який дозволяє система. **Усі канали x-cmd (`x eget`, `x env use`, `x pixi`) встановлюють у `$HOME` — без sudo, без засмічення системи.** Тільки системні пакетні менеджери (`x apt`, `x brew`, …) зачіпають ОС і можуть потребувати sudo.

## Оберіть канал

- `x install` — **Рекомендовано.** Єдиний вхід — перелічує всі методи для інструмента й обирає найкращий
- `x eget` — найновіші бінарники прямо з upstream-репозиторіїв (релізи GitHub / Codeberg)
- `x env use` — рантайми та інструменти, які хостить x-cmd (обгортка над `x pkg use`)
- `x pixi` — пакети conda / екосистеми pixi
- `x apt/brew/dnf/pacman` — системні пакетні менеджери (можуть потребувати sudo)

## Передумови

x-cmd надає всі перелічені вище канали:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — рекомендований єдиний вхід

Кожен інструмент має кілька шляхів встановлення; `x install` сам обирає найкращий. Усі наведені нижче форми є неінтерактивними (безпечні для агента / CI):
```bash
x install bun                            # встановити — автоматично обирає найкращий метод
x install --printinfo ripgrep            # спершу перелічити всі методи встановлення (лише читання)
x install --withtool brew jq             # задати менеджер примусово; або форма з префіксом: brew/jq
x install --sys bun                      # лише системний пакетний менеджер
x install --printcmd bun vim             # показати команду, не виконувати
x install --env                          # визначити платформу / архітектуру / дистрибутив
x install --available-tool --installed   # які пакетні менеджери є тут
```

### Дізнайтеся, що можна встановити

`x install --ls` видає TSV з кожним інструментом з індексу — обробляйте офлайн через grep / awk:
```bash
x install --ls --tsv | head -1                  # заголовок
x install --ls --tsv | grep -i json             # пошук за ключовим словом
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # фільтр за мовою
x install --search http                         # агрегований пошук по реєстрах
```
Колонки TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Зміна дзеркал (швидше завантаження)

Перенаправте повільний системний пакетний менеджер на швидше / локальне дзеркало. У кожного є `mirror ls` (перелік варіантів) і `mirror set <code>` (застосувати, неінтерактивно):
```bash
x brew mirror ls          # перелік: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # застосувати дзеркало Tsinghua
x apt mirror set tuna     # те саме на Debian / Ubuntu (також dnf, pacman)
```
Потрібно, щоб цільовий пакетний менеджер був встановлений.

## Більше

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — umbrella-вхід, який стоїть перед install
- [agent-browser](../../it/agent-browser/SKILL.md) — install перенаправляє до agent-browser, коли немає бінарника
- [env](../env/SKILL.md) — install і env мають спільну архітектуру x-каналів