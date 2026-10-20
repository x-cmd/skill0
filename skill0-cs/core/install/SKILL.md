---
name: install
description: |
  Nainstaluj software jakoukoli cestou, kterou systém dovolí. Doporučuje `x install` — jeden přední vchod,
  který vypíše všechny metody a vybere nejlepší; plus kanály `x eget`/`x env use`/`x pixi` a systémové
  správce balíčků se změnou zrcadel. Všechny kanály x-cmd instalují do $HOME — žádné sudo, žádné znečištění.
  Použij pro "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Nainstaluj software jakoukoli cestou, kterou systém dovolí. **Všechny kanály x-cmd (`x eget`, `x env use`, `x pixi`) instalují do `$HOME` — žádné sudo, žádné znečištění systému.** Pouze systémoví správci balíčků (`x apt`, `x brew`, …) sahají na OS a mohou potřebovat sudo.

## Vyberte si kanál

- `x install` — **Doporučeno.** Jeden přední vchod — vypíše všechny metody pro daný nástroj, vybere nejlepší
- `x eget` — nejnovější binárky přímo z upstream repozitářů (releases z GitHub / Codeberg)
- `x env use` — runtimes a nástroje hostované x-cmd (zastřešuje `x pkg use`)
- `x pixi` — balíčky conda / ekosystému pixi
- `x apt/brew/dnf/pacman` — systémoví správci balíčků (mohou potřebovat sudo)

## Předpoklady

x-cmd poskytuje všechny kanály výše:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — doporučený přední vchod

Každý nástroj má několik instalačních cest; `x install` automaticky vybere nejlepší. Všechny níže uvedené formy jsou neinteraktivní (bezpečné pro agenta / CI):
```bash
x install bun                            # instalace — automaticky vybere nejlepší metodu
x install --printinfo ripgrep            # nejdřív vypíše všechny instalační metody (jen čtení)
x install --withtool brew jq             # vynutí správce; nebo forma s předponou: brew/jq
x install --sys bun                      # jen systémový správce balíčků
x install --printcmd bun vim             # zobrazí příkaz, nespustí ho
x install --env                          # zjištění platformy / architektury / distribuce
x install --available-tool --installed   # kteří správci balíčků tu existují
```

### Zjistěte, co lze nainstalovat

`x install --ls` vypíše TSV všech indexovaných nástrojů — grepuj / awkuj offline:
```bash
x install --ls --tsv | head -1                  # hlavička
x install --ls --tsv | grep -i json             # hledání podle klíčového slova
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtr podle jazyka
x install --search http                         # agregované hledání napříč registry
```
Sloupce TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Změna zrcadel (rychlejší stahování)

Přesměruj pomalého systémového správce balíčků na rychlejší / lokální zrcadlo. Každý má `mirror ls` (výpis možností) a `mirror set <code>` (provedení, neinteraktivní):
```bash
x brew mirror ls          # výpis: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # použije zrcadlo Tsinghua
x apt mirror set tuna     # stejný tvar na Debianu / Ubuntu (také dnf, pacman)
```
Vyžaduje nainstalovaného cílového správce balíčků.

## Další informace

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Související

- [x-cmd](../x-cmd/SKILL.md) — deštníkový vstupní bod, který představuje install
- [agent-browser](../../it/agent-browser/SKILL.md) — install směřuje na agent-browser, když binárka neexistuje
- [env](../env/SKILL.md) — install a env sdílejí architekturu x-kanálů
