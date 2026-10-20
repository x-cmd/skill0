---
name: env
description: |
  Softwarepakete, Sprach-Runtimes und CLI-Werkzeuge sofort installieren und verwalten.
  Null Hürde — x-cmd installieren und in Sekunden jedes Werkzeug haben. Kein sudo nötig.
  Für "installieren", "Paket", "python", "node", "jq", "Runtime", "Werkzeug".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Jede Software sofort installieren. Kein sudo. Keine Systemverschmutzung.

## Schnellstart

```bash
# x-cmd installieren
eval "$(curl https://get.x-cmd.com)"

# Python installieren
x env use python

# Node.js installieren
x env use node

# CLI-Werkzeuge installieren
x env use jq
x env use fzf

# Ausprobieren, ohne dauerhaft zu installieren
x env try python3 script.py
```

## Was verfügbar ist

600+ Pakete, darunter:

- Sprachen — python, node, go, bun, java, rust
- CLI-Werkzeuge — jq, yq, fzf, himalaya
- Dev-Werkzeuge — claude-code, code-server

## Kernfunktionen

- **Kein sudo** — Installation ins Benutzerverzeichnis
- **Versionsverwaltung** — Versionen installieren und wechseln
- **Vor der Installation ausprobieren** — `x env try` zur temporären Nutzung
- **Aufräumen** — `x env clean` entfernt ungenutzte Pakete

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Häufige Installationsmuster
- Tipps zum Pinnen von Versionen
- Anleitungen für Multi-Sprachen-Projekt-Setups

## Volles Erlebnis

`x env --help` für alle Optionen, nachdem x-cmd installiert ist.

## Verwandt

- [install](../install/SKILL.md) — x env use ist einer der Kanäle von install
- [x-cmd](../x-cmd/SKILL.md) — übergeordneter Einstiegspunkt für env
