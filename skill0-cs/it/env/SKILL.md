---
name: env
description: |
  Okamžitá instalace a správa softwarových balíčků, jazykových runtime a CLI nástrojů.
  Bez jakýchkoli překážek — nainstalujte x-cmd a získejte libovolný nástroj během sekund. Bez sudo.
  Použijte pro "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Nainstalujte jakýkoli software okamžitě. Bez sudo. Bez znečištění systému.

## Rychlý start

```bash
# Nainstalovat x-cmd
eval "$(curl https://get.x-cmd.com)"

# Nainstalovat Python
x env use python

# Nainstalovat Node.js
x env use node

# Nainstalovat CLI nástroje
x env use jq
x env use fzf

# Vyzkoušet bez trvalé instalace
x env try python3 script.py
```

## Co je k dispozici

600+ balíčků včetně:

- Jazyky — python, node, go, bun, java, rust
- CLI nástroje — jq, yq, fzf, himalaya
- Vývojářské nástroje — claude-code, code-server

## Klíčové funkce

- **Bez sudo** — instaluje do uživatelského adresáře
- **Správa verzí** — instalace a přepínání verzí
- **Vyzkoušet před instalací** — `x env try` pro dočasné použití
- **Čištění** — `x env clean` odstraní nepoužívané balíčky

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Běžné instalační vzory
- Tipy na připnutí verzí
- Návody na nastavení vícejazyčných projektů

## Plné možnosti

`x env --help` pro všechny možnosti po instalaci x-cmd.

## Související

- [install](../install/SKILL.md) — x env use je jedním z kanálů install
- [x-cmd](../x-cmd/SKILL.md) — zastřešující vstupní bod pro env
