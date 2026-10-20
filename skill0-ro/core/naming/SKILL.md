---
name: naming
description: |
  Framework de denumire pentru modulele / comenzile / subcomenzile x-cmd. Subiectiv + condus de scenariu; skill-ul e o coajă subțire, NU un manual de reguli. Trei straturi: investigate (obiectivul), naming.<user-task>.yml (OKR + proces verbal de sesiune, un fișier .rule), naming.okr-creator.yml (meta-regulă care auditează sesiunea).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Denumirea e **subiectivă + condusă de scenariu**. Acest skill e un **framework**, nu un manual de reguli — nu conține reguli subiective de denumire.

## Hartă rapidă

```
┌─────────────────────────────────────────────────────────┐
│  1. INVESTIGHEAZĂ obiectivul                            │
│     Ce se numește? Ce rol? Ce concept?                 │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (fișier .rule)              │
│     - goal-*        (taskul de denumire)                │
│     - keyresult-*   (rezultate verificabile)             │
│     - task-*        (constrângeri specifice taskului)   │
│     - session:      (traseu de audit pe regula goal)    │
│         prefer     (cele 5 răspunsuri init-004)         │
│         init_verdicts  (decizii de poartă per candidat) │
│         scores     (ancorate D1-D7 per candidat)        │
│         final      (alegere + rezervă)                  │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITEAZĂ cu template/naming.okr-creator.yml       │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — pas cu pas

### Pasul 1 · Investighează obiectivul

Înainte de a scrie orice, răspunde la întrebările astea. NU sări peste ele — fără răspunsuri, scorerul nu poate ancora D4 (TRIAL/REAL) sau D5 (RUN/TEST).

- **Ce se numește?** — modul / subcomandă / câmp / variabilă — se aplică reguli diferite de formă
- **Ce rol are?** — ancorează conceptul (de ex. „modul trial-run" → runner independent, etapa 1 a unui test în două etape)
- **Ce sensuri TREBUIE să le poarte?** — sensul dominant al cuvântului simplu trebuie să se potrivească (de ex. trial-run are nevoie de TRIAL+RUN, nu REAL+TEST)
- **Ce sensuri TREBUIE să EVITE?** — poluare de tip unittest (`*test`/`*case`), fals (`*mock`/`*fake`/`*stub`/`*dry`), deployment real (`field*`/`*live*`)
- **Ce arhetip se potrivește?** — corabie / avion / rachetă / fabrică / abstract — conduce D6/D7

Ieșire: o declarație de obiectiv pe un singur rând, de ex.
> „Alege un nume de modul x-cmd independent pentru trial-run (etapa 1 a testului în două etape) care scoruiează 8.0+ pe D1-D7, e autoexplicativ la prima vedere și supraviețuiește tuturor verificărilor rapide de linie roșie / dicționar / lungime."

### Pasul 2 · Creează procesul verbal de sesiune

Copiază șablonul și decupează / completează.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Apoi completează 4 secțiuni (de sus în jos):

#### 2a. Regula goal (taskul de denumire)

Înlocuiește `goal-TBD_task_id` cu un ID real. Sufixul ID-ului ar trebui să reflecte taskul (de ex. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <one-line goal statement from Step 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concept + role + anti-priors, from Step 1>
```

#### 2b. Rezultate cheie (verificabile)

Înlocuiește fiecare `keyresult-kr*_TBD_short_label`. Fiecare KR e o regulă care trebuie să poată fi PASS. Adaugă câte are taskul.

```yaml
keyresult-kr1-top-pick-committed:
  name: <verifiable outcome 1>
  level: error
  desc:
  - <what counts as passing — concrete criterion, not "looks good">
```

#### 2c. Reguli specifice taskului (constrângeri asupra candidaților)

Înlocuiește fiecare `TBD_task_id-*` cu un ID real de constrângere care corespunde sufixului task-id din goal. Decupează pe cele care nu se aplică, adaugă altele după nevoie.

