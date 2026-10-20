---
name: issue
description: Managementul issue-urilor pentru devloop — șabloane pentru obiectiv, rule.yml, key-results și ciclul de viață al unui issue.
metadata:
  related: "devloop,repo"
---


# issue

Face parte din [devloop](../devloop/SKILL.md).

## Șablon pentru issue de dezvoltare nou

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

## Ciclul de viață al issue-ului

| Etapă | Acțiune | Conținutul comentariului |
|-------|--------|-----------------|
| Creat | `gh issue create` cu șablonul | obiectiv, key-results, rule.yml |
| În lucru | Actualizat pe măsură ce avansezi | note de progres, capturi intermediare |
| Verificat | `x rule check` trece | rezultatul verificării, captura de după |
| Închis | `gh issue close` | commit SHA, rezumatul verificării finale |

## Șablon pentru comentariul de finalizare

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

## Rules

- **TREBUIE** să includă `goal` și `keyresults` în fiecare issue de dezvoltare — fără excepții
- **TREBUIE** să posteze rule.yml ca bloc de cod în corpul issue-ului sau în primul comentariu
- **TREBUIE** capturi de ecran înainte și după pentru modificările de frontend
- **NICIODATĂ** să închidă un issue fără dovezi de verificare
- Leagă issue-urile de project board pentru vizibilitate în roadmap

## Related

- [devloop](../devloop/SKILL.md) — tracker pentru buclele bazate pe obiectiv (goal/rule.yml/KR-uri)
- [repo](../repo/SKILL.md) — issue-urile se atașează la repo-uri în layout-ul x-repo