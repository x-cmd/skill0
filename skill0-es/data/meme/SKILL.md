---
name: meme
description: |
  Genera imágenes de meme superponiendo texto sobre plantillas.
  Sin barreras — funciona con Python + Pillow, sin necesidad de framework.
  Las plantillas se descargan bajo demanda del repo de datos awesome-meme.
  Úsalo para "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Genera imágenes de meme. Más de 30 plantillas. Sin barreras.

Un agente de IA lee este archivo y sabe hacer memes. No hace falta x-cmd.

## Inicio rápido

```bash
# Instala las dependencias
pip install pillow pyyaml

# Genera un meme (descarga la plantilla de GitHub automáticamente)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Más ejemplos

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opciones

| Opción | Valores | Por defecto | Descripción |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend de renderizado |
| `--layout` | chest-label, above-head, bottom-label | (por defecto de la spec) | Preset de colocación del texto |
| `--output` | ruta de archivo | meme_output.jpg | Ruta del archivo de salida |

## Selección de fuente

- Inglés / latín — Impact (por defecto)
- Chino / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Mixto — cada hueco se detecta de forma independiente

Impact no tiene glifos CJK — el texto chino será invisible. El renderizador detecta CJK automáticamente y recurre a las fuentes del sistema. En Linux: `apt install fonts-noto-cjk`.

## Shell puro (sin Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Mejora con x-cmd

Si tienes x-cmd instalado:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Mismo resultado, integración más limpia con el ecosistema x-cmd.

## Fuente de datos

Las plantillas viven en [awesome-meme](https://github.com/edwinjhlee/awesome-meme). El renderizador descarga las specs y las imágenes de GitHub bajo demanda.

## Documentación

- [references/INSTALL.md](references/INSTALL.md) — dependencias (Pillow, ImageMagick, fuentes)
- [references/PILLOW.md](references/PILLOW.md) — detalles del backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — detalles del backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — directrices de uso para agentes de IA

## Relacionadas

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser puede renderizar y sacar imágenes de meme
