---
name: install
description: |
  Software auf jede Weise installieren, die das System erlaubt. Empfohlen wird `x install` — eine einzige
  Eingangstür, die alle Methoden auflistet und die beste auswählt; dazu die Kanäle `x eget`/`x env use`/`x pixi`
  sowie System-Paketmanager mit Mirror-Umschaltung. Alle x-cmd-Kanäle installieren in $HOME — kein sudo, keine Verschmutzung.
  verwenden für "installieren", "apt", "brew", "eget", "pixi", "Paketmanager", "Mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Software auf jede Weise installieren, die das System erlaubt. **Alle x-cmd-Kanäle (`x eget`, `x env use`, `x pixi`) installieren in `$HOME` — kein sudo, keine Systemverschmutzung.** Nur System-Paketmanager (`x apt`, `x brew`, …) fassen das Betriebssystem an und brauchen eventuell sudo.

## Einen Kanal wählen

- `x install` — **Empfohlen.** Eine Eingangstür — listet alle Methoden für ein Werkzeug auf, wählt die beste
- `x eget` — aktuelle Binaries direkt aus den Upstream-Repos (GitHub / Codeberg Releases)
- `x env use` — Runtimes & Werkzeuge, die x-cmd hostet (umschließt `x pkg use`)
- `x pixi` — conda / pixi-Ökosystem-Pakete
- `x apt/brew/dnf/pacman` — System-Paketmanager (können sudo brauchen)

## Voraussetzungen

x-cmd liefert jeden der obigen Kanäle mit:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — die empfohlene Eingangstür

Jedes Werkzeug bringt mehrere Installationswege mit; `x install` wählt automatisch den besten. Alle folgenden Formen sind nicht-interaktiv (agenten-/CI-sicher):
```bash
x install bun                            # installieren — wählt automatisch die beste Methode
x install --printinfo ripgrep            # zuerst alle Installationsmethoden auflisten (nur lesend)
x install --withtool brew jq             # einen Manager erzwingen; oder Präfix-Form: brew/jq
x install --sys bun                      # nur System-Paketmanager
x install --printcmd bun vim             # Befehl ansehen, nicht ausführen
x install --env                          # Plattform / Arch / Distro abfragen
x install --available-tool --installed   # welche Paketmanager es hier gibt
```

### Herausfinden, was installierbar ist

`x install --ls` gibt ein TSV aller indizierten Werkzeuge aus — offline greppen / mit awk filtern:
```bash
x install --ls --tsv | head -1                  # Kopfzeile
x install --ls --tsv | grep -i json             # nach Stichwort suchen
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # nach Sprache filtern
x install --search http                         # aggregierte Suche über die Registries
```
TSV-Spalten: `name category lang source desc_cn desc_en binlist rule other`.

## Mirrors wechseln (schnellere Downloads)

Einen langsamen System-Paketmanager auf einen schnelleren / lokalen Mirror umleiten. Jeder hat `mirror ls` (Optionen auflisten) und `mirror set <code>` (anwenden, nicht-interaktiv):
```bash
x brew mirror ls          # auflisten: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # Tsinghua-Mirror anwenden
x apt mirror set tuna     # gleiche Form auf Debian / Ubuntu (auch dnf, pacman)
```
Erfordert, dass der Ziel-Paketmanager installiert ist.

## Mehr dazu

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Verwandt

- [x-cmd](../x-cmd/SKILL.md) — übergeordneter Einstieg, vor dem install steht
- [agent-browser](../../it/agent-browser/SKILL.md) — install leitet zu agent-browser weiter, wenn es keine Binary gibt
- [env](../env/SKILL.md) — install und env teilen sich die x-Kanal-Architektur
