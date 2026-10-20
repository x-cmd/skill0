---
name: devloop
description: Цикл разработки, ведомый целью — сформулировать objective, записать правила с key-results, проверить визуально, синхронизировать с трекером задач.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Подготовка

```
x rule init :ror                          # или набор правил под конкретный проект
x env use agent-browser                   # для визуальной проверки
```

## Рабочий процесс

```
goal → rule.yml → code → verify → issue
```

### 1. Сформулировать цель → написать rule.yml

До написания кода создай для задачи rule.yml:

```yaml
goal: "Исправить английскую версию: в секции Features показываются китайские теги"
keyresults:
  - kr-1: "В английском режиме все теги Features на английском"
  - kr-2: "В китайском режиме теги Features остаются китайскими"
  - kr-3: "Сборка проходит без регрессий"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - When language=en, all details[] items must be English
    - No Chinese characters in any tag badge in English mode
```

Поля правила: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Смотри `x rule -h`.

**ОБЯЗАТЕЛЬНО** включай `goal` и `keyresults` — два обязательных поля для каждой задачи разработки.

### 2. Выполнить → визуальная проверка (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... вносим изменения ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**ОБЯЗАТЕЛЬНО** делай скриншот до и после. Сравнивай с замыслом:
1. Проверка зрением ИИ: соответствует ли after.png цели?
2. Если нет → итерируй и делай скриншот заново
3. **Удаляй все приватные данные** (токены, почту, персональную информацию) перед загрузкой

### 3. Проверь через x rule

```
x rule scan <files>     # быстро (~1 мин), для внутреннего цикла
x rule check <files>    # тщательно (~10 мин)
x rule audit <files>    # полный отчёт (~30 мин)
```

### 4. Синхронизируй с трекером задач

Смотри [issue/SKILL.md](../issue/SKILL.md). Минимум: опубликовать в задаче цель, key-results, rule.yml и скриншоты до/после.

## Инструменты агента

- `x rule scan` — быстрая проверка во время итерации
- `x rule check` — полная проверка соответствия перед коммитом
- `agent-browser screenshot` — визуальное доказательство до/после
- `gh issue create/comment` — синхронизация цели + rule.yml с трекером

## Связанное

- [rule](../rule/SKILL.md) — rule.yml это каркас проверки
- [score](../score/SKILL.md) — для оценки KR используется фреймворк score
- [install](../install/SKILL.md) — настраивает окружение разработки
- [agent-browser](../../it/agent-browser/SKILL.md) — визуальная проверка до/после
- [issue](../issue/SKILL.md) — синхронизирует цель + KR + скриншоты с трекером задач
- [repo](../repo/SKILL.md) — тянет/пушит работу в репозиториях
- [prompt](../prompt/SKILL.md) — соглашения по prompt часто задают задачи devloop