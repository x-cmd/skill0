---
name: meme
description: |
  Generování meme obrázků překrýváním textu na šablony.
  Žádná bariéra — funguje s Pythonem + Pillow, není potřeba žádný framework.
  Šablony se načítají na vyžádání z datového repozitáře awesome-meme.
  Použij pro "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Generování meme obrázků. 30+ šablon. Žádná bariéra.

AI agent si přečte tento soubor a umí vytvářet memy. Není potřeba x-cmd.

## Rychlý start

```bash
# Nainstaluj závislosti
pip install pillow pyyaml

# Vygeneruj meme (šablona se automaticky stáhne z GitHubu)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Další příklady

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Možnosti

| Možnost | Hodnoty | Výchozí | Popis |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend vykreslování |
| `--layout` | chest-label, above-head, bottom-label | (výchozí ze spec) | Předvolba umístění textu |
| `--output` | cesta k souboru | meme_output.jpg | cesta k výstupnímu souboru |

## Výběr fontu

- Angličtina / latinka — Impact (výchozí)
- Čínština / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Smíšené — každý slot se automaticky detekuje nezávisle

Impact nemá CJK glyfy — čínský text bude neviditelný. Vykreslovadlo automaticky detekuje CJK a přepadne na systémové fonty. Na Linuxu: `apt install fonts-noto-cjk`.

## Čistý shell (bez Pythonu)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Vylepšení s x-cmd

Pokud máš nainstalovaný x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Stejný výsledek, čistší integrace s ekosystémem x-cmd.

## Zdroj dat

Šablony žijí v [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Vykreslovadlo načítá specifikace a obrázky z GitHubu na vyžádání.

## Dokumentace

- [references/INSTALL.md](references/INSTALL.md) — Závislosti (Pillow, ImageMagick, fonty)
- [references/PILLOW.md](references/PILLOW.md) — Podrobnosti backendu Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Podrobnosti backendu ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Pokyny pro použití AI agenty

## Související

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser umí vykreslit či exportovat meme obrázky
