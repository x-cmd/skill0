---
name: issue
description: Gestion d'issues pour devloop — modèles pour objectif, rule.yml, key-results, et cycle de vie d'une issue.
metadata:
  related: "devloop,repo"
---


# issue

Fait partie de [devloop](../devloop/SKILL.md).

## Modèle de nouvelle issue de dev

```
gh issue create --title "<scope>: <description courte>" --body "$(cat <<'EOF'
## Goal
<objectif en une ligne>

## Key Results
- [ ] KR-1 : <résultat vérifiable>
- [ ] KR-2 : <résultat vérifiable>

## rule.yml
```yaml
goal: "<comme ci-dessus>"
keyresults:
  - kr-1: "<comme ci-dessus>"
  - kr-2: "<comme ci-dessus>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <critère>
```

## Screenshots
- Before : <image ou « N/A »>
- After : <image ou « pending »>
EOF
)"
```

## Cycle de vie d'une issue

| Étape | Action | Contenu du commentaire |
|-------|--------|--------------------|
| Créée | `gh issue create` avec le modèle | objectif, key-results, rule.yml |
| En cours | Mise à jour au fil du travail | notes de progression, screenshots intermédiaires |
| Vérifiée | `x rule check` passe | résultat rule check, screenshot after |
| Fermée | `gh issue close` | SHA du commit, résumé final de vérification |

## Modèle de commentaire de complétion

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml : <bloc de code ou lien>
- x rule check : PASS
- Before : <image>
- After : <image>
- Commit : <sha>
EOF
)"
```

## Règles

- **DOIT** inclure `goal` et `keyresults` dans toute issue de dev — sans exception
- **DOIT** poster rule.yml en bloc de code dans le corps de l'issue ou le premier commentaire
- **DOIT** capturer des screenshots avant et après pour les changements frontend
- **NE DOIT JAMAIS** fermer une issue sans preuve de vérification
- Lier les issues au tableau de projet pour la visibilité roadmap

## Related

- [devloop](../devloop/SKILL.md) — tracker pour les boucles pilotées par objectif (goal/rule.yml/KRs)
- [repo](../repo/SKILL.md) — les issues s'attachent aux repos dans la disposition x-repo
