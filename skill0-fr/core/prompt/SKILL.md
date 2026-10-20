---
name: prompt
description: Conventions d'ingénierie de prompt pour x-cmd — réutilisation via variables de modèle, règles de structure, motifs d'application de la sécurité.
metadata:
  related: "devloop,rule"
---


# Prompt

## Principe fondamental : réutiliser, ne pas dupliquer

Les prompts dans x-cmd sont assemblés à partir de fragments réutilisables, pas écrits comme des monolithes. Un modèle de prompt contient des variables `<PLACEHOLDER>` qui sont résolues à l'exécution par le module shell.

Exemple depuis `claw` :
```
first_contact.md          # autonome — chargé dans <FIRST_CONTACT_PROMPT>
msg_telegram.md           # assemble : <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # mêmes fragments, adaptateur de plateforme différent
heartbeat.md              # workflow différent, partage <CHECK_PROMPT>
```

**Pourquoi** : un fix se propage partout. Les adaptateurs de plateforme (Telegram, Feishu, WeChat) partagent des règles comportementales mais diffèrent en commandes d'envoi et limites de formatage.

Voir [reusing.md](reusing.md) pour les motifs de réutilisation détaillés.

## Règles de structure

- Chaque fichier de prompt est un jeu d'instructions complet et autonome pour un scénario
- Utilisez des placeholders `<UPPER_CASE>` pour les variables — jamais de données réelles en dur
- Les placeholders sont résolus par le module appelant, pas par le prompt lui-même
- Fragment = fonction (logique et flux), les données sont ajoutées à l'exécution (comme passer des arguments)

## Motif d'application de la sécurité

La sécurité et les règles comportementales DOIVENT être explicites et fermes :

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Utilisez MUST, NEVER, DO NOT. Voir [skill0-writer](../skill0-writer/SKILL.md) pour la règle de langage sécurité.

## Motif de guide de format

Quand les prompts ciblent plusieurs plateformes avec des capacités de formatage différentes :

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat : formatage limité. Texte brut, listes, emoji. Pas de tableaux.
- Telegram : markdown complet y compris tableaux. Max 4096 caractères.
- Feishu : markdown complet. Les messages carte nécessitent du JSON.
```

## Exemples réels

Les fragments de prompt vivent actuellement dans le `lib/data/prompt/` de chaque module (p. ex. `claw/lib/data/prompt/`).
Ils migreront vers `skill0/lib/skill0/<subskill>/` — même structure, emplacement canonique.

Exemples actuels dans `claw/lib/data/prompt/` :
- `first_contact.md` — accueil de nouveau workspace, fragment réutilisable
- `heartbeat.md` — agent en arrière-plan, lit l'état du workspace
- `msg_<platform>.md` — gestionnaires de messages par plateforme, partagent des fragments communs

## Related

- [devloop](../devloop/SKILL.md) — les prompts pilotent souvent des tâches devloop
- [rule](../rule/SKILL.md) — les règles de structure de prompt sont appliquées par x rule
