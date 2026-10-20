---
name: tldr
description: |
  Befehlsreferenz mit praktischen Beispielen aus dem tldr-pages-Projekt.
  Null Hürde — mit x-cmd, curl oder einem beliebigen tldr-Client verwenden.
  Für "tldr", "Spickzettel", "Befehlshilfe", "Beispiele", "wie".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Schnelle Befehlsreferenz mit Beispielen aus der echten Welt. Besser als Manpages für die Frage "wie benutze ich diesen Befehl?"

## Schnellstart

```bash
# Mit x-cmd
x tldr git                    # Git-Nutzungsbeispiele
x tldr --lang zh python       # Chinesische Doku
x tldr --fz                   # Interaktive Suche

# Ohne x-cmd — curl verwenden
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Oder einen tldr-Client installieren
pip install tldr
npm install -g tldr
tldr tar
```

## Was verfügbar ist

- `x tldr <cmd>` — Beispiele für einen Befehl anzeigen
- `x tldr --lang zh <cmd>` — chinesische Sprache
- `x tldr --fz` — interaktive fzf-Suche
- `x tldr --cat <cmd>` — rohe Markdown-Anzeige
- `x tldr --ls` — alle verfügbaren Befehle auflisten
- `x tldr --update` — Seiten-Cache aktualisieren

## Eigenständige Alternativen

- Online: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Rohseiten: github.com/tldr-pages/tldr

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Häufige Befehlsmuster
- Plattformspezifische Hinweise
- Integration in Agenten-Workflows

## Verwandt

- [git](../git/SKILL.md) — tldr der häufig genutzten git-Unterbefehle
- [install](../install/SKILL.md) — tldr der install-Unterbefehle
