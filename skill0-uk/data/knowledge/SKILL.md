---
name: knowledge
description: |
  Шукайте Hacker News, Wikipedia, DuckDuckGo, документи RFC та Stack Exchange з командного рядка.
  Нульовий поріг — установіть x-cmd і починайте шукати.
  Використовувати для "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Шукайте в інтернет-knowledge джерелах прямо з командного рядка.

## Швидкий старт

```bash
# Установити x-cmd
eval "$(curl https://get.x-cmd.com)"

# Популярні дописи Hacker News
x hn top

# Пошук у Wikipedia
x wkp "artificial intelligence"

# Пошук у DuckDuckGo
x ddgo "rust programming language"

# Документи RFC
x rfc 2616

# Пошук у Stack Exchange
x se "how to exit vim"
```

## Що доступно

| Command | Source | Example |
|---------|--------|---------|
| `x hn top` | Hacker News | Топ-10 дописів, що в тренді |
| `x hn new` | Hacker News | Найновіші надсилання |
| `x wkp <query>` | Wikipedia | Пошук статей |
| `x ddgo <query>` | DuckDuckGo | Веб-пошук |
| `x rfc <number>` | RFC docs | Читання специфікацій RFC |
| `x se <query>` | Stack Exchange | Пошук запитань і відповідей |

## Цей skill0 ще росте

Починаємо з основного. Додамо:
- більше джерел (Project Gutenberg, arxiv)
- просунуті шаблони пошуку
- поради з фільтрації та форматування результатів

## Повний досвід

Після встановлення x-cmd усі опції — у `x knowledge --help`.

## Related