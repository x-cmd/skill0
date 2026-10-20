---
name: devloop
description: Boucle de développement pilotée par objectif — définir l'objectif, écrire des règles avec des key-results, vérifier visuellement, synchroniser avec le tracker d'issues.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # ou un ruleset spécifique au projet
x env use agent-browser                   # pour la vérification visuelle
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. Définir l'objectif → écrire rule.yml

Avant de coder, créez un rule.yml pour la tâche :

```yaml
goal: "Corriger la version anglaise qui affiche des tags chinois dans la section Features"
keyresults:
  - kr-1: "Les tags Features en mode anglais sont tous en anglais"
  - kr-2: "Les tags Features en mode chinois restent en chinois"
  - kr-3: "Le build passe sans régression"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Quand language=en, tous les items details[] doivent être en anglais
    - Aucun caractère chinois dans aucun badge de tag en mode anglais
```

Champs de la règle : `id`, `name`, `apply`, `level`, `desc`, `tldr`. Voir `x rule -h`.

**DOIT** inclure `goal` et `keyresults` — les deux champs obligatoires pour toute tâche de dev.

### 2. Exécuter → vérification visuelle (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... modifications ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**DOIT** capturer des screenshots avant et après. Comparez avec l'intention :
1. Vérification par la vision IA : est-ce que after.png correspond à l'objectif ?
2. Si mismatch → itérer et re-screenshooter
3. **Anonymisez toutes les données privées** (tokens, emails, infos personnelles) avant tout upload

### 3. Vérifier avec x rule

```
x rule scan <files>     # rapide (~1 min), pour la boucle interne
x rule check <files>    # approfondi (~10 min)
x rule audit <files>    # rapport complet (~30 min)
```

### 4. Synchroniser avec le tracker d'issues

Voir [issue/SKILL.md](../issue/SKILL.md). Minimum : poster l'objectif, les key-results, le rule.yml, les screenshots avant/après sur l'issue.

## Outils agent

- `x rule scan` — vérification rapide pendant l'itération
- `x rule check` — conformité complète avant commit
- `agent-browser screenshot` — preuve visuelle avant/après
- `gh issue create/comment` — synchroniser objectif + rule.yml avec le tracker

## Related

- [rule](../rule/SKILL.md) — rule.yml est le squelette de vérification
- [score](../score/SKILL.md) — le scoring des KR utilise le framework score
- [install](../install/SKILL.md) — prépare l'environnement de dev
- [agent-browser](../../it/agent-browser/SKILL.md) — vérification visuelle avant/après
- [issue](../issue/SKILL.md) — synchronise objectif + KRs + screenshots avec le tracker d'issues
- [repo](../repo/SKILL.md) — pull/push du travail dans les repos
- [prompt](../prompt/SKILL.md) — les conventions de prompt pilotent souvent les tâches devloop
