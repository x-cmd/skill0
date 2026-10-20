---
name: wikipedia
description: |
  Cherchez et lisez Wikipedia via x wkp — API MediaWiki, sans clé API,
  zéro install ; query, extract, suggest, et route DDG en un seul module.
  Charger pour wiki, wikipedia, encyclopedia lookup, article summary.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

La sortie est un extrait en texte brut (~premier paragraphe + infobox). Le verbe de la sous-commande choisit la forme — `hop` pour search-then-summary, `extract` pour les titres connus, `search` pour les candidats, `suggest` pour le did-you-mean. Le site par défaut est le Wikipedia anglais ; `--lang` / `--api-url` bascule vers d'autres wikis.

## Démarrage rapide avec `x wkp`

```bash
x wkp hop Python                      # recherche + extrait du premier résultat en un coup
x wkp extract OpenAI                  # résumé d'une page connue
x wkp search "Linux kernel"           # liste des candidats quand le titre est incertain
x wkp suggest pythen                  # did-you-mean : correction hints avant la recherche
```

`x wkp -h` pour tous les flags et sous-commandes.

## Données et outils adjacents

Upstream : `https://en.wikipedia.org/w/api.php` — API d'action MediaWiki. Les projets sœurs (Wikidata, Wiktionary, Commons) sont accessibles de la même façon ; pointez `--api-url` vers le sous-domaine pertinent.

Pour les questions qui vont un saut au-delà d'un résumé wikitext :
- `x wkp : <query>` / `x wkp ddgo <query>` — même module `x wkp`, routé via l'index Wikipedia de DuckDuckGo (gère mieux que la recherche par titre les requêtes ambiguës ou familières)
- `x ddgo <query>` — recherche web générale, utile quand Wikipedia n'a pas d'article mais que le sujet existe sur le web ouvert
- Voir le skill [knowledge](../knowledge/SKILL.md) pour le toolkit de recherche plus large `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — retomber sur le navigateur quand on a vraiment besoin de la page rendue (infoboxes, tableaux, images)
