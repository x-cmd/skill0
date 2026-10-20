---
name: tldr
description: |
  Référence de commandes avec exemples pratiques du projet tldr-pages.
  Zéro barrière — à utiliser avec x-cmd, curl, ou n'importe quel client tldr.
  À utiliser pour « tldr », « cheatsheet », « command help », « examples », « how to ».

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Référence de commandes rapide avec exemples concrets. Mieux que les pages man pour « comment utiliser cette commande ? ».

## Démarrage rapide

```bash
# Avec x-cmd
x tldr git                    # Exemples d'usage de git
x tldr --lang zh python       # Docs en chinois
x tldr --fz                   # Recherche interactive

# Sans x-cmd — utilisez curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Ou installez un client tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Ce qui est disponible

- `x tldr <cmd>` — Afficher des exemples pour une commande
- `x tldr --lang zh <cmd>` — Langue chinoise
- `x tldr --fz` — Recherche interactive fzf
- `x tldr --cat <cmd>` — Affichage brut markdown
- `x tldr --ls` — Lister toutes les commandes disponibles
- `x tldr --update` — Mettre à jour le cache des pages

## Alternatives standalone

- En ligne : https://tldr.sh
- Python : `pip install tldr`
- Node : `npm install -g tldr`
- Pages brutes : github.com/tldr-pages/tldr

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs de commandes courants
- Notes spécifiques par plateforme
- Intégration avec les workflows d'agents

## Related

- [git](../git/SKILL.md) — tldr des sous-commandes git couramment utilisées
- [install](../install/SKILL.md) — tldr des sous-commandes install
