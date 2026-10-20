---
name: naming
description: |
  Framework di naming per moduli / comandi / sottocomandi x-cmd. Soggettivo + guidato dallo scenario; la skill è un guscio sottile, NON un manuale di regole. Tre livelli: indaga (obiettivo), naming.<user-task>.yml (OKR + verbale di sessione, un file .rule), naming.okr-creator.yml (meta-rule che audita la sessione).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Il naming è **soggettivo + guidato dallo scenario**. Questa skill è un **framework**, non un manuale di regole — non incapsula regole di naming soggettive.

## Mappa rapida

```
┌─────────────────────────────────────────────────────────┐
│  1. INDAGA l'obiettivo                                   │
│     Cosa si sta nominando? Quale ruolo? Quale concetto?  │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (file .rule)                 │
│     - goal-*        (il task di naming)                 │
│     - keyresult-*   (risultati verificabili)             │
│     - task-*        (vincoli specifici del task)        │
│     - session:      (traccia di audit sulla regola)     │
│         prefer     (5 risposte init-004)                 │
│         init_verdicts  (decisioni gate per candidato)   │
│         scores     (ancoraggi D1-D7 per candidato)       │
│         final      (scelta + riserva)                    │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITA con template/naming.okr-creator.yml          │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — passo per passo

### Passo 1 · Indaga l'obiettivo

Prima di scrivere qualsiasi cosa, rispondi a queste domande. NON saltarle — senza risposte, lo scorer non può ancorare D4 (TRIAL/REAL) o D5 (RUN/TEST).

- **Cosa si sta nominando?** — module / subcommand / field / variable — si applicano regole di forma diverse
- **Quale ruolo svolge?** — àncora il concetto (es. "modulo trial-run" → runner autonomo, Stage 1 di un test in due fasi)
- **Quali priori DEVE portare?** — il significato nudo dominante deve corrispondere (es. trial-run vuole TRIAL+RUN, non REAL+TEST)
- **Quali priori DEVE EVITARE?** — inquinamento da unittest (`*test`/`*case`), finti (`*mock`/`*fake`/`*stub`/`*dry`), deployment reali (`field*`/`*live*`)
- **Quale archetipo si adatta?** — ship / plane / rocket / factory / abstract — guida D6/D7

Output: una frase di obiettivo, ad es.
> "Scegli un nome di modulo x-cmd autonomo per trial-run (Stage 1 di un test in due fasi) che ottenga 8.0+ su D1-D7, sia autoesplicativo a prima vista e superi tutti i fast-fail di linea rossa / dizionario / lunghezza."

### Passo 2 · Crea il verbale di sessione

Copia il template e ritaglia / riempi.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Poi compila le 4 sezioni (dall'alto verso il basso):

#### 2a. Regola obiettivo (il task di naming)

Sostituisci `goal-TBD_task_id` con un ID reale. Il suffisso dell'ID deve riflettere il task (es. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <one-line goal statement from Step 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concept + role + anti-priors, from Step 1>
```

#### 2b. Key result (risultati verificabili)

Sostituisci ogni `keyresult-kr*_TBD_short_label`. Ogni KR è una regola che deve poter risultare PASS. Aggiungine quanti ne ha il task.

```yaml
keyresult-kr1-top-pick-committed:
  name: <verifiable outcome 1>
  level: error
  desc:
  - <what counts as passing — concrete criterion, not "looks good">
```

#### 2c. Regole specifiche del task (vincoli sui candidati)

Sostituisci ogni `TBD_task_id-*` con un ID di vincolo reale che corrisponda al suffisso task-id dell'obiettivo. Ritaglia quelli che non si applicano, aggiungine di nuovi secondo necessità.

