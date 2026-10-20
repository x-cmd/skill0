---
name: knowledge
description: |
  Cherchez dans Hacker News, Wikipedia, DuckDuckGo, docs RFC, et Stack Exchange depuis la ligne de commande.
  Zéro barrière — installez x-cmd et commencez à chercher.
  À utiliser pour « search », « hn », « hacker news », « wikipedia », « ddgo », « duckduckgo », « rfc », « stack overflow ».

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Cherchez dans les sources de connaissance d'Internet depuis la ligne de commande.

## Démarrage rapide

```bash
# Installer x-cmd
eval "$(curl https://get.x-cmd.com)"

# Top posts Hacker News
x hn top

# Recherche Wikipedia
x wkp "artificial intelligence"

# Recherche DuckDuckGo
x ddgo "rust programming language"

# Documents RFC
x rfc 2616

# Recherche Stack Exchange
x se "how to exit vim"
```

## Ce qui est disponible

| Commande | Source | Exemple |
|---------|--------|---------|
| `x hn top` | Hacker News | Top 10 posts tendance |
| `x hn new` | Hacker News | Dernières soumissions |
| `x wkp <query>` | Wikipedia | Chercher des articles |
| `x ddgo <query>` | DuckDuckGo | Recherche web |
| `x rfc <number>` | docs RFC | Lire les spécifications RFC |
| `x se <query>` | Stack Exchange | Chercher Q&A |

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Plus de sources (Project Gutenberg, arxiv)
- Motifs de recherche avancée
- Filtrage de résultats et astuces de format

## Expérience complète

`x knowledge --help` pour toutes les options après avoir installé x-cmd.

## Related