Tipare uzuale:
- `must-be-X-not-Y` — aliniere de concept (de ex. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — intervalul dur D1
- `must-imply-<archetype>` — legarea D7
- `<domain>-specific-acceptable` / `not-acceptable` — permisiune pentru domeniu îngust
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

#### 2d. Procesul verbal de sesiune (traseu de audit pe regula goal)

Completează toate cele 4 sub-secțiuni:

**prefer** — TREBUIE să răspundă la toate cele 5 întrebări, chiar dacă răspunsul e „nu / slab":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<list of narrow domains OK, e.g. [naval]>]   # [] = no narrow domain OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — o intrare per candidat luat în calcul, inclusiv respinderile:
```yaml
init_verdicts:
  - { name: <candidate>, gate: init-005 | init-006 | init-007 | pass, reason: "<why>" }
  # init-005 = potrivire de tipar pe linie roșie (auto-respingere)
  # init-006 = primul sens din dicționar contrazice ținta
  # init-007 = lungime în afara intervalului (< 2 sau > 8)
  # pass     = a trecut toate porțile init, eligibil pentru scoring
```

**scores** — o intrare per candidat care a trecut porțile init. Toate scorurile >= 6.0. Fiecare scor TREBUIE să aibă ancore:
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

**final** — declară alegerea + rezerva:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Pasul 3 · Auditează cu meta-regula

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator (la `template/naming.okr-creator.yml`) rulează 11 verificări (mix de error și warn):

| Verificare | Nivel | Ce verifică |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | fișierul are ≥1 regulă `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | fișierul are ≥1 regulă `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | fișierul are ≥1 regulă de task (nu goal/keyresult) |
| `okr-creator-010` has-session-record | error | regula goal are câmpul `session:` |
| `okr-creator-011` prefer-answers-all-five | error | toate cele 5 întrebări init-004 au răspuns |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts nevide |
| `okr-creator-013` scores-have-anchors | error | fiecare scor are o listă de ancore nevide |
| `okr-creator-014` scores-no-below-6 | error | toate scorurile >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` declarat |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | scorul pick-ului >= 7.0 |

**Dacă vreo verificare error pică**: repară fișierul și reia. Reparații uzuale:
- Câmp prefer lipsă → adaugă în `session.prefer`
- Scor gol → adaugă `anchors: [...]`
- Scor < 6 → mută în `init_verdicts` (respins) sau reformulează scorul
- lipsă final → adaugă `final: { pick, backup }`

**Dacă verificările warn pică**: decide dacă le corectezi sau documentezi compromiseul.

### Pasul 4 · Utilizatorul alege numele final

Skill-ul propune; utilizatorul decide. Numele final e declarat în `session.final.pick` și se face commit.

## Files

| Fișier | Rol | Format |
|---|---|---|
| `SKILL.md` | Acest fișier — workflow + index de fișiere | markdown |
| `naming.template.yml` | ȘABLON cu placeholder-uri `TBD_*` — copiază, redenumește, completează | `.rule` |
| `naming.trial-run-module.yml` | Exemplu lucrat al unui proces verbal complet | `.rule` |
| `template/naming-concept.yml` | Framework de evaluare obiectivă (D1–D7, linii roșii, ancore de scoring) — ca intrări `.rule` | `.rule` |
| `template/naming-brand.yml` | Regulile de brand x-cmd (lungime, capitalizare, preferințe de sens) — ca intrări `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-regulă: auditează un `naming.<user-task>.yml` (cele 11 verificări de mai sus) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset opțional pentru denumirea modulelor x-cmd (proces verbal de pornire) | `.rule` |

## Împărțirea subiectiv vs obiectiv

| Obiectiv (în fișiere / cod) | Subiectiv (întrebat la init, nepunctat) |
|---|---|
| Primul sens din dicționar | „Vreau viu vs abstract" |
| Numărul de litere | „Accept domeniul X" |
| Clasa semantică Trial / Real / Run / Test | „Vreau sau nu metafora navală" |
| Sensul literal al compusului | „Vreau origine chineză vs engleză" |
| Poluare de sens (unittest testcase, dryrun) | „Vreau scurt vs autoexplicativ" |

## Rules

- **TREBUIE** să investighezi mai întâi obiectivul — ce se numește, ce rol are, ce concept ancorează.
- **TREBUIE** să pornești de la `naming.template.yml` (placeholder-uri TBD_*) și să decupezi / completezi după cum cere taskul.
- **TREBUIE** să produci un `naming.<user-task>.yml` (format `.rule`) cu goal / rezultate cheie / reguli de task / proces verbal de sesiune.
- **TREBUIE** să rulezi `x rule check` cu `template/naming.okr-creator.yml` ca să auditezi procesul verbal.
- **TREBUIE** să ancorezi scorurile în fapte obiective — niciodată să nu le umfli sau să le cobori după reacția utilizatorului.
- **TREBUIE** să lași utilizatorul să aleagă numele final — skill-ul propune, utilizatorul decide.
- **NU TREBUIE** să adaugi reguli subiective în `template/naming-concept.yml` — acelea merg în `session.prefer` per task.

## Related

- [rule](../rule/SKILL.md) — sesiunea de denumire e verificată prin x rule
- [score](../score/SKILL.md) — candidații sunt scoruiți prin framework-ul score
- [ontology-database](../ontology-database/SKILL.md) — numele ales persistă în ondb