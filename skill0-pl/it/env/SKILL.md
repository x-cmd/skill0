---
name: env
description: |
  Natychmiastowa instalacja i zarządzanie pakietami oprogramowania, środowiskami uruchomieniowymi języków i narzędziami CLI.
  Bez barier — zainstaluj x-cmd i dostaj dowolne narzędzie w kilka sekund. Bez sudo.
  Użyj dla "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Zainstaluj dowolne oprogramowanie natychmiast. Bez sudo. Bez zaśmiecania systemu.

## Szybki start

```bash
# Zainstaluj x-cmd
eval "$(curl https://get.x-cmd.com)"

# Zainstaluj Pythona
x env use python

# Zainstaluj Node.js
x env use node

# Zainstaluj narzędzia CLI
x env use jq
x env use fzf

# Spróbuj bez trwałej instalacji
x env try python3 script.py
```

## Co jest dostępne

Ponad 600 pakietów, w tym:

- Języki — python, node, go, bun, java, rust
- Narzędzia CLI — jq, yq, fzf, himalaya
- Narzędzia deweloperskie — claude-code, code-server

## Kluczowe funkcje

- **Bez sudo** — instaluje do katalogu użytkownika
- **Zarządzanie wersjami** — instaluj i przełączaj wersje
- **Wypróbuj przed instalacją** — `x env try` do tymczasowego użycia
- **Sprzątanie** — `x env clean` usuwa nieużywane pakiety

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Typowe wzorce instalacji
- Wskazówki do przypinania wersji
- Przewodniki konfiguracji projektów wielojęzycznych

## Pełne doświadczenie

`x env --help` dla wszystkich opcji po zainstalowaniu x-cmd.

## Powiązane

- [install](../install/SKILL.md) — x env use to jeden z kanałów install
- [x-cmd](../x-cmd/SKILL.md) — nadrzędny punkt wejścia dla env