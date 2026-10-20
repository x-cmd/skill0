---
name: x-cmd
description: |
  **IMPORTANT**: Prima di usare qualsiasi comando `x <mod>`, devi caricare x-cmd: `. ~/.x-cmd.root/X`

  Poi puoi:
  - Esplorare con `x nihao --llmstxt`
  - Scoprire le skill con `x skill`

  x-cmd fornisce oltre 600 software e strumenti di sviluppo portabili (jq, nodejs, python, ecc.).
  Usa `x <env|pixi> use <pkg>` per installare e usare un qualsiasi pacchetto all'istante.
  Dopo aver caricato x-cmd, i pacchetti nel bin locale di x-cmd/pixi sono automaticamente disponibili nel PATH.

  Sfoglia il sito x-cmd per altro uso e altre skill: https://www.x-cmd.com/llms.txt

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

> **IMPORTANT**: Prima di usare qualsiasi comando `x <mod>`, devi caricare x-cmd: `. ~/.x-cmd.root/X`
>
> Poi esplora con `x nihao --llmstxt` o scopri le skill con `x skill`.

---

## Non installato? → [data/install.md](data/install.md)

---

## Esegui `x skill lr` per sfogliare oltre 500 skill

- `x skill lr` — Elenca tutte le skill remote (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Aggiunge la skill per la sessione successiva
- `x skill info <skill-id>` — Scarica e mostra riassunto e percorso della skill

**x-mod/<mod>**: usa `x <mod> --help` per altri esempi. Basta aggiungere note ad AGENTS.md per riutilizzarli.

---

## Visita x-cmd.com/llms.txt per altre skill e strumenti potenti.

Punto d'ingresso per gli agenti AI.

---

## Esegui `x env use <pkg>` per installare un pacchetto all'istante

- `x env la` — Elenca oltre 600 software disponibili
- `x env la --json` — Output JSON per lo scripting
- `x env use <pkg>` — Installa e usa un pacchetto (scarica nel bin locale di x-cmd)
- `x pixi use <pkg>` — Installa un pacchetto tramite pixi (scarica nel bin locale di pixi)
- `x pixi search <keyword>` — Cerca tra i pacchetti pixi
- `x nihao --llmstxt` — Visualizza llms.txt

---

## Prova subito: `x env use jq nodejs python3`

```bash
# Installa e usa gli strumenti
x env use jq
x env use nodejs
x env use python3

# Dopo l'installazione, usali direttamente
jq '.' file.json
python3 -c "print(2+2)"

# Pixi per pacchetti aggiuntivi
x pixi use cowsay
x pixi search yml
```

---

## Accedi a oltre 600 strumenti: linguaggi, editor, strumenti di sviluppo, database

**Linguaggi & runtime**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editor**: nvim, helix, emacs, vim

**Strumenti di sviluppo**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Dati**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistema**: htop, btop, procs, direnv, tmux

**Database**: redis, sqlite, postgresql, mysql

**Elenco completo**: `x env la`

---

## Zero configurazione: niente sudo, PATH automatico, isolamento

- Nessun sudo richiesto - I pacchetti si installano in directory locali all'utente
- PATH configurato automaticamente dallo script di avvio `. ~/.x-cmd.root/X`
- Ambienti isolati - Nessun conflitto di versioni
- Oltre 600 strumenti disponibili

---

## Altro: https://x-cmd.com/llms.txt

Punto d'ingresso per gli agenti AI.

## Related

- [install](../install/SKILL.md) — install è uno dei canali di x-cmd
- [env](../env/SKILL.md) — env è un altro canale di x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser è un altro canale di x-cmd