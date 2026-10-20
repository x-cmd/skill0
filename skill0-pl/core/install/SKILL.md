---
name: install
description: |
  Instalacja oprogramowania każdą metodą, jaką dopuszcza system. Polecamy `x install` — jedne wejście wymieniające wszystkie
  metody i wybierające najlepszą; plus kanały `x eget`/`x env use`/`x pixi` oraz systemowe menedżery pakietów
  z przełączaniem lustrzanych repozytoriów. Wszystkie kanały x-cmd instalują w $HOME — bez sudo, bez zaśmiecania.
  Użyj dla "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Instaluj oprogramowanie każdą metodą, jaką dopuszcza system. **Wszystkie kanały x-cmd (`x eget`, `x env use`, `x pixi`) instalują do `$HOME` — bez sudo, bez zaśmiecania systemu.** Tylko systemowe menedżery pakietów (`x apt`, `x brew`, …) dotykają systemu operacyjnego i mogą wymagać sudo.

## Wybierz kanał

- `x install` — **Polecany.** Jedno wejście — wymienia wszystkie metody dla danego narzędzia i wybiera najlepszą
- `x eget` — najnowsze binaria prosto z repozytoriów źródłowych (wydania GitHub / Codeberg)
- `x env use` — środowiska uruchomieniowe i narzędzia hostowane przez x-cmd (opakowuje `x pkg use`)
- `x pixi` — pakiety conda / ekosystemu pixi
- `x apt/brew/dnf/pacman` — systemowe menedżery pakietów (mogą wymagać sudo)

## Wymagania wstępne

x-cmd zapewnia każdy kanał powyżej:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — polecane wejście

Każde narzędzie ma kilka ścieżek instalacji; `x install` automatycznie wybiera najlepszą. Wszystkie poniższe formy są nieinteraktywne (bezpieczne dla agenta i CI):
```bash
x install bun                            # instaluj — automatycznie wybiera najlepszą metodę
x install --printinfo ripgrep            # najpierw wymień wszystkie metody instalacji (tylko do odczytu)
x install --withtool brew jq             # wymuś menedżera; albo forma prefiksowa: brew/jq
x install --sys bun                      # tylko systemowy menedżer pakietów
x install --printcmd bun vim             # podejrzyj polecenie, nie uruchamiaj go
x install --env                          # rozpoznaj platformę / architekturę / dystrybucję
x install --available-tool --installed   # które menedżery pakietów tu istnieją
```

### Odkryj, co można zainstalować

`x install --ls` wypisuje TSV ze wszystkimi zindeksowanymi narzędziami — przeszukaj go offline przez grep / awk:
```bash
x install --ls --tsv | head -1                  # nagłówek
x install --ls --tsv | grep -i json             # szukaj po słowie kluczowym
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtruj po języku
x install --search http                         # zbiorcze wyszukiwanie w rejestrach
```
Kolumny TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Zmiana lustrzanych repozytoriów (szybsze pobieranie)

Przekieruj wolny systemowy menedżer pakietów na szybsze lub lokalne lustro. Każdy ma `mirror ls` (lista opcji) i `mirror set <code>` (zastosowanie, nieinteraktywnie):
```bash
x brew mirror ls          # lista: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # zastosuj lustro Tsinghua
x apt mirror set tuna     # ten sam kształt na Debianie / Ubuntu (także dnf, pacman)
```
Wymaga zainstalowania docelowego menedżera pakietów.

## Więcej

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Powiązane

- [x-cmd](../x-cmd/SKILL.md) — nadrzędne wejście, które stoi przed install
- [agent-browser](../../it/agent-browser/SKILL.md) — install kieruje do agent-browser, gdy nie ma binarki
- [env](../env/SKILL.md) — install i env dzielą architekturę kanałów x