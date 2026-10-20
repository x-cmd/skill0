---
name: issue
description: Issue-Management für devloop — Vorlagen für Ziel, rule.yml, Schlüsselresultate und den Issue-Lebenszyklus.
metadata:
  related: "devloop,repo"
---


# issue

Teil von [devloop](../devloop/SKILL.md).

## Vorlage für ein neues Entwicklungs-Issue

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

## Issue-Lebenszyklus

| Phase | Aktion | Kommentarinhalt |
|-------|--------|-----------------|
| Erstellt | `gh issue create` mit Vorlage | Ziel, Schlüsselresultate, rule.yml |
| In Arbeit | Aktualisieren, während die Arbeit fortschreitet | Fortschrittsnotizen, Zwischen-Screenshots |
| Verifiziert | `x rule check` besteht | Ergebnis des Rule-Checks, After-Screenshot |
| Geschlossen | `gh issue close` | Commit-SHA, abschließende Verifikationszusammenfassung |

## Vorlage für den Abschlusskommentar

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

## Regeln

- **MUSS** in jedem Entwicklungs-Issue `goal` und `keyresults` enthalten — keine Ausnahmen
- **MUSS** rule.yml als Codeblock im Issue-Body oder im ersten Kommentar posten
- **MUSS** bei Frontend-Änderungen vor und nachher Screenshots machen
- **NIEMALS** ein Issue ohne Verifikationsbelege schließen
- Issues mit dem Projekt-Board verlinken für Roadmap-Sichtbarkeit

## Verwandt

- [devloop](../devloop/SKILL.md) — Tracker für zielgetriebene Schleifen (Ziel/rule.yml/KRs)
- [repo](../repo/SKILL.md) — Issues hängen an Repos im x-repo-Layout
