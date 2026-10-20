---
name: meme
description: |
  Генерация мемов путём наложения текста на шаблоны.
  Нулевой порог входа — работает на Python + Pillow, никакого фреймворка не нужно.
  Шаблоны загружаются по запросу из репозитория данных awesome-meme.
  Используйте для «meme», «meme generator», «text overlay», «distracted boyfriend», «image macro».

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Создание мемов. Более 30 шаблонов. Нулевой порог входа.

AI-агент, прочитав этот файл, знает, как делать мемы. x-cmd не требуется.

## Быстрый старт

```bash
# Установить зависимости
pip install pillow pyyaml

# Сгенерировать мем (шаблон автоматически скачивается из GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Дополнительные примеры

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Параметры

| Опция | Значения | По умолчанию | Описание |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Бэкенд рендеринга |
| `--layout` | chest-label, above-head, bottom-label | (spec default) | Пресет расположения текста |
| `--output` | file path | meme_output.jpg | Путь к выходному файлу |

## Выбор шрифта

- Английский / Latin — Impact (по умолчанию)
- Китайский / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Смешанный — каждый слот определяется независимо

В Impact нет CJK-глифов — китайский текст будет невидимым. Рендерер автоматически определяет CJK и переключается на системные шрифты. На Linux: `apt install fonts-noto-cjk`.

## Чистый Shell (без Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Обновление через x-cmd

Если у вас установлен x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Тот же результат, более чистая интеграция с экосистемой x-cmd.

## Источник данных

Шаблоны живут в [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Рендерер загружает спецификации и изображения из GitHub по запросу.

## Документация

- [references/INSTALL.md](references/INSTALL.md) — Зависимости (Pillow, ImageMagick, шрифты)
- [references/PILLOW.md](references/PILLOW.md) — Подробности о бэкенде Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Подробности о бэкенде ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Руководство по использованию AI-агентом

## Связанные материалы

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser умеет рендерить/выводить мемы
