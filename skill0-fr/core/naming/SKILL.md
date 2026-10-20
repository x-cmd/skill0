---
name: naming
description: |
  Cadre de nommage pour les modules / commandes / sous-commandes x-cmd. Subjectif + piloté par scénario ; ce skill est une coquille vide, PAS un livre de règles. Trois couches : investigation (objectif), naming.<user-task>.yml (OKR + journal de session, un fichier .rule), naming.okr-creator.yml (meta-règle qui audite la session).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Le nommage est **subjectif et piloté par scénario**. Ce skill est un **cadre**, pas un livre de règles — il ne fige pas de règles de nommage subjectives.

## Vue d'ensemble rapide

```
┌─────────────────────────────────────────────────────────┐
│  1. INVESTIGUER l'objectif                              │
│     Que nomme-t-on ? Quel rôle ? Quel concept ?         │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (fichier .rule)              │
│     - goal-*        (la tâche de nommage)               │
│     - keyresult-*   (résultats vérifiables)             │
│     - task-*        (contraintes propres à la tâche)    │
│     - session:      (piste d'audit sur la règle goal)   │
│         prefer     (5 réponses init-004)                │
│         init_verdicts (décisions par candidat)          │
│         scores     (ancrages D1-D7 par candidat)        │
│         final      (choix + backup)                     │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITER avec template/naming.okr-creator.yml        │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — étape par étape

### Étape 1 · Investiguer l'objectif

Avant d'écrire quoi que ce soit, répondez à ces questions. NE sautez PAS cette étape — sans réponses, le scorer ne peut pas ancrer D4 (TRIAL/REAL) ou D5 (RUN/TEST).

- **Que nomme-t-on ?** — module / sous-commande / champ / variable — les règles de forme diffèrent selon le cas
- **Quel rôle joue-t-il ?** — ancre le concept (ex. « module trial-run » → runner autonome, Stage 1 d'un test en deux étapes)
- **Quel a priori DOIT-IL porter ?** — le sens dominant du mot nu doit correspondre (ex. trial-run nécessite TRIAL+RUN, pas REAL+TEST)
- **Quels a priori DOIT-IL ÉVITER ?** — pollution unitaire (`*test`/`*case`), faux (`*mock`/`*fake`/`*stub`/`*dry`), déploiement réel (`field*`/`*live*`)
- **Quel archétype convient ?** — ship / plane / rocket / factory / abstract — pilote D6/D7

Sortie : un énoncé d'objectif en une ligne, par exemple
> « Choisir un nom de module x-cmd autonome pour trial-run (Stage 1 d'un test en deux étapes), qui obtient 8.0+ sur D1-D7, s'explique au premier regard, et survit à tous les fast-fails (ligne rouge / dictionnaire / longueur). »

### Étape 2 · Créer le journal de session

Copiez le modèle et complétez.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Puis remplissez 4 sections (de haut en bas) :

#### 2a. Règle goal (la tâche de nommage)

Remplacez `goal-TBD_task_id` par un vrai identifiant. Le suffixe de l'ID doit refléter la tâche (ex. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <énoncé d'objectif en une ligne, issu de l'Étape 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concept + rôle + anti-a-priori, issus de l'Étape 1>
```

#### 2b. Key results (résultats vérifiables)

Remplacez chaque `keyresult-kr*_TBD_short_label`. Chaque KR est une règle qui doit être PASS-able. Ajoutez-en autant que la tâche le demande.

```yaml
keyresult-kr1-top-pick-committed:
  name: <résultat vérifiable 1>
  level: error
  desc:
  - <ce qui compte comme PASS — critère concret, pas « ça a l'air bien »>
```

#### 2c. Règles propres à la tâche (contraintes sur les candidats)

Remplacez chaque `TBD_task_id-*` par un identifiant de contrainte réel, aligné sur le suffixe de l'ID de tâche. Supprimez celles qui ne s'appliquent pas, ajoutez-en si besoin.

