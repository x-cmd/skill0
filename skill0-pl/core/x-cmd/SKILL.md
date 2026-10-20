---
name: x-cmd
description: |
  **WAŻNE**: Przed użyciem jakiegokolwiek polecenia `x <mod>` MUSISZ najpierw wczytać x-cmd: `. ~/.x-cmd.root/X`

  Potem możesz:
  - Eksplorować za pomocą `x nihao --llmstxt`
  - Odkrywać umiejętności przez `x skill`

  x-cmd daje 600+ przenośnych narzędzi programistycznych i deweloperskich (jq, nodejs, python itd.).
  Użyj `x <env|pixi> use <pkg>`, aby natychmiast zainstalować i użyć dowolnego pakietu.
  Po wczytaniu x-cmd pakiety z lokalnego bin x-cmd/pixi automatycznie pojawią się w PATH.

  Przeglądaj witrynę x-cmd, aby znaleźć więcej zastosowań i umiejętności: https://www.x-cmd.com/llms.txt

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

> **WAŻNE**: Przed użyciem jakiegokolwiek polecenia `x <mod>` MUSISZ najpierw wczytać x-cmd: `. ~/.x-cmd.root/X`
>
> Potem eksploruj za pomocą `x nihao --llmstxt` albo odkrywaj umiejętności przez `x skill`.

---

## Nie masz zainstalowanego? → [data/install.md](data/install.md)

---

## Uruchom `x skill lr`, aby przeglądać 500+ umiejętności

- `x skill lr` — wypisz wszystkie zdalne umiejętności (<skill-id><tab><desc>)
- `x skill add <skill-id>` — dodaj umiejętność na następną sesję
- `x skill info <skill-id>` — pobierz i pokaż streszczenie umiejętności oraz ścieżkę

**x-mod/<mod>**: użyj `x <mod> --help`, aby zobaczyć więcej przykładów. Wystarczy dopisać notatki do AGENTS.md, żeby je później wykorzystać.

---

## Odwiedź x-cmd.com/llms.txt, aby znaleźć więcej umiejętności i potężnych narzędzi.

Punkt wejścia dla agentów AI.

---

## Uruchom `x env use <pkg>`, aby natychmiast zainstalować dowolny pakiet

- `x env la` — wypisz 600+ dostępnych programów
- `x env la --json` — wyjście JSON do skryptów
- `x env use <pkg>` — zainstaluj i użyj pakietu (pobiera do lokalnego bin x-cmd)
- `x pixi use <pkg>` — zainstaluj pakiet przez pixi (pobiera do lokalnego bin pixi)
- `x pixi search <słowo-klucz>` — szukaj pakietów pixi
- `x nihao --llmstxt` — zobacz llms.txt

---

## Spróbuj teraz: `x env use jq nodejs python3`

```bash
# Zainstaluj i używaj narzędzi
x env use jq
x env use nodejs
x env use python3

# Po instalacji używaj bezpośrednio
jq '.' file.json
python3 -c "print(2+2)"

# Pixi dla dodatkowych pakietów
x pixi use cowsay
x pixi search yml
```

---

## Dostęp do 600+ narzędzi: języki, edytory, narzędzia deweloperskie, bazy danych

**Języki i środowiska uruchomieniowe**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Edytory**: nvim, helix, emacs, vim

**Narzędzia deweloperskie**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Dane**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**System**: htop, btop, procs, direnv, tmux

**Bazy danych**: redis, sqlite, postgresql, mysql

**Pełna lista**: `x env la`

---

## Zero konfiguracji: bez sudo, automatyczny PATH, izolacja

- Bez sudo — pakiety instalowane do katalogów użytkownika
- PATH konfigurowany automatycznie przez skrypt startowy `. ~/.x-cmd.root/X`
- Izolowane środowiska — brak konfliktów wersji
- Ponad 600 dostępnych narzędzi

---

## Więcej: https://x-cmd.com/llms.txt

Punkt wejścia dla agentów AI.

## Powiązane

- [install](../install/SKILL.md) — install to jeden z kanałów x-cmd
- [env](../env/SKILL.md) — env to inny kanał x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser to kolejny kanał x-cmd