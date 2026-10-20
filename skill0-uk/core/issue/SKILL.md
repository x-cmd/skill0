---
name: issue
description: Керування issue для devloop — шаблони для goal, rule.yml, key-results і життєвого циклу issue.
metadata:
  related: "devloop,repo"
---


# issue

Частина [devloop](../devloop/SKILL.md).

## Шаблон нового dev issue

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

## Життєвий цикл issue

| Етап | Дія | Вміст коментаря |
|-------|--------|-----------------|
| Created | `gh issue create` з шаблоном | goal, key-results, rule.yml |
| In progress | Оновлення під час роботи | нотатки про прогрес, проміжні скріншоти |
| Verified | `x rule check` проходить | результат перевірки правил, скріншот after |
| Closed | `gh issue close` | commit SHA, фінальний підсумок перевірки |

## Шаблон коментаря про завершення

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

- **ПОВИННО** бути `goal` і `keyresults` у кожному dev issue — без винятків
- **ПОВИННО** вставити rule.yml як блок коду в тіло issue або в перший коментар
- **ПОВИННО** зробити скріншоти before і after для змін у фронтенді
- **НІКОЛИ** не закривати issue без доказів перевірки
- Прив'язувати issue до проєктної дошки, щоб roadmap був видимий

## Related

- [devloop](../devloop/SKILL.md) — трекер для goal-орієнтованих циклів (goal/rule.yml/KRs)
- [repo](../repo/SKILL.md) — issue прикріплюються до репозиторіїв у розкладці x-repo