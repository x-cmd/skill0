---
name: env
description: |
  Installa e gestisci all'istante pacchetti software, runtime di linguaggio e strumenti CLI.
  Zero barriere — installa x-cmd e ottieni qualsiasi strumento in pochi secondi. Non serve sudo.
  Usala per "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Installa qualsiasi software all'istante. Niente sudo. Nessun inquinamento di sistema.

## Guida rapida

```bash
# Installa x-cmd
eval "$(curl https://get.x-cmd.com)"

# Installa Python
x env use python

# Installa Node.js
x env use node

# Installa strumenti CLI
x env use jq
x env use fzf

# Prova senza installare in modo permanente
x env try python3 script.py
```

## Cosa c'è a disposizione

Oltre 600 pacchetti, tra cui:

- Linguaggi — python, node, go, bun, java, rust
- Strumenti CLI — jq, yq, fzf, himalaya
- Strumenti di sviluppo — claude-code, code-server

## Funzionalità principali

- **Niente sudo** — si installa nella directory dell'utente
- **Gestione delle versioni** — installa e cambia versione
- **Prova prima di installare** — `x env try` per un uso temporaneo
- **Pulizia** — `x env clean` rimuove i pacchetti inutilizzati

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi di installazione comuni
- Consigli sul pinning delle versioni
- Guide alla configurazione di progetti multi-linguaggio

## Esperienza completa

Dopo aver installato x-cmd, `x env --help` per tutte le opzioni.

## Related

- [install](../install/SKILL.md) — x env use è uno dei canali di install
- [x-cmd](../x-cmd/SKILL.md) — punto d'ingresso ombrello per env