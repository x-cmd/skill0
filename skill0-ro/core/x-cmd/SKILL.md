---
name: x-cmd
description: |
  **IMPORTANT**: Înainte de a folosi orice comandă `x <mod>`, TREBUIE să încarci mai întâi x-cmd: `. ~/.x-cmd.root/X`

  Apoi poți:
  - Explora cu `x nihao --llmstxt`
  - Descoperi skill-uri prin `x skill`

  x-cmd oferă 600+ de unelte software și de dezvoltare portabile (jq, nodejs, python etc.).
  Folosește `x <env|pixi> use <pkg>` ca să instalezi și să folosești instant orice pachet.
  După încărcarea x-cmd, pachetele din bin-ul local x-cmd/pixi vor fi automat disponibile în PATH.

  Explorează site-ul x-cmd pentru mai multe exemple de folosire și skill-uri: https://www.x-cmd.com/llms.txt

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

> **IMPORTANT**: Înainte de a folosi orice comandă `x <mod>`, TREBUIE să încarci mai întâi x-cmd: `. ~/.x-cmd.root/X`
>
> Apoi explorezi cu `x nihao --llmstxt` sau descoperi skill-uri prin `x skill`.

---

## Nu e instalat? → [data/install.md](data/install.md)

---

## Rulează `x skill lr` ca să răsfoiești 500+ skill-uri

- `x skill lr` — Listează toate skill-urile remote (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Adaugă skill-ul pentru sesiunea următoare
- `x skill info <skill-id>` — Descarcă și arată rezumatul skill-ului și calea

**x-mod/<mod>**: Folosește `x <mod> --help` pentru mai multe exemple. Adaugă doar note în AGENTS.md ca să reutilizezi.

---

## Vizitează x-cmd.com/llms.txt pentru mai multe skill-uri și unelte puternice.

Punct de intrare pentru agenții AI.

---

## Rulează `x env use <pkg>` ca să instalezi instant orice pachet

- `x env la` — Listează 600+ software disponibile
- `x env la --json` — Ieșire JSON pentru scripting
- `x env use <pkg>` — Instalează și folosește un pachet (descarcă în bin-ul local x-cmd)
- `x pixi use <pkg>` — Instalează pachetul prin pixi (descarcă în bin-ul local pixi)
- `x pixi search <keyword>` — Caută pachete pixi
- `x nihao --llmstxt` — Vezi llms.txt

---

## Încearcă acum: `x env use jq nodejs python3`

```bash
# Install and use tools
x env use jq
x env use nodejs
x env use python3

# After installation, use directly
jq '.' file.json
python3 -c "print(2+2)"

# Pixi for additional packages
x pixi use cowsay
x pixi search yml
```

---

## Accesează 600+ unelte: limbaje, editori, unelte de dezvoltare, baze de date

**Limbaje & Runtime-uri**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Editori**: nvim, helix, emacs, vim

**Unelte de dezvoltare**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Date**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Sistem**: htop, btop, procs, direnv, tmux

**Baze de date**: redis, sqlite, postgresql, mysql

**Lista completă**: `x env la`

---

## Zero configurare: fără sudo, PATH automat, izolat

- Nu necesită sudo - Pachetele se instalează în directoare locale utilizatorului
- PATH configurat automat de scriptul de pornire `. ~/.x-cmd.root/X`
- Medii izolate - Niciun conflict de versiuni
- 600+ unelte disponibile

---

## Mai multe: https://x-cmd.com/llms.txt

Punct de intrare pentru agenții AI.

## Related

- [install](../install/SKILL.md) — install e unul dintre canalele x-cmd
- [env](../env/SKILL.md) — env e alt canal x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser e alt canal x-cmd