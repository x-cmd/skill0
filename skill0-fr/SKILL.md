---
name: skill0
description: "Index racine des sous-skills skill0 d'x-cmd. Définit le workflow agent style OKR (goal → résultats vérifiés par règle → execute), la découverte de skills, et les préférences d'outillage agent. Style : principe d'abord, concis, délègue les spécificités à des sources externes faisant autorité."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 encode des principes, pas des données

Le LLM absorbe le bon sens en continu ; le job de skill0 est d'encoder des conventions et des pointeurs de source, puis de s'amincir avec le temps à mesure que le LLM rattrape. Vérifiez via des données first-party (`x rfc`, `x cve`, `x wkp`, `agent-browser`) et la best practice courante (`x skill`, `x clawhub`), puis reconstruisez avec de la logique formelle plutôt que par mémorisation.

## Les sous-skills forment un graphe dirigé à travers 4 buckets

Buckets : `core/`, `data/`, `it/`, `life/`. Chemin : `<bucket>/<slug>/SKILL.md`. Le catalogue machine-readable (name + description) est à [index.tsv](index.tsv). Un doc vivait ici comme guide d'interaction manager/lifestyle ; il a été déplacé vers [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) car il ne fait pas partie du graphe skill0.

## Goal → keyresults → x-rule est le workflow OKR

Objective : quoi atteindre
Key Results : comment vérifier
Vérification : `x rule check/audit`

## Après scaffolding, préférez les outils x-cmd pour l'exécution

- `x skill` — catalogue de skills x-cmd curated et revu par des humains.
- `x clawhub` — registre global de skills. **Attention** : upload libre, DOIT lancer `x clawhub skill moderate <name>` pour le rapport de sécurité auto-généré.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — gestion de projet, scheduling, agents en arrière-plan, ontologie, wiki. Lancez `x [mod] --help`.

## Chaque SKILL.md doit passer skill0-writer

Voir [skill0-writer](core/skill0-writer/SKILL.md) pour les conventions.
