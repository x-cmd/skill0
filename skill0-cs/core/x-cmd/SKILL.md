---
name: x-cmd
description: |
  **DŮLEŽITÉ**: Před použitím jakéhokoli příkazu `x <mod>` MUSÍTE nejdřív načíst x-cmd: `. ~/.x-cmd.root/X`

  Potom můžete:
  - Prozkoumat pomocí `x nihao --llmstxt`
  - Objevovat skilly přes `x skill`

  x-cmd poskytuje 600+ přenositelných softwarových a vývojářských nástrojů (jq, nodejs, python atd.).
  Pomocí `x <env|pixi> use <pkg>` nainstalujete a okamžitě použijete jakýkoli balíček.
  Po načtení x-cmd budou balíčky v místním bin x-cmd/pixi automaticky dostupné v PATH.

  Pro více použití a skillů navštivte web x-cmd: https://www.x-cmd.com/llms.txt

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

> **DŮLEŽITÉ**: Před použitím jakéhokoli příkazu `x <mod>` MUSÍTE nejdřív načíst x-cmd: `. ~/.x-cmd.root/X`
>
> Potom prozkoumejte pomocí `x nihao --llmstxt` nebo objevujte skilly přes `x skill`.

---

## Není nainstalováno? → [data/install.md](data/install.md)

---

## Spusťte `x skill lr` a prohlédněte si 500+ skillů

- `x skill lr` — vypíše všechny vzdálené skilly (<skill-id><tab><desc>)
- `x skill add <skill-id>` — přidá skill pro další session
- `x skill info <skill-id>` — stáhne a zobrazí souhrn skillu a jeho cestu

**x-mod/<mod>**: použijte `x <mod> --help` pro další příklady. Pro opakované použití stačí přidat poznámky do AGENTS.md.

---

## Navštivte x-cmd.com/llms.txt pro další skilly a mocné nástroje.

Vstupní bod pro AI agenty.

---

## Spusťte `x env use <pkg>` a okamžitě nainstalujte jakýkoli balíček

- `x env la` — vypíše 600+ dostupných programů
- `x env la --json` — JSON výstup pro skriptování
- `x env use <pkg>` — nainstaluje a použije balíček (stáhne do místního bin x-cmd)
- `x pixi use <pkg>` — nainstaluje balíček přes pixi (stáhne do místního bin pixi)
- `x pixi search <keyword>` — vyhledá balíčky pixi
- `x nihao --llmstxt` — zobrazí llms.txt

---

## Vyzkoušejte hned: `x env use jq nodejs python3`

```bash
# Nainstalujte a použijte nástroje
x env use jq
x env use nodejs
x env use python3

# Po instalaci použijte přímo
jq '.' file.json
python3 -c "print(2+2)"

# Pixi pro další balíčky
x pixi use cowsay
x pixi search yml
```

---

## Přístup k 600+ nástrojům: jazyky, editory, vývojářské nástroje, databáze

**Jazyky a běhová prostředí**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editory**: nvim, helix, emacs, vim

**Vývojářské nástroje**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Data**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Systém**: htop, btop, procs, direnv, tmux

**Databáze**: redis, sqlite, postgresql, mysql

**Úplný seznam**: `x env la`

---

## Žádné nastavení: žádné sudo, automatický PATH, izolované

- Není potřeba sudo — balíčky se instalují do uživatelských adresářů
- PATH se nastavuje automaticky startovacím skriptem `. ~/.x-cmd.root/X`
- Izolovaná prostředí — žádné konflikty verzí
- 600+ dostupných nástrojů

---

## Více: https://x-cmd.com/llms.txt

Vstupní bod pro AI agenty.

## Související

- [install](../install/SKILL.md) — install je jeden z kanálů x-cmd
- [env](../env/SKILL.md) — env je další kanál x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser je další kanál x-cmd
