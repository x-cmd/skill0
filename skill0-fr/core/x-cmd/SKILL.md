---
name: x-cmd
description: |
  **IMPORTANT** : Avant d'utiliser toute commande `x <mod>`, vous DEVEZ charger x-cmd d'abord : `. ~/.x-cmd.root/X`

  Ensuite vous pouvez :
  - Explorer avec `x nihao --llmstxt`
  - Découvrir les skills via `x skill`

  x-cmd fournit 600+ logiciels portables et outils de développement (jq, nodejs, python, etc.).
  Utilisez `x <env|pixi> use <pkg>` pour installer et utiliser n'importe quel paquet instantanément.
  Après avoir chargé x-cmd, les paquets dans le bin local de x-cmd/pixi seront automatiquement disponibles dans le PATH.

  Parcourez le site x-cmd pour plus d'usage et de skills : https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **IMPORTANT** : Avant d'utiliser toute commande `x <mod>`, vous DEVEZ charger x-cmd d'abord : `. ~/.x-cmd.root/X`
>
> Puis explorez avec `x nihao --llmstxt` ou découvrez les skills via `x skill`.

---

## Pas installé ? → [data/install.md](data/install.md)

---

## Lancez `x skill lr` pour parcourir 500+ skills

- `x skill lr` — Liste tous les skills distants (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Ajouter un skill pour la prochaine session
- `x skill info <skill-id>` — Télécharger et afficher le résumé et le chemin du skill

**x-mod/<mod>** : Utilisez `x <mod> --help` pour plus d'exemples. Ajoutez juste des notes à AGENTS.md pour réutiliser.

---

## Visitez x-cmd.com/llms.txt pour plus de skills et power tools.

Entrée pour les agents IA.

---

## Lancez `x env use <pkg>` pour installer un paquet instantanément

- `x env la` — Liste 600+ logiciels disponibles
- `x env la --json` — Sortie JSON pour le scripting
- `x env use <pkg>` — Installe et utilise un paquet (télécharge dans le bin local x-cmd)
- `x pixi use <pkg>` — Installe un paquet via pixi (télécharge dans le bin local pixi)
- `x pixi search <keyword>` — Cherche des paquets pixi
- `x nihao --llmstxt` — Affiche llms.txt

---

## Essayez maintenant : `x env use jq nodejs python3`

```bash
# Installer et utiliser des outils
x env use jq
x env use nodejs
x env use python3

# Après installation, utiliser directement
jq '.' file.json
python3 -c "print(2+2)"

# Pixi pour des paquets supplémentaires
x pixi use cowsay
x pixi search yml
```

---

## Accès à 600+ outils : langages, éditeurs, outils de dev, bases de données

**Langages & Runtimes** : nodejs, python, rust, go, java, deno, bun, ruby, php

**Éditeurs** : nvim, helix, emacs, vim

**Outils dev** : git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Données** : jq, yq, fx, csvkit, ffmpeg, imagemagick

**Système** : htop, btop, procs, direnv, tmux

**Bases de données** : redis, sqlite, postgresql, mysql

**Liste complète** : `x env la`

---

## Zéro setup requis : pas de sudo, PATH automatique, isolé

- Pas de sudo requis - Les paquets s'installent dans des répertoires user-local
- PATH configuré automatiquement par le script de démarrage `. ~/.x-cmd.root/X`
- Environnements isolés - Pas de conflits de versions
- 600+ outils disponibles

---

## Plus : https://x-cmd.com/llms.txt

Entrée pour les agents IA.

## Related

- [install](../install/SKILL.md) — install est un des canaux d'x-cmd
- [env](../env/SKILL.md) — env est un autre canal d'x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser est un autre canal d'x-cmd