Schemi comuni:
- `must-be-X-not-Y` — allineamento del concetto (es. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — intervallo rigido per D1
- `must-imply-<archetype>` — vincolo per D7
- `<domain>-specific-acceptable` / `not-acceptable` — permesso per un dominio stretto
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <constraint, e.g. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <what the candidate must satisfy>
  - <which D1-D7 dimension this constrains>
  tldr:
  - wrong: <anti-example>
  - right: <good example>
```

#### 2d. Verbale di sessione (traccia di audit sulla regola obiettivo)

Compila tutte e 4 le sottosezioni:

**prefer** — DEVI rispondere a tutte e 5 le domande, anche se la risposta è "no / debole":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<list of narrow domains OK, e.g. [naval]>]   # [] = no narrow domain OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — una voce per ogni candidato considerato, compresi gli scarti:
```yaml
init_verdicts:
  - { name: <candidate>, gate: init-005 | init-006 | init-007 | pass, reason: "<why>" }
  # init-005 = abbinamento a un pattern di linea rossa (rifiuto automatico)
  # init-006 = il primo significato del dizionario contraddice l'obiettivo
  # init-007 = lunghezza fuori intervallo (< 2 o > 8)
  # pass     = ha superato tutti i gate init, idoneo alla valutazione
```

**scores** — una voce per ogni candidato che ha superato init. Tutti i punteggi >= 6.0. Ogni punteggio DEVE avere ancoraggi:
```yaml
scores:
  - name: <candidate>
    score: <0_to_10>
    anchors:
      - "D1: <letter count evidence>"
      - "D2: <dictionary first meaning evidence>"
      - "D3: <compound literal evidence>"
      - "D4: <trial vs real evidence>"
      - "D5: <run vs test evidence>"
      - "D6: <vividness evidence>"
      - "D7: <large equipment evidence>"
    misses:
      - "<what's missing — only list real misses, not always all 7>"
```

**final** — dichiara la scelta + la riserva:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Passo 3 · Audita con la meta-rule

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

L'OKR-creator (in `template/naming.okr-creator.yml`) esegue 11 controlli (un mix di error e warn):

| Check | Level | What it verifies |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | il file ha >=1 regola `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | il file ha >=1 regola `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | il file ha >=1 regola di task (non goal/keyresult) |
| `okr-creator-010` has-session-record | error | la regola obiettivo ha il campo `session:` |
| `okr-creator-011` prefer-answers-all-five | error | tutte e 5 le domande init-004 hanno risposta |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts non vuoto |
| `okr-creator-013` scores-have-anchors | error | ogni punteggio ha un elenco di ancoraggi non vuoto |
| `okr-creator-014` scores-no-below-6 | error | tutti i punteggi >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` dichiarato |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | punteggio del pick >= 7.0 |

**Se un controllo di livello error fallisce**: correggi il file e riesegui. Correzioni comuni:
- Campo prefer mancante → aggiungilo a `session.prefer`
- Punteggio senza ancoraggi → aggiungi `anchors: [...]`
- Punteggio < 6 → spostalo in `init_verdicts` (rifiutato) o riformula il punteggio
- final mancante → aggiungi `final: { pick, backup }`

**Se falliscono i controlli di livello warn**: decidi se intervenire o documentare il compromesso.

### Passo 4 · L'utente sceglie il nome finale

La skill propone; l'utente decide. Il nome finale è dichiarato in `session.final.pick` e messo in commit.

## File

| File | Role | Format |
|---|---|---|
| `SKILL.md` | Questo file — workflow + indice dei file | markdown |
| `naming.template.yml` | TEMPLATE con placeholder `TBD_*` — copia, rinomina, compila | `.rule` |
| `naming.trial-run-module.yml` | Esempio lavorato di un verbale di sessione completo | `.rule` |
| `template/naming-concept.yml` | Framework di valutazione obiettiva (D1–D7, linee rosse, ancoraggi di punteggio) — come voci `.rule` | `.rule` |
| `template/naming-brand.yml` | Regole di brand x-cmd (lunghezza, maiuscole, preferenze di priori) — come voci `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-rule: audita un `naming.<user-task>.yml` (gli 11 controlli qui sopra) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset opzionale per il naming dei moduli x-cmd (verbale di sessione iniziale) | `.rule` |

## divisione soggettivo vs oggettivo

| Oggettivo (nei file / nel codice) | Soggettivo (chiesto all'init, non valutato) |
|---|---|
| Primo significato nel dizionario | "Preferisco vivido vs astratto" |
| Numero di lettere | "Il dominio X è accettabile" |
| Classe semantica Trial / Real / Run / Test | "Va bene la metafora navale o no" |
| Significato letterale del composto | "Origine cinese vs inglese" |
| Inquinamento da priori (unittest testcase, dryrun) | "Breve vs autoesplicativo" |

## Regole

- **DEVI** indagare l'obiettivo per prima — cosa si sta nominando, quale ruolo svolge, quale concetto lo àncora.
- **DEVI** partire da `naming.template.yml` (placeholder TBD_*) e ritagliare / riempire come richiede il task.
- **DEVI** produrre un `naming.<user-task>.yml` (formato `.rule`) con obiettivo / key result / regole di task / verbale di sessione.
- **DEVI** eseguire `x rule check` con `template/naming.okr-creator.yml` per audiare il verbale di sessione.
- **DEVI** ancorare i punteggi a fatti oggettivi — mai gonfiare o ridurre in base alla reazione dell'utente.
- **DEVI** lasciare che l'utente scelga il nome finale — la skill propone, l'utente decide.
- **NON DEVI** aggiungere regole soggettive a `template/naming-concept.yml` — quelle vanno nel `session.prefer` del singolo task.

## Related

- [rule](../rule/SKILL.md) — la sessione di naming viene controllata via x rule
- [score](../score/SKILL.md) — i candidati vengono valutati via il framework score
- [ontology-database](../ontology-database/SKILL.md) — il nome scelto persiste in ondb