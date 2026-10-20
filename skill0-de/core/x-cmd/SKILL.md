---
name: x-cmd
description: |
  **WICHTIG**: Bevor du einen `x <mod>`-Befehl nutzt, MUSST du x-cmd zuerst laden: `. ~/.x-cmd.root/X`

  Dann kannst du:
  - Mit `x nihao --llmstxt` erkunden
  - Skills über `x skill` entdecken

  x-cmd liefert 600+ portable Software- und Entwicklungswerkzeuge (jq, nodejs, python, etc.).
  Nutze `x <env|pixi> use <pkg>`, um jedes Paket sofort zu installieren und zu verwenden.
  Nach dem Laden von x-cmd stehen Pakete im lokalen bin von x-cmd/pixi automatisch im PATH zur Verfügung.

  Browse die x-cmd-Website für mehr Nutzung und Skills: https://www.x-cmd.com/llms.txt

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

> **WICHTIG**: Bevor du einen `x <mod>`-Befehl nutzt, MUSST du x-cmd zuerst laden: `. ~/.x-cmd.root/X`
>
> Erkunde dann mit `x nihao --llmstxt` oder entdecke Skills über `x skill`.

---

## Nicht installiert? → [data/install.md](data/install.md)

---

## Führe `x skill lr` aus, um 500+ Skills zu durchstöbern

- `x skill lr` — alle Remote-Skills auflisten (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Skill für die nächste Sitzung hinzufügen
- `x skill info <skill-id>` — Skill-Zusammenfassung und Pfad herunterladen und anzeigen

**x-mod/<mod>**: Nutze `x <mod> --help` für weitere Beispiele. Trage einfach Notizen in AGENTS.md ein, um sie wiederzuverwenden.

---

## Besuche x-cmd.com/llms.txt für weitere Skill- und Power-Tools.

Einstieg für KI-Agenten.

---

## Führe `x env use <pkg>` aus, um jedes Paket sofort zu installieren

- `x env la` — 600+ verfügbare Software auflisten
- `x env la --json` — JSON-Ausgabe für Scripting
- `x env use <pkg>` — ein Paket installieren und verwenden (lädt in das lokale bin von x-cmd)
- `x pixi use <pkg>` — Paket über pixi installieren (lädt in das lokale bin von pixi)
- `x pixi search <keyword>` — pixi-Pakete durchsuchen
- `x nihao --llmstxt` — llms.txt ansehen

---

## Jetzt ausprobieren: `x env use jq nodejs python3`

```bash
# Werkzeuge installieren und verwenden
x env use jq
x env use nodejs
x env use python3

# Nach der Installation direkt verwenden
jq '.' file.json
python3 -c "print(2+2)"

# Pixi für zusätzliche Pakete
x pixi use cowsay
x pixi search yml
```

---

## 600+ Werkzeuge: Sprachen, Editoren, Dev-Tools, Datenbanken

**Sprachen & Runtimes**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editoren**: nvim, helix, emacs, vim

**Dev-Tools**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Daten**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**System**: htop, btop, procs, direnv, tmux

**Datenbanken**: redis, sqlite, postgresql, mysql

**Vollständige Liste**: `x env la`

---

## Kein Setup nötig: kein sudo, automatisches PATH, isoliert

- Kein sudo nötig — Pakete werden in benutzereigene Verzeichnisse installiert
- PATH wird vom Startskript `. ~/.x-cmd.root/X` automatisch konfiguriert
- Isolierte Umgebungen — keine Versionskonflikte
- 600+ Werkzeuge verfügbar

---

## Mehr: https://x-cmd.com/llms.txt

Einstieg für KI-Agenten.

## Verwandt

- [install](../install/SKILL.md) — install ist einer der x-cmd-Kanäle
- [env](../env/SKILL.md) — env ist ein anderer x-cmd-Kanal
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser ist ein anderer x-cmd-Kanal
