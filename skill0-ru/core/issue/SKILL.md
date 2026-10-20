---
name: issue
description: Управление задачами для devloop — шаблоны для цели, rule.yml, key-results и жизненного цикла задачи.
metadata:
  related: "devloop,repo"
---


# issue

Часть [devloop](../devloop/SKILL.md).

## Шаблон новой задачи разработки

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Жизненный цикл задачи

| Этап | Действие | Содержимое комментария |
|-------|--------|-----------------|
| Создана | `gh issue create` с шаблоном | goal, key-results, rule.yml |
| В работе | Обновления по ходу работы | заметки о прогрессе, промежуточные скриншоты |
| Проверена | `x rule check` проходит | результат проверки правил, скриншот после |
| Закрыта | `gh issue close` | commit SHA, итоговая сводка проверки |

## Шаблон комментария о завершении

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## Правила

- **ОБЯЗАТЕЛЬНО** включай `goal` и `keyresults` в каждую задачу разработки — без исключений
- **ОБЯЗАТЕЛЬНО** публикуй rule.yml как блок кода в теле задачи или в первом комментарии
- **ОБЯЗАТЕЛЬНО** делай скриншоты до и после для изменений во frontend
- **НИКОГДА** не закрывай задачу без доказательств проверки
- Привязывай задачи к доске проекта для видимости в роадмапе

## Связанное

- [devloop](../devloop/SKILL.md) — трекер для циклов, ведомых целью (goal/rule.yml/KRs)
- [repo](../repo/SKILL.md) — задачи привязаны к репозиториям в раскладке x-repo