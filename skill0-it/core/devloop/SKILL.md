---
name: devloop
description: Ciclo di sviluppo guidato dall'obiettivo — definisci l'obiettivo, scrivi regole con key-result, verifica visivamente, sincronizza con il tracker delle issue.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # oppure un ruleset specifico del progetto
x env use agent-browser                   # per la verifica visiva
```

## Workflow

```
obiettivo → rule.yml → codice → verifica → issue
```

### 1. Definisci l'obiettivo → scrivi rule.yml

Prima di scrivere il codice, crea un rule.yml per il task:

```yaml
goal: "Fix English version showing Chinese tags in Features section"
keyresults:
  - kr-1: "English mode Features tags are all English"
  - kr-2: "Chinese mode Features tags remain Chinese"
  - kr-3: "Build passes with no regressions"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - When language=en, all details[] items must be English
    - No Chinese characters in any tag badge in English mode
```

Campi di una rule: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Vedi `x rule -h`.

**DEVI** includere `goal` e `keyresults` — i due campi obbligatori per ogni task di sviluppo.

### 2. Esecuzione → verifica visiva (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... fai le modifiche ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**DEVI** fare uno screenshot prima e dopo. Confronta con l'intento:
1. Verifica con la visione dell'AI: after.png corrisponde all'obiettivo?
2. Se non corrisponde → itera e rifai lo screenshot
3. **Rimuovi tutti i dati privati** (token, email, informazioni personali) prima di caricare

### 3. Verifica con x rule

```
x rule scan <files>     # veloce (~1 min), per il ciclo interno
x rule check <files>    # approfondito (~10 min)
x rule audit <files>    # report completo (~30 min)
```

### 4. Sincronizza con il tracker delle issue

Vedi [issue/SKILL.md](../issue/SKILL.md). Il minimo: pubblica obiettivo, key-result, rule.yml e screenshot prima/dopo sull'issue.

## Strumenti per l'agente

- `x rule scan` — controllo rapido durante l'iterazione
- `x rule check` — conformità completa prima del commit
- `agent-browser screenshot` — prova visiva prima/dopo
- `gh issue create/comment` — sincronizza obiettivo + rule.yml con il tracker

## Related

- [rule](../rule/SKILL.md) — rule.yml è lo scheletro della verifica
- [score](../score/SKILL.md) — la valutazione dei KR usa il framework score
- [install](../install/SKILL.md) — prepara l'ambiente di sviluppo
- [agent-browser](../../it/agent-browser/SKILL.md) — verifica visiva prima/dopo
- [issue](../issue/SKILL.md) — sincronizza obiettivo + KR + screenshot con il tracker
- [repo](../repo/SKILL.md) — pull/push del lavoro nei repo
- [prompt](../prompt/SKILL.md) — le convenzioni sui prompt guidano spesso i task del devloop