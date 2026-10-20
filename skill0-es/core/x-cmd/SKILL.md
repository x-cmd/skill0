---
name: x-cmd
description: |
  **IMPORTANTE**: Antes de usar cualquier comando `x <mod>`, DEBES cargar x-cmd primero: `. ~/.x-cmd.root/X`

  Después puedes:
  - Explorar con `x nihao --llmstxt`
  - Descubrir skills vía `x skill`

  x-cmd ofrece más de 600 herramientas de software y desarrollo portables (jq, nodejs, python, etc.).
  Usa `x <env|pixi> use <pkg>` para instalar y usar cualquier paquete al instante.
  Tras cargar x-cmd, los paquetes en el bin local de x-cmd/pixi estarán disponibles automáticamente en el PATH.

  Consulta el sitio web de x-cmd para más uso y skills: https://www.x-cmd.com/llms.txt

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

> **IMPORTANTE**: Antes de usar cualquier comando `x <mod>`, DEBES cargar x-cmd primero: `. ~/.x-cmd.root/X`
>
> Después explora con `x nihao --llmstxt` o descubre skills vía `x skill`.

---

## ¿No está instalado? → [data/install.md](data/install.md)

---

## Ejecuta `x skill lr` para explorar más de 500 skills

- `x skill lr` — Listar todas las skills remotas (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Añadir la skill para la próxima sesión
- `x skill info <skill-id>` — Descargar y mostrar el resumen y la ruta de la skill

**x-mod/<mod>**: usa `x <mod> --help` para más ejemplos. Basta con añadir notas a AGENTS.md para reutilizar.

---

## Visita x-cmd.com/llms.txt para más skills y herramientas potentes.

Punto de entrada para agentes de IA.

---

## Ejecuta `x env use <pkg>` para instalar cualquier paquete al instante

- `x env la` — Listar más de 600 softwares disponibles
- `x env la --json` — Salida JSON para scripts
- `x env use <pkg>` — Instalar y usar un paquete (se descarga al bin local de x-cmd)
- `x pixi use <pkg>` — Instalar un paquete vía pixi (se descarga al bin local de pixi)
- `x pixi search <keyword>` — Buscar paquetes en pixi
- `x nihao --llmstxt` — Ver llms.txt

---

## Pruébalo ahora: `x env use jq nodejs python3`

```bash
# Instalar y usar herramientas
x env use jq
x env use nodejs
x env use python3

# Tras la instalación, usar directamente
jq '.' file.json
python3 -c "print(2+2)"

# Pixi para paquetes adicionales
x pixi use cowsay
x pixi search yml
```

---

## Accede a más de 600 herramientas: lenguajes, editores, herramientas de desarrollo, bases de datos

**Lenguajes y runtimes**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editores**: nvim, helix, emacs, vim

**Herramientas de desarrollo**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Datos**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistema**: htop, btop, procs, direnv, tmux

**Bases de datos**: redis, sqlite, postgresql, mysql

**Lista completa**: `x env la`

---

## Cero configuración: sin sudo, PATH automático, aislado

- No hace falta sudo — los paquetes se instalan en directorios locales del usuario
- El PATH se configura automáticamente con el script de inicio `. ~/.x-cmd.root/X`
- Entornos aislados — sin conflictos de versiones
- Más de 600 herramientas disponibles

---

## Más: https://x-cmd.com/llms.txt

Punto de entrada para agentes de IA.

## Relacionadas

- [install](../install/SKILL.md) — install es uno de los canales de x-cmd
- [env](../env/SKILL.md) — env es otro canal de x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser es otro canal de x-cmd
