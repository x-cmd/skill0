---
name: skill0-writer
description: Conventions d'écriture pour les documents skill0 — structure pyramidale, limites de lignes et règles de mise en page.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Les documents Skill0 suivent le **principe de la pyramide** : les agents peuvent ne lire que les 10–30 premières lignes, donc l'information la plus importante doit venir en premier. Le détail au-delà de la ligne 30 est le bonus, pas la charge utile.

## Ce qu'aucune règle n'attrape

- **Clarté plutôt que brièveté.** Un document court qui donne la mauvaise réponse est pire qu'un document long qui donne la bonne.
- **Les avertissements de sécurité DOIVENT être explicites** — utilisez MUST, NEVER, DO NOT. Énoncez les caveats comme des affirmations complètes, pas comme des apartés entre parenthèses.
- **N'élaborez pas sur le sens commun.** Si un mot de convention plus une ou deux phrases transmet le message, arrêtez-vous. Le lecteur sait déjà ce qu'est YAML, git et un cache ; passez le contexte sur ce qui est spécifique à ce repo. La justification est le coupable habituel — donnez la raison d'une règle seulement quand elle paraît fausse sans elle. (`sw-1200`)
- **Tableaux seulement pour de vraies matrices.** 3+ colonnes dont les lignes doivent être lues les unes contre les autres. Un tableau à deux colonnes est une liste déguisée en syntaxe de tableau — écrivez la liste. Un jeu de données appartient dans un `.tsv` externe à côté du doc, lié, pour qu'on puisse l'interroger via `x tsv`. (`sw-1250`)

## YFM — `SKILL.md` seulement

```yaml
---
name: <slug>                  # doit égaler le nom du répertoire
description: <résumé en 1-2 phrases qu'un agent utilise pour décider de charger>
---
```

`name` et `description` sont load-bearing. Tout le reste se niche dans le bloc `metadata:` de [yfm](../yfm/SKILL.md) sous forme de scalaires séparés par des virgules — optionnel, et ajoute de la structure pour l'indexation, la découverte et les hooks d'ontologie.

**Les sous-fichiers ne portent pas de YFM.** Seul `SKILL.md` est filtré par un chargeur, donc seul lui a besoin d'un front matter. Tout autre fichier (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) est lu directement par un agent qui a déjà décidé de l'ouvrir — le YFM là est pur coût en tokens, répétant un but que le titre et la première ligne donnent déjà. Commencez ces fichiers au titre `#`. S'en écarter nécessite une raison énoncée dans le fichier lui-même.

Pour les versions localisées en chinois, utilisez un `SKILL.cn.md` parallèle (un par skill). Ne mélangez pas les langues dans un seul fichier.

## Vérifications mécaniques

Vivent dans [skill0-writer.rule.yml](skill0-writer.rule.yml). Lancez `x rule lint skill0-writer.rule.yml` et `x rule check -r skill0-writer.rule.yml lib/skill0/`. Couverture : présence YFM + champs name/description, format du name, nombre de lignes ≤ 100 (idéal 50), ordre des sections install → usage → advanced → links, anglais uniquement, pas d'intro / pas de conclusion / pas de répétition, pas de fichiers orphelins.

## Vérification de sécurité à la troncature

Après écriture, relisez à la ligne 30 : un agent qui s'arrête là formerait-il une mauvaise compréhension ?

Si oui, déplacez plus tôt le qualificateur critique. Les 30 premières lignes doivent donner un modèle mental correct (même incomplet). Au-delà de la ligne 30, on étend avec le détail — la pyramide est auto-correctrice.

## Chargement à deux couches : description pour le matching, corps pour la référence

Les chargeurs de skills (Claude Code, Cursor, Continue, etc.) chargent SKILL.md en deux étapes :

  1. **YFM `description:`** — chargé automatiquement dans le catalogue
     de l'agent pour le matching. L'agent lit la description pour décider
     s'il doit charger le skill.
  2. **Corps** — chargé à la demande après un match. Matériel de référence.

Implications :

- **Description** = *ce que c'est + quand le charger* — dense en mots-clés,
  riche en déclencheurs, terse.
- **Corps** = *comment l'utiliser + référence* — exemples, schémas, cas
  limites, liens vers une doc plus profonde.

**Ne dupliquez pas le contenu entre les deux couches.** Ce que la description transmet, le corps doit l'*étendre*, pas ré-énoncer la même surface. Le paragraphe d'ouverture du corps en particulier ne doit pas lister les mêmes fonctionnalités que la description — le corps commence par la référence, pas par un second résumé.

Un test pratique : si vous supprimez entièrement la description et ne lisez que les 30 premières lignes du corps, l'agent doit toujours voir ce que le skill fait et quand le charger. Si seule la description porte cette information, le corps n'a rien à ajouter en haut — déplacez l'explication dans le corps et laissez la description porter le titre.

## Un skill est un pack de connaissances, pas un tutoriel

Le corps d'un skill est un **briefing pour le LLM**, pas un cours pour un débutant.

- **La capacité** vit dans le LLM. Le corps n'enseigne pas.
- **La connaissance** vit dans les outils de données x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) et les sources externes. Le corps pointe ; l'agent va re-fetcher.
- **Le cadrage** est le job du skill : il nomme la forme du problème, la convention, la sortie structurée, l'outil x-cmd à utiliser.

Un skill porte l'angle de résolution, la convention, la forme de sortie, et les pointeurs de source. Il ne porte **pas** la capacité (le LLM l'a déjà), des données statiques (elles pourrissent), ou des tutoriels (utilisez des sidecars).

Quand les spécificités sont trop détaillées ou trop mouvantes, poussez-les vers un sidecar (`references/`, `ANALYTICS.md`) ou une doc externe toujours à jour.

## Liens externes

Collectez deux types : **liens racine** (points d'entrée comme `llms.txt`, index de doc) et **liens utiles** (liens ciblés pour les 20% de docs qui couvrent 80% des cas d'usage). Listez la racine d'abord, les utiles après — l'IA comprend l'ordre. **Pas de duplication** sauf si l'emphase est critique.

## Caveats soft (choix de jugement)

- **Sous-fichiers (CLEANUP.md, references/*)** peuvent être plus longs que SKILL.md mais les 20 premières lignes portent toujours la charge (même pyramide).
- **DOIT** lier chaque sous-fichier depuis son SKILL.md parent (forward link obligatoire). Le back-link vers le SKILL.md parent depuis un sous-fichier est **optionnel** — les fichiers usecase référencent implicitement le parent par leur chemin. Appliqué par `sw-1000-no-orphan-docs` dans [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Spéculation** — énoncez des faits testés, ou étiquetez « untested ».
- **Emojis** sauf si le sujet du skill les exige.

## Related

- [yfm](../yfm/SKILL.md) — convention YFM que skill0-writer fait respecter
- [naming](../naming/SKILL.md) — le naming suit aussi les règles du writer
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — application mécanique
