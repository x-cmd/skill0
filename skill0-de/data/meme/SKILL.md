---
name: meme
description: |
  Meme-Bilder erzeugen, indem Text auf Vorlagen gelegt wird.
  Null Hürde — funktioniert mit Python + Pillow, kein Framework nötig.
  Vorlagen werden bei Bedarf aus dem awesome-meme-Daten-Repo geholt.
  Für "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Meme-Bilder erzeugen. 30+ Vorlagen. Null Hürde.

Ein KI-Agent liest diese Datei und weiß, wie man Memes macht. x-cmd wird nicht gebraucht.

## Schnellstart

```bash
# Abhängigkeiten installieren
pip install pillow pyyaml

# Ein Meme erzeugen (lädt die Vorlage automatisch von GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Weitere Beispiele

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Optionen

| Option | Werte | Standard | Beschreibung |
|--------|-------|----------|--------------|
| `--backend` | pillow, magick | pillow | Rendering-Backend |
| `--layout` | chest-label, above-head, bottom-label | (Spec-Default) | Textplatzierungs-Preset |
| `--output` | Dateipfad | meme_output.jpg | Pfad der Ausgabedatei |

## Schriftartauswahl

- Englisch / Latein — Impact (Standard)
- Chinesisch / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Gemischt — jeder Platz wird unabhängig automatisch erkannt

Impact hat keine CJK-Glyphen — chinesischer Text wäre unsichtbar. Der Renderer erkennt CJK automatisch und fällt auf Systemschriften zurück. Auf Linux: `apt install fonts-noto-cjk`.

## Reines Shell (kein Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Aufrüsten mit x-cmd

Wenn du x-cmd installiert hast:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Gleiches Ergebnis, sauberere Integration in das x-cmd-Ökosystem.

## Datenquelle

Die Vorlagen liegen in [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Der Renderer holt Specs und Bilder bei Bedarf von GitHub.

## Docs

- [references/INSTALL.md](references/INSTALL.md) — Abhängigkeiten (Pillow, ImageMagick, Schriften)
- [references/PILLOW.md](references/PILLOW.md) — Details zum Pillow-Backend
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Details zum ImageMagick-Backend
- [references/GUIDELINES.md](references/GUIDELINES.md) — Nutzungsrichtlinien für KI-Agenten

## Verwandt

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser kann Meme-Bilder rendern/ausgeben
