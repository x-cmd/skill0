---
name: install
description: |
  Instala software por cualquier vía que permita el sistema. Recomienda `x install` — una única puerta de entrada que lista todos
  los métodos y elige el mejor; además los canales `x eget`/`x env use`/`x pixi` y los gestores de paquetes del sistema
  con cambio de espejo. Todos los canales de x-cmd instalan en $HOME — sin sudo, sin contaminación.
  Úsalo para "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Instala software por cualquier vía que permita el sistema. **Todos los canales de x-cmd (`x eget`, `x env use`, `x pixi`) instalan en `$HOME` — sin sudo, sin contaminación del sistema.** Solo los gestores de paquetes del sistema (`x apt`, `x brew`, …) tocan el SO y pueden necesitar sudo.

## Elige un canal

- `x install` — **Recomendado.** Una única puerta de entrada: lista todos los métodos de una herramienta y elige el mejor
- `x eget` — Binarios más recientes directamente de los repos upstream (releases de GitHub / Codeberg)
- `x env use` — Runtimes y herramientas alojados por x-cmd (envuelve `x pkg use`)
- `x pixi` — paquetes de conda / del ecosistema pixi
- `x apt/brew/dnf/pacman` — Gestores de paquetes del sistema (pueden necesitar sudo)

## Requisitos previos

x-cmd te da todos los canales anteriores:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — la puerta de entrada recomendada

Cada herramienta incluye varias vías de instalación; `x install` elige automáticamente la mejor. Todas las formas siguientes son no interactivas (seguras para agente / CI):
```bash
x install bun                            # instalar: elige el mejor método automáticamente
x install --printinfo ripgrep            # listar antes todos los métodos de instalación (solo lectura)
x install --withtool brew jq             # forzar un gestor; o forma con prefijo: brew/jq
x install --sys bun                      # solo gestores de paquetes del sistema
x install --printcmd bun vim             # previsualizar el comando, no ejecutarlo
x install --env                          # detección de plataforma / arquitectura / distribución
x install --available-tool --installed   # qué gestores de paquetes existen aquí
```

### Descubre qué se puede instalar

`x install --ls` emite un TSV de todas las herramientas indexadas — búscalo con grep / awk sin conexión:
```bash
x install --ls --tsv | head -1                  # cabecera
x install --ls --tsv | grep -i json             # buscar por palabra clave
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtrar por lenguaje
x install --search http                         # búsqueda agregada entre registros
```
Columnas del TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Cambia de espejo (descargas más rápidas)

Redirige un gestor del sistema lento hacia un espejo más rápido / local. Cada uno tiene `mirror ls` (listar opciones) y `mirror set <code>` (aplicar, no interactivo):
```bash
x brew mirror ls          # listar: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # aplicar el espejo de Tsinghua
x apt mirror set tuna     # misma forma en Debian / Ubuntu (también dnf, pacman)
```
Requiere que el gestor de paquetes de destino esté instalado.

## Para saber más

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Relacionadas

- [x-cmd](../x-cmd/SKILL.md) — entrada paraguas que da frente a install
- [agent-browser](../../it/agent-browser/SKILL.md) — install recurre a agent-browser cuando no existe binario
- [env](../env/SKILL.md) — install y env comparten la arquitectura de canales de x
