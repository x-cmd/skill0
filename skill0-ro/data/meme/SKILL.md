---
name: meme
description: |
  Generează imagini meme suprapunând text peste șabloane.
  Fără bariere — funcționează cu Python + Pillow, fără framework.
  Șabloanele sunt aduse la cerere din repo-ul de date awesome-meme.
  Folosește pentru "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Generează imagini meme. 30+ șabloane. Fără bariere.

Un agent AI citește acest fișier și știe să facă meme-uri. Nu e nevoie de x-cmd.

## Quick Start

```bash
# Install dependencies
pip install pillow pyyaml

# Generate a meme (auto-downloads template from GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Mai multe exemple

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opțiuni

| Opțiune | Valori | Implicit | Descriere |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend-ul de randare |
| `--layout` | chest-label, above-head, bottom-label | (implicit din spec) | Preset de plasare a textului |
| `--output` | cale fișier | meme_output.jpg | Calea fișierului de ieșire |

## Alegerea fontului

- Engleză / latin — Impact (implicit)
- Chineză / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Amestec — fiecare slot e detectat automat, independent

Impact nu are glife CJK — textul chinezesc va fi invizibil. Rendererul detectează automat CJK și revine la fonturile de sistem. Pe Linux: `apt install fonts-noto-cjk`.

## Shell pur (fără Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Upgrade cu x-cmd

Dacă ai x-cmd instalat:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Același rezultat, integrare mai curată cu ecosistemul x-cmd.

## Sursa de date

Șabloanele stau în [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Renderer-ul aduce specificațiile și imaginile de pe GitHub la cerere.

## Docs

- [references/INSTALL.md](references/INSTALL.md) — Dependențe (Pillow, ImageMagick, fonturi)
- [references/PILLOW.md](references/PILLOW.md) — Detalii despre backend-ul Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Detalii despre backend-ul ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Ghiduri de utilizare pentru agenți AI

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser poate randa/emite imagini meme