Motifs courants :
- `must-be-X-not-Y` — alignement de concept (ex. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — plage stricte D1
- `must-imply-<archetype>` — liaison D7
- `<domain>-specific-acceptable` / `not-acceptable` — permission domaine étroit
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <contrainte, ex. « must-be-TRIAL-not-REAL »>
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <ce que le candidat doit satisfaire>
  - <quelle dimension D1-D7 cela contraint>
  tldr:
  - wrong: <anti-exemple>
  - right: <bon exemple>
```

#### 2d. Journal de session (piste d'audit sur la règle goal)

Remplissez les 4 sous-sections :

**prefer** — DOIT répondre aux 5 questions, même si la réponse est « non / faible » :
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<liste de domaines étroits OK, ex. [naval]>]   # [] = aucun domaine étroit OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — une entrée par candidat considéré, rejets inclus :
```yaml
init_verdicts:
  - { name: <candidat>, gate: init-005 | init-006 | init-007 | pass, reason: "<pourquoi>" }
  # init-005 = match de motif ligne rouge (rejet auto)
  # init-006 = le premier sens du dictionnaire contredit la cible
  # init-007 = longueur hors plage (< 2 ou > 8)
  # pass     = passé toutes les portes init, éligible au scoring
```

**scores** — une entrée par candidat passé à init. Tous les scores >= 6.0. Chaque score DOIT avoir des ancrages :
```yaml
scores:
  - name: <candidat>
    score: <0_to_10>
    anchors:
      - "D1: <preuve via nombre de lettres>"
      - "D2: <preuve via premier sens du dictionnaire>"
      - "D3: <preuve via sens littéral composé>"
      - "D4: <preuve trial vs real>"
      - "D5: <preuve run vs test>"
      - "D6: <preuve de vividness>"
      - "D7: <preuve de gros équipement>"
    misses:
      - "<ce qui manque — ne listez que les vrais manques, pas toujours les 7>"
```

**final** — déclare le choix + le backup :
```yaml
final:
  pick: <candidat_gagnant>
  backup: <dauphin_ou_null>
```

### Étape 3 · Auditer avec la meta-règle

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

L'OKR-creator (à `template/naming.okr-creator.yml`) exécute 11 vérifications (mix d'error et warn) :

| Vérification | Niveau | Ce qu'elle vérifie |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | le fichier contient ≥ 1 règle `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | le fichier contient ≥ 1 règle `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | le fichier contient ≥ 1 règle de tâche (hors goal/keyresult) |
| `okr-creator-010` has-session-record | error | la règle goal a un champ `session:` |
| `okr-creator-011` prefer-answers-all-five | error | les 5 questions init-004 sont répondues |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts non vide |
| `okr-creator-013` scores-have-anchors | error | chaque score a une liste d'ancrages non vide |
| `okr-creator-014` scores-no-below-6 | error | tous les scores >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` déclaré |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | score du pick >= 7.0 |

**Si une vérification error échoue** : corrigez le fichier et relancez. Corrections courantes :
- Champ prefer manquant → ajoutez à `session.prefer`
- Score nu → ajoutez `anchors: [...]`
- Score < 6 → déplacez dans `init_verdicts` (rejet) ou recadrez le score
- `final` manquant → ajoutez `final: { pick, backup }`

**Si une vérification warn échoue** : décidez s'il faut la corriger ou documenter le compromis.

### Étape 4 · L'utilisateur choisit le nom final

Le skill propose ; l'utilisateur décide. Le nom final est déclaré dans `session.final.pick` puis committé.

## Fichiers

| Fichier | Rôle | Format |
|---|---|---|
| `SKILL.md` | Ce fichier — workflow + index | markdown |
| `naming.template.yml` | MODÈLE avec des placeholders `TBD_*` — copier, renommer, remplir | `.rule` |
| `naming.trial-run-module.yml` | Exemple complet de journal de session | `.rule` |
| `template/naming-concept.yml` | Cadre d'évaluation objectif (D1-D7, lignes rouges, ancrages de score) — sous forme d'entrées `.rule` | `.rule` |
| `template/naming-brand.yml` | Règles de marque x-cmd (longueur, casse, préférences d'a priori) — sous forme d'entrées `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-règle : audite un `naming.<user-task>.yml` (les 11 vérifications ci-dessus) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Préréglage optionnel de nommage de module x-cmd (journal de session de démarrage) | `.rule` |

## Répartition subjectif / objectif

| Objectif (fichiers / code) | Subjectif (demandé à init, non scoré) |
|---|---|
| Premier sens du dictionnaire | « Je veux vivid vs abstract » |
| Nombre de lettres | « Je veux le domaine X acceptable » |
| Classe sémantique Trial / Real / Run / Test | « Je veux la métaphore navale OK ou pas » |
| Sens littéral composé | « Je veux origine chinoise vs anglaise » |
| Pollution d'a priori (unittest testcase, dryrun) | « Je veux court plutôt que self-explanatory » |

## Règles

- **DOIT** investiguer l'objectif d'abord — ce qu'on nomme, le rôle, les ancres conceptuelles.
- **DOIT** partir de `naming.template.yml` (placeholders `TBD_*`) et élaguer / remplir selon la tâche.
- **DOIT** produire un `naming.<user-task>.yml` (format `.rule`) avec goal / key results / règles de tâche / journal de session.
- **DOIT** lancer `x rule check` avec `template/naming.okr-creator.yml` pour auditer le journal de session.
- **DOIT** ancrer les scores dans des faits objectifs — jamais gonfler/dégonfler selon la réaction de l'utilisateur.
- **DOIT** laisser l'utilisateur choisir le nom final — le skill propose, l'utilisateur décide.
- **NE DOIT PAS** ajouter de règles subjectives à `template/naming-concept.yml` — celles-ci vont dans le `session.prefer` de la tâche.

## Related

- [rule](../rule/SKILL.md) — la session de nommage est vérifiée via x rule
- [score](../score/SKILL.md) — les candidats sont scorés via le framework score
- [ontology-database](../ontology-database/SKILL.md) — le nom choisi persiste dans ondb
