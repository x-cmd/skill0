---
name: tldr
description: |
  Referencia de comandos con ejemplos prácticos del proyecto tldr-pages.
  Sin barreras — úsalo con x-cmd, curl, o cualquier cliente tldr.
  Úsalo para "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Referencia rápida de comandos con ejemplos del mundo real. Mejor que las páginas de man para "¿cómo uso este comando?".

## Inicio rápido

```bash
# Con x-cmd
x tldr git                    # Ejemplos de uso de Git
x tldr --lang zh python       # Documentación en chino
x tldr --fz                   # Búsqueda interactiva

# Sin x-cmd — usa curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# O instala un cliente tldr
pip install tldr
npm install -g tldr
tldr tar
```

## Qué hay disponible

- `x tldr <cmd>` — Mostrar ejemplos de un comando
- `x tldr --lang zh <cmd>` — En chino
- `x tldr --fz` — Búsqueda interactiva con fzf
- `x tldr --cat <cmd>` — Mostrar el markdown en bruto
- `x tldr --ls` — Listar todos los comandos disponibles
- `x tldr --update` — Actualizar la caché de páginas

## Alternativas autónomas

- En línea: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Páginas en bruto: github.com/tldr-pages/tldr

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones comunes de comandos
- Notas específicas de plataforma
- Integración con flujos de trabajo de agentes

## Relacionadas

- [git](../git/SKILL.md) — tldr de los subcomandos de git de uso habitual
- [install](../install/SKILL.md) — tldr de los subcomandos de install
