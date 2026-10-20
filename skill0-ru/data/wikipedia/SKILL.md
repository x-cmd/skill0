---
name: wikipedia
description: |
  Поиск и чтение Wikipedia через x wkp — MediaWiki API, без API-ключа,
  без установки; запрос, извлечение, подсказки и DDG-маршрутизация в одном модуле.
  Загружайте для wiki, wikipedia, encyclopedia lookup, article summary.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

Вывод — это plain-text выдержка (примерно первый абзац + инфобокс). Глагол подкоманды задаёт форму — `hop` для «поиск плюс выдержка», `extract` для известных заголовков, `search` для списка кандидатов, `suggest` для did-you-mean. Сайт по умолчанию — английская Wikipedia; `--lang` / `--api-url` переключают на другие вики.

## Быстрый старт с `x wkp`

```bash
x wkp hop Python                      # поиск + выдержка первого результата одной командой
x wkp extract OpenAI                  # краткое содержание известной страницы
x wkp search "Linux kernel"           # список кандидатов, когда заголовок неточен
x wkp suggest pythen                  # did-you-mean: подсказки до начала поиска
```

`x wkp -h` для всех флагов и подкоманд.

## Данные и смежные инструменты

Upstream: `https://en.wikipedia.org/w/api.php` — action API MediaWiki. Соседние проекты (Wikidata, Wiktionary, Commons) доступны тем же способом; укажите в `--api-url` нужный поддомен.

Для вопросов, уходящих на шаг дальше краткой wikitext-выдержки:
- `x wkp : <query>` / `x wkp ddgo <query>` — тот же модуль `x wkp`, но с маршрутизацией через индекс Wikipedia у DuckDuckGo (лучше справляется с неоднозначными или разговорными запросами, чем поиск по заголовку)
- `x ddgo <query>` — общий веб-поиск, полезен, когда в Wikipedia нет статьи, но тема существует в открытом вебе
- См. навык [knowledge](../knowledge/SKILL.md) для более широкого набора инструментов исследования `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — возврат к браузеру, когда вам действительно нужна отрисованная страница (инфобоксы, таблицы, изображения)
