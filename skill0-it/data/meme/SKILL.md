---
name: meme
description: |
  Genera immagini meme sovrapponendo del testo ai template.
  Zero barriere — funziona con Python + Pillow, serve nessun framework.
  I template vengono scaricati su richiesta dal repo dati awesome-meme.
  Usala per "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Genera immagini meme. Oltre 30 template. Zero barriere.

Un agente AI che legge questo file sa come fare i meme. Non serve x-cmd.

## Guida rapida

```bash
# Installa le dipendenze
pip install pillow pyyaml

# Genera un meme (scarica automaticamente il template da GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Altri esempi

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opzioni

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend di rendering |
| `--layout` | chest-label, above-head, bottom-label | (spec default) | Preset per il posizionamento del testo |
| `--output` | file path | meme_output.jpg | Percorso del file di output |

## Scelta dei font

- Inglese / Latino — Impact (predefinito)
- Cinese / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Misto — ogni slot viene rilevato automaticamente e in modo indipendente

Impact non ha glifi CJK — il testo cinese risulterebbe invisibile. Il renderer rileva automaticamente il CJK e ricade sui font di sistema. Su Linux: `apt install fonts-noto-cjk`.

## Solo shell (senza Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Upgrade con x-cmd

Se hai x-cmd installato:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Stesso risultato, integrazione più pulita con l'ecosistema x-cmd.

## Sorgente dei dati

I template si trovano in [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Il renderer scarica spec e immagini da GitHub su richiesta.

## Documentazione

- [references/INSTALL.md](references/INSTALL.md) — Dipendenze (Pillow, ImageMagick, font)
- [references/PILLOW.md](references/PILLOW.md) — Dettagli del backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Dettagli del backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Linee guida d'uso per gli agenti AI

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser può rendere o produrre immagini meme