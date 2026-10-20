---
name: wikipedia
description: |
  Шукайте й читайте Wikipedia через x wkp — MediaWiki API, без API key,
  нульова установка; query, extract, suggest і маршрут через DDG в одному модулі.
  Завантажувати для wiki, wikipedia, encyclopedia lookup, article summary.

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

Результат — це витяг звичайним текстом (близько перший абзац + інфобокс). Дієслово в назві підкоманди визначає форму відповіді: `hop` — пошук і підсумок за один раз, `extract` — для відомих заголовків, `search` — для кандидатів, `suggest` — для did-you-mean. Сайт за замовчуванням — англомовна Wikipedia; `--lang` / `--api-url` перемикають на інші wiki.

## Швидкий старт з `x wkp`

```bash
x wkp hop Python                      # пошук + витяг першого результату за один раз
x wkp extract OpenAI                  # підсумок відомої сторінки
x wkp search "Linux kernel"           # список кандидатів, коли заголовок непевний
x wkp suggest pythen                  # did-you-mean: підказки з виправлення перед пошуком
```

`x wkp -h` — усі flag та підкоманди.

## Дані та сусідні інструменти

Upstream: `https://en.wikipedia.org/w/api.php` — action API MediaWiki. Сестрині проєкти (Wikidata, Wiktionary, Commons) доступні так само; достатньо вказати `--api-url` на потрібний піддомен.

Для питань, які заходять за межі підсумку у wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — той самий модуль `x wkp`, але запит іде через індекс Wikipedia у DuckDuckGo (краще справляється з неоднозначними чи розмовними запитами, ніж пошук за заголовком)
- `x ddgo <query>` — загальний веб-пошук, корисний, коли у Wikipedia немає статті, але тема є у відкритому вебі
- ширший дослідницький набір `x hn` / `x rfc` / `x se` дивіться в skill [knowledge](../knowledge/SKILL.md)
- `x wkp open <page>` — перехід у браузер, коли вам справді потрібна відрендерена сторінка (інфобокси, таблиці, зображення)