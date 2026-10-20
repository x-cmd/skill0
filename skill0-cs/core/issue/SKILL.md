---
name: issue
description: Správa issues pro devloop — šablony pro cíl, rule.yml, klíčové výsledky a životní cyklus issue.
metadata:
  related: "devloop,repo"
---


# issue

Součást [devloop](../devloop/SKILL.md).

## Šablona nového dev issue

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

## Životní cyklus issue

| Fáze | Akce | Obsah komentáře |
|-------|--------|-----------------|
| Vytvořeno | `gh issue create` se šablonou | cíl, klíčové výsledky, rule.yml |
| Probíhá | Průběžně aktualizovat podle postupu práce | poznámky o postupu, mezitímní screenshoty |
| Ověřeno | `x rule check` projde | výsledek rule check, screenshot po |
| Uzavřeno | `gh issue close` | commit SHA, souhrn konečného ověření |

## Šablona závěrečného komentáře

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

## Pravidla

- **MUSÍ** obsahovat `goal` a `keyresults` v každém dev issue — bez výjimky
- **MUSÍ** vložit rule.yml jako code block do těla issue nebo prvního komentáře
- **MUSÍ** udělat screenshot před a po u frontendových změn
- **NIKDY** nezavírat issue bez důkazů ověření
- Propojit issues s projektovou board kvůli viditelnosti roadmapu

## Související

- [devloop](../devloop/SKILL.md) — tracker pro cykly vedené cílem (cíl/rule.yml/KR)
- [repo](../repo/SKILL.md) — issues se v layoutu x-repo připojují k repozitářům
