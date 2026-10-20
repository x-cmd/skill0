---
name: knowledge
description: |
  Поиск в Hacker News, Wikipedia, DuckDuckGo, RFC-документах и Stack Exchange из командной строки.
  Нулевой порог входа — установите x-cmd и начинайте искать.
  Используйте для «search», «hn», «hacker news», «wikipedia», «ddgo», «duckduckgo», «rfc», «stack overflow».

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Ищите в интернет-источниках знаний прямо из командной строки.

## Быстрый старт

```bash
# Установить x-cmd
eval "$(curl https://get.x-cmd.com)"

# Топ-посты Hacker News
x hn top

# Поиск в Wikipedia
x wkp "artificial intelligence"

# Поиск в DuckDuckGo
x ddgo "rust programming language"

# Документы RFC
x rfc 2616

# Поиск по Stack Exchange
x se "how to exit vim"
```

## Что доступно

| Команда | Источник | Пример |
|---------|----------|--------|
| `x hn top` | Hacker News | Топ-10 трендовых постов |
| `x hn new` | Hacker News | Последние публикации |
| `x wkp <query>` | Wikipedia | Поиск статей |
| `x ddgo <query>` | DuckDuckGo | Веб-поиск |
| `x rfc <number>` | Документы RFC | Чтение спецификаций RFC |
| `x se <query>` | Stack Exchange | Поиск вопросов и ответов |

## Этот skill0 растёт

Начинаем с самого необходимого. Будет добавлено:
- Новые источники (Project Gutenberg, arxiv)
- Продвинутые шаблоны поиска
- Советы по фильтрации и форматированию результатов

## Полный опыт

`x knowledge --help` для всех опций после установки x-cmd.

## Связанное
