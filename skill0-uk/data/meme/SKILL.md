---
name: meme
description: |
  Створюйте мем-п зображення, накладаючи текст на шаблони.
  Нульовий поріг — працює на Python + Pillow, фреймворк не потрібен.
  Шаблони завантажуються на вимогу з репозиторію даних awesome-meme.
  Використовувати для "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Створюйте мем-зображення. Понад 30 шаблонів. Нульовий поріг.

AI-агент читає цей файл і знає, як робити меми. x-cmd не потрібен.

## Швидкий старт

```bash
# Встановити залежності
pip install pillow pyyaml

# Згенерувати мем (шаблон автоматично завантажується з GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Більше прикладів

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Опції

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Бекенд рендерингу |
| `--layout` | chest-label, above-head, bottom-label | (за замовчуванням у spec) | Пресет розміщення тексту |
| `--output` | шлях до файлу | meme_output.jpg | Шлях до вихідного файлу |

## Вибір шрифту

- англійська / латиниця — Impact (за замовчуванням)
- китайська / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- змішаний — кожен слот визначається окремо автоматично

Impact не має CJK-гліфів — китайський текст буде невидимим. Рендерер автоматично визначає CJK і переходить на системні шрифти. На Linux: `apt install fonts-noto-cjk`.

## Чистий Shell (без Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Просування з x-cmd

Якщо у вас вже встановлено x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Той самий результат, але чистіша інтеграція з екосистемою x-cmd.

## Джерело даних

Шаблони живуть в [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Рендерер завантажує spec і зображення з GitHub на вимогу.

## Документація

- [references/INSTALL.md](references/INSTALL.md) — залежності (Pillow, ImageMagick, шрифти)
- [references/PILLOW.md](references/PILLOW.md) — подробиці бекенду Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — подробиці бекенду ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — настанови з використання для AI-агентів

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser уміє рендерити та виводити мем-зображення