---
name: env
description: |
  Instalează și gestionează instant pachete software, runtime-uri de limbaj și unelte CLI.
  Fără bariere — instalează x-cmd și obține orice unealtă în secunde. Nu necesită sudo.
  Folosește pentru "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Instalează instant orice software. Fără sudo. Fără poluarea sistemului.

## Quick Start

```bash
# Install x-cmd
eval "$(curl https://get.x-cmd.com)"

# Install Python
x env use python

# Install Node.js
x env use node

# Install CLI tools
x env use jq
x env use fzf

# Try without installing permanently
x env try python3 script.py
```

## Ce e disponibil

600+ pachete, inclusiv:

- Limbaje — python, node, go, bun, java, rust
- Unelte CLI — jq, yq, fzf, himalaya
- Unelte de dezvoltare — claude-code, code-server

## Caracteristici cheie

- **Fără sudo** — se instalează în directorul utilizatorului
- **Management de versiuni** — instalează și comută între versiuni
- **Încearcă înainte de instalare** — `x env try` pentru folosire temporară
- **Curățare** — `x env clean` elimină pachetele nefolosite

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare uzuale de instalare
- Sfaturi de fixare a versiunilor
- Ghiduri de configurare a proiectelor multi-limbaj

## Experiența completă

`x env --help` pentru toate opțiunile, după instalarea x-cmd.

## Related

- [install](../install/SKILL.md) — `x env use` e unul dintre canalele lui install
- [x-cmd](../x-cmd/SKILL.md) — punct de intrare umbrella pentru env