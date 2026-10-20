---
name: env
description: |
  Instala y gestiona al instante paquetes de software, runtimes de lenguajes y herramientas CLI.
  Sin barreras — instala x-cmd y consigue cualquier herramienta en segundos. No requiere sudo.
  Úsalo para "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Instala cualquier software al instante. Sin sudo. Sin contaminación del sistema.

## Inicio rápido

```bash
# Instala x-cmd
eval "$(curl https://get.x-cmd.com)"

# Instala Python
x env use python

# Instala Node.js
x env use node

# Instala herramientas CLI
x env use jq
x env use fzf

# Prueba sin instalar de forma permanente
x env try python3 script.py
```

## Qué hay disponible

Más de 600 paquetes, entre ellos:

- Lenguajes — python, node, go, bun, java, rust
- Herramientas CLI — jq, yq, fzf, himalaya
- Herramientas de desarrollo — claude-code, code-server

## Características clave

- **Sin sudo** — instala en el directorio del usuario
- **Gestión de versiones** — instala y cambia de versión
- **Probar antes de instalar** — `x env try` para uso temporal
- **Limpieza** — `x env clean` elimina los paquetes sin usar

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones comunes de instalación
- Consejos para fijar versiones
- Guías de configuración de proyectos multilinguaje

## Experiencia completa

`x env --help` para todas las opciones tras instalar x-cmd.

## Relacionadas

- [install](../install/SKILL.md) — x env use es uno de los canales de install
- [x-cmd](../x-cmd/SKILL.md) — punto de entrada paraguas de env
