---
name: meme
description: |
  Gere imagens de meme sobrepondo texto em templates.
  Zero barreira — funciona com Python + Pillow, sem precisar de nenhum framework.
  Os templates são baixados sob demanda do repo de dados awesome-meme.
  Use para "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Gere imagens de meme. Mais de 30 templates. Zero barreira.

Um agente de IA que lê este arquivo já sabe fazer memes. Não precisa do x-cmd.

## Início rápido

```bash
# Instale as dependências
pip install pillow pyyaml

# Gere um meme (baixa o template automaticamente do GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Mais exemplos

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Opções

| Opção | Valores | Padrão | Descrição |
|-------|---------|--------|-----------|
| `--backend` | pillow, magick | pillow | Backend de renderização |
| `--layout` | chest-label, above-head, bottom-label | (padrão do spec) | Preset de posicionamento do texto |
| `--output` | caminho do arquivo | meme_output.jpg | Caminho do arquivo de saída |

## Escolha de fonte

- Inglês / latim — Impact (padrão)
- Chinês / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Misto — cada slot é detectado automaticamente de forma independente

A Impact não tem glifos CJK — o texto em chinês ficaria invisível. O renderizador detecta o CJK automaticamente e recorre às fontes do sistema. No Linux: `apt install fonts-noto-cjk`.

## Shell puro (sem Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Upgrade com x-cmd

Se você já tem o x-cmd instalado:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Mesmo resultado, com uma integração mais limpa ao ecossistema x-cmd.

## Fonte de dados

Os templates ficam no [awesome-meme](https://github.com/edwinjhlee/awesome-meme). O renderizador busca as specs e as imagens no GitHub sob demanda.

## Documentação

- [references/INSTALL.md](references/INSTALL.md) — Dependências (Pillow, ImageMagick, fontes)
- [references/PILLOW.md](references/PILLOW.md) — Detalhes do backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Detalhes do backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Diretrizes de uso para agentes de IA

## Relacionados

- [agent-browser](../../it/agent-browser/SKILL.md) — o agent-browser consegue renderizar/gerar imagens de meme