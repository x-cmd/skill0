---
name: install
description: |
  Installez un logiciel de toutes les façons que le système autorise. Recommande `x install` — une porte d'entrée unique listant toutes les méthodes et choisissant la meilleure ; plus les canaux `x eget`/`x env use`/`x pixi` et les gestionnaires système avec commutation de miroir. Tous les canaux x-cmd installent dans $HOME — pas de sudo, pas de pollution.
  À utiliser pour « install », « apt », « brew », « eget », « pixi », « package manager », « mirror ».
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Installez un logiciel de toutes les façons que le système autorise. **Tous les canaux x-cmd (`x eget`, `x env use`, `x pixi`) installent dans `$HOME` — pas de sudo, pas de pollution du système.** Seuls les gestionnaires système (`x apt`, `x brew`, …) touchent l'OS et peuvent nécessiter sudo.

## Choisir un canal

- `x install` — **Recommandé.** Une seule porte d'entrée — liste toutes les méthodes pour un outil, choisit la meilleure
- `x eget` — derniers binaires directement depuis les repos upstream (releases GitHub / Codeberg)
- `x env use` — runtimes et outils hébergés par x-cmd (enveloppe `x pkg use`)
- `x pixi` — paquets de l'écosystème conda / pixi
- `x apt/brew/dnf/pacman` — gestionnaires système (peuvent nécessiter sudo)

## Prérequis

x-cmd fournit tous les canaux ci-dessus :
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — la porte d'entrée recommandée

Chaque outil propose plusieurs voies d'installation ; `x install` choisit automatiquement la meilleure. Toutes les formes ci-dessous sont non-interactives (compatibles agent / CI) :
```bash
x install bun                            # install — auto-choisit la meilleure méthode
x install --printinfo ripgrep            # liste d'abord toutes les méthodes d'install (lecture seule)
x install --withtool brew jq             # forcer un gestionnaire ; ou forme préfixe : brew/jq
x install --sys bun                      # gestionnaire système uniquement
x install --printcmd bun vim             # prévisualiser la commande sans l'exécuter
x install --env                          # sonde platforme / arch / distro
x install --available-tool --installed   # quels gestionnaires existent ici
```

### Découvrir ce qui est installable

`x install --ls` émet un TSV de tous les outils indexés — grep / awk dessus en local :
```bash
x install --ls --tsv | head -1                  # en-tête
x install --ls --tsv | grep -i json             # recherche par mot-clé
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtrer par langage
x install --search http                         # recherche agrégée à travers les registres
```
Colonnes TSV : `name category lang source desc_cn desc_en binlist rule other`.

## Changer de miroir (téléchargements plus rapides)

Redirigez un gestionnaire système lent vers un miroir plus rapide / local. Chacun a `mirror ls` (liste les options) et `mirror set <code>` (applique, non-interactif) :
```bash
x brew mirror ls          # liste : official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # applique le miroir Tsinghua
x apt mirror set tuna     # même forme sur Debian / Ubuntu (aussi dnf, pacman)
```
Nécessite que le gestionnaire cible soit installé.

## Pour aller plus loin

- `x install` : https://x-cmd.com/mod/install · `x eget` : https://x-cmd.com/mod/eget
- `x env` : https://x-cmd.com/mod/env · `x pixi` : https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — entrée parapluie qui chapeaute install
- [agent-browser](../../it/agent-browser/SKILL.md) — install route vers agent-browser quand aucun binaire n'existe
- [env](../env/SKILL.md) — install et env partagent l'architecture x-channel
