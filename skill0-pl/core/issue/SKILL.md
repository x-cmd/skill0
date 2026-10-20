---
name: issue
description: Zarządzanie issue w devloop — szablony dla celu, rule.yml, wyników kluczowych i cyklu życia issue.
metadata:
  related: "devloop,repo"
---


# issue

Część [devloop](../devloop/SKILL.md).

## Szablon nowego issue deweloperskiego

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

## Cykl życia issue

| Etap | Działanie | Treść komentarza |
|-------|--------|-----------------|
| Utworzone | `gh issue create` ze szablonem | cel, wyniki kluczowe, rule.yml |
| W toku | Aktualizuj w miarę postępu prac | notatki o postępach, zrzuty pośrednie |
| Zweryfikowane | `x rule check` przechodzi | wynik sprawdzenia reguł, zrzut „po" |
| Zamknięte | `gh issue close` | SHA commita, końcowe podsumowanie weryfikacji |

## Szablon komentarza końcowego

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

## Reguły

- **MUSI** zawierać `goal` i `keyresults` w każdym issue deweloperskim — bez wyjątków
- **MUSI** wstawić rule.yml jako blok kodu w treści issue lub w pierwszym komentarzu
- **MUSI** dołączyć zrzuty ekranu „przed" i „po" przy zmianach w frontendzie
- **NIGDY** nie zamykać issue bez dowodów weryfikacji
- Podlinkuj issue do tablicy projektu, by był widoczny w roadmapie

## Powiązane

- [devloop](../devloop/SKILL.md) — rejestr pętli sterowanych celami (cel/rule.yml/KR)
- [repo](../repo/SKILL.md) — issue dołączają do repozytoriów w układzie x-repo