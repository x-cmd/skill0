---
name: meme
description: |
  Générer des images de meme en superposant du texte sur des templates.
  Zéro barrière — fonctionne avec Python + Pillow, pas de framework requis.
  Les templates sont fetched à la demande depuis le repo awesome-meme.
  À utiliser pour « meme », « meme generator », « text overlay », « distracted boyfriend », « image macro ».

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Générer des images de meme. 30+ templates. Zéro barrière.

Un agent IA lit ce fichier et sait faire des memes. Pas besoin d'x-cmd.

## Démarrage rapide

```bash
# Installer les dépendances
pip install pillow pyyaml

# Générer un meme (téléchargement auto du template depuis GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Plus d'exemples

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Options

| Option | Valeurs | Défaut | Description |
|--------|---------|--------|-------------|
| `--backend` | pillow, magick | pillow | Backend de rendu |
| `--layout` | chest-label, above-head, bottom-label | (défaut spec) | Préréglage de placement du texte |
| `--output` | chemin de fichier | meme_output.jpg | Chemin du fichier de sortie |

## Sélection de police

- Anglais / Latin — Impact (défaut)
- Chinois / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Mixte — Chaque slot auto-détecté indépendamment

Impact n'a pas de glyphes CJK — le texte chinois sera invisible. Le renderer auto-détecte le CJK et retombe sur des polices système. Sur Linux : `apt install fonts-noto-cjk`.

## Pur Shell (sans Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Améliorer avec x-cmd

Si vous avez x-cmd installé :

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Même résultat, intégration plus propre avec l'écosystème x-cmd.

## Source de données

Les templates vivent dans [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Le renderer fetche les specs et images depuis GitHub à la demande.

## Docs

- [references/INSTALL.md](references/INSTALL.md) — Dépendances (Pillow, ImageMagick, polices)
- [references/PILLOW.md](references/PILLOW.md) — Détails du backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Détails du backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Guide d'usage agent IA

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser peut rendre/sortir des images de meme
