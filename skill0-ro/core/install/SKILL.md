---
name: install
description: |
  Instalează software în orice mod permite sistemul. Recomandă `x install` — o singură ușă frontală care
  listează toate metodele și alege cea mai bună; plus canalele `x eget`/`x env use`/`x pixi` și managerii
  de pachete ai sistemului, cu schimbare de mirror. Toate canalele x-cmd instalează în $HOME — fără sudo, fără poluare.
  Folosește pentru "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Instalează software în orice mod permite sistemul. **Toate canalele x-cmd (`x eget`, `x env use`, `x pixi`) instalează în `$HOME` — fără sudo, fără poluarea sistemului.** Doar managerii de pachete ai sistemului (`x apt`, `x brew`, …) ating sistemul de operare și pot avea nevoie de sudo.

## Alege un canal

- `x install` — **Recomandat.** O singură ușă frontală — listează toate metodele pentru un tool, alege cea mai bună
- `x eget` — Binarele cele mai noi direct din repo-urile upstream (release-uri GitHub / Codeberg)
- `x env use` — Runtime-uri și unelte găzduite de x-cmd (înfășoară `x pkg use`)
- `x pixi` — Pachete conda / din ecosistemul pixi
- `x apt/brew/dnf/pacman` — Manageri de pachete ai sistemului (pot necesita sudo)

## Precondiții

x-cmd oferă fiecare canal de mai sus:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — ușa frontală recomandată

Fiecare tool vine cu mai multe căi de instalare; `x install` alege automat cea mai bună. Toate formele de mai jos sunt neinteractive (safe pentru agent / CI):
```bash
x install bun                            # instalează — alege automat cea mai bună metodă
x install --printinfo ripgrep            # listează mai întâi toate metodele de instalare (read-only)
x install --withtool brew jq             # forțează un manager; sau forma cu prefix: brew/jq
x install --sys bun                      # doar manager de pachete de sistem
x install --printcmd bun vim             # previzualizează comanda, nu o rulează
x install --env                          # sondează platforma / arhitectura / distribuția
x install --available-tool --installed   # ce manageri de pachete există aici
```

### Descoperă ce e instalabil

`x install --ls` emite un TSV cu toate tool-urile indexate — grep / awk pe el offline:
```bash
x install --ls --tsv | head -1                  # antet
x install --ls --tsv | grep -i json             # caută după cuvânt-cheie
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtrează după limbaj
x install --search http                         # căutare agregată între registre
```
Coloanele TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Schimbă mirror-urile (descărcări mai rapide)

Redirecționează un manager de pachete lent către un mirror mai rapid / local. Fiecare are `mirror ls` (listează opțiunile) și `mirror set <code>` (aplică, neinteractiv):
```bash
x brew mirror ls          # listează: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # aplică mirror-ul Tsinghua
x apt mirror set tuna     # aceeași formă pe Debian / Ubuntu (și dnf, pacman)
```
Necesită ca managerul de pachete țintă să fie instalat.

## Pentru mai multe

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — intrare umbrella care deschide ușa spre install
- [agent-browser](../../it/agent-browser/SKILL.md) — install trimitere către agent-browser când nu există binar
- [env](../env/SKILL.md) — install și env împart arhitectura de canale x