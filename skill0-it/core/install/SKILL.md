---
name: install
description: |
  Installa il software in qualsiasi modo il sistema consenta. Consiglia `x install` — un'unica porta d'ingresso che elenca ogni
  metodo e sceglie il migliore; più i canali `x eget`/`x env use`/`x pixi` e i gestori di pacchetti di sistema
  con cambio mirror. Tutti i canali x-cmd installano in $HOME — niente sudo, nessun inquinamento.
  Usala per "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Installa il software in qualsiasi modo il sistema consenta. **Tutti i canali x-cmd (`x eget`, `x env use`, `x pixi`) installano in `$HOME` — niente sudo, nessun inquinamento di sistema.** Solo i gestori di pacchetti di sistema (`x apt`, `x brew`, …) toccano il sistema operativo e possono richiedere sudo.

## Scegli un canale

- `x install` — **Consigliato.** Un'unica porta d'ingresso — elenca ogni metodo per uno strumento e sceglie il migliore
- `x eget` — Binari più recenti direttamente dai repo upstream (release GitHub / Codeberg)
- `x env use` — Runtime e strumenti ospitati da x-cmd (wrappa `x pkg use`)
- `x pixi` — Pacchetti conda / dell'ecosistema pixi
- `x apt/brew/dnf/pacman` — Gestori di pacchetti di sistema (possono richiedere sudo)

## Prerequisiti

x-cmd fornisce tutti i canali qui sopra:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — la porta d'ingresso consigliata

Ogni strumento offre diversi percorsi di installazione; `x install` sceglie automaticamente il migliore. Tutte le forme qui sotto sono non interattive (sicure per agenti e CI):
```bash
x install bun                            # installa — sceglie automaticamente il metodo migliore
x install --printinfo ripgrep            # elenca prima ogni metodo di installazione (sola lettura)
x install --withtool brew jq             # forza un gestore; oppure forma con prefisso: brew/jq
x install --sys bun                      # solo gestore di pacchetti di sistema
x install --printcmd bun vim             # anteprima il comando, non lo esegue
x install --env                          # rilevamento di piattaforma / architettura / distribuzione
x install --available-tool --installed   # quali gestori di pacchetti esistono qui
```

### Scopri cosa è installabile

`x install --ls` emette un TSV di ogni strumento indicizzato — puoi filtrarlo con grep / awk offline:
```bash
x install --ls --tsv | head -1                  # intestazione
x install --ls --tsv | grep -i json             # ricerca per parola chiave
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtro per linguaggio
x install --search http                         # ricerca aggregata su più registri
```
Colonne TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Cambia i mirror (download più veloci)

Reindirizza un gestore di pacchetti lento verso un mirror più veloce o locale. Ognuno ha `mirror ls` (elenca le opzioni) e `mirror set <code>` (applica, non interattivo):
```bash
x brew mirror ls          # elenca: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # applica il mirror Tsinghua
x apt mirror set tuna     # stessa forma su Debian / Ubuntu (anche dnf, pacman)
```
Richiede che il gestore di pacchetti di destinazione sia installato.

## Per saperne di più

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — voce ombrello che introduce a install
- [agent-browser](../../it/agent-browser/SKILL.md) — install instrada verso agent-browser quando non esiste un binario
- [env](../env/SKILL.md) — install e env condividono l'architettura a canali x