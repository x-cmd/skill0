---
name: env
description: |
  Installez et gérez les paquets logiciels, les runtimes de langages et les outils CLI instantanément.
  Zéro barrière — installez x-cmd et obtenez n'importe quel outil en secondes. Pas de sudo requis.
  À utiliser pour « install », « package », « python », « node », « jq », « runtime », « tool ».

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Installez n'importe quel logiciel instantanément. Pas de sudo. Pas de pollution du système.

## Démarrage rapide

```bash
# Installer x-cmd
eval "$(curl https://get.x-cmd.com)"

# Installer Python
x env use python

# Installer Node.js
x env use node

# Installer des outils CLI
x env use jq
x env use fzf

# Essayer sans installer de façon permanente
x env try python3 script.py
```

## Ce qui est disponible

600+ paquets incluant :

- Langages — python, node, go, bun, java, rust
- Outils CLI — jq, yq, fzf, himalaya
- Outils dev — claude-code, code-server

## Fonctionnalités clés

- **Pas de sudo** — installe dans le répertoire utilisateur
- **Gestion de versions** — installer et basculer entre versions
- **Essayer avant d'installer** — `x env try` pour usage temporaire
- **Nettoyage** — `x env clean` supprime les paquets inutilisés

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs d'install courants
- Astuces de pinning de version
- Guides de setup de projets multi-langages

## Expérience complète

`x env --help` pour toutes les options après avoir installé x-cmd.

## Related

- [install](../install/SKILL.md) — `x env use` est un des canaux d'install
- [x-cmd](../x-cmd/SKILL.md) — point d'entrée parapluie pour env
