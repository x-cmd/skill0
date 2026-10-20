---
name: meme
description: |
  Generowanie obrazów memów przez nakładanie tekstu na szablony.
  Bez barier — działa z Pythonem i Pillow, bez żadnego frameworka.
  Szablony są pobierane na żądanie z repozytorium danych awesome-meme.
  Użyj dla "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Generuj obrazy memów. Ponad 30 szablonów. Bez barier.

Agent AI czyta ten plik i wie, jak robić memy. Nie potrzeba x-cmd.

## Szybki start

```bash
# Zainstaluj zależności
pip install pillow pyyaml

# Wygeneruj mema (automatycznie pobiera szablon z GitHuba)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Więcej przykładów

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opcje

| Opcja | Wartości | Domyślnie | Opis |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend renderowania |
| `--layout` | chest-label, above-head, bottom-label | (domyślne specyfikacji) | Preset umiejscowienia tekstu |
| `--output` | ścieżka pliku | meme_output.jpg | Ścieżka pliku wynikowego |

## Wybór kroju pisma

- Angielski / łaciński — Impact (domyślnie)
- Chiński / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Mieszany — każde miejsce wykrywane niezależnie

Impact nie ma glifów CJK — chiński tekst będzie niewidoczny. Renderer automatycznie wykrywa CJK i wraca do czcionek systemowych. Na Linuksie: `apt install fonts-noto-cjk`.

## Czysty shell (bez Pythona)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Ulepsz za pomocą x-cmd

Jeśli masz zainstalowany x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Ten sam wynik, czystsza integracja z ekosystemem x-cmd.

## Źródło danych

Szablony mieszkają w [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Renderer pobiera specyfikacje i obrazy z GitHuba na żądanie.

## Dokumentacja

- [references/INSTALL.md](references/INSTALL.md) — zależności (Pillow, ImageMagick, czcionki)
- [references/PILLOW.md](references/PILLOW.md) — szczegóły backendu Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — szczegóły backendu ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — wytyczne użycia dla agentów AI

## Powiązane

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser potrafi renderować/wyświetlać obrazy memów