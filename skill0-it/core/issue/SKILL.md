---
name: issue
description: Gestione delle issue per il devloop — template per obiettivo, rule.yml, key-result e ciclo di vita dell'issue.
metadata:
  related: "devloop,repo"
---


# issue

Fa parte di [devloop](../devloop/SKILL.md).

## Template per una nuova issue di sviluppo

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

## Ciclo di vita dell'issue

| Stage | Action | Comment content |
|-------|--------|-----------------|
| Creata | `gh issue create` con il template | obiettivo, key-result, rule.yml |
| In corso | Aggiornare man mano che il lavoro procede | note di avanzamento, screenshot intermedi |
| Verificata | `x rule check` passa | risultato del rule check, screenshot finale |
| Chiusa | `gh issue close` | commit SHA, riepilogo della verifica finale |

## Template del commento di chiusura

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

## Regole

- **DEVI** includere `goal` e `keyresults` in ogni issue di sviluppo — senza eccezioni
- **DEVI** pubblicare rule.yml come blocco di codice nel corpo dell'issue o nel primo commento
- **DEVI** fare uno screenshot prima e dopo per le modifiche al frontend
- **NON devi MAI** chiudere un'issue senza prove di verifica
- Collega le issue alla project board per la visibilità sulla roadmap

## Related

- [devloop](../devloop/SKILL.md) — tracker per i cicli guidati dall'obiettivo (obiettivo/rule.yml/KR)
- [repo](../repo/SKILL.md) — le issue si agganciano ai repo nel layout x-repo