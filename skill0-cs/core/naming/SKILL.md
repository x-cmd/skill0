---
name: naming
description: |
  Framework pojmenování modulů / příkazů / dílčích příkazů x-cmd. Subjektivní + řízený scénářem;
  skill je tenká slupka, NENÍ pravidlová kniha. Tři vrstvy: investigate (cíl), naming.<user-task>.yml
  (OKR + záznam sessionu, soubor .rule), naming.okr-creator.yml (meta-pravidlo, které session audituje).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Pojmenování je **subjektivní + řízené scénářem**. Tento skill je **framework**, ne pravidlová kniha — nezakódovává subjektivní pravidla pojmenování.

## Přehled

```
┌───────────────────────────────────────────────────────────┐
│  1. INVESTIGATE cíl                                       │
│     Co se pojmenovává? Jaká role? Jaký pojem?             │
└───────────────────────────────────────────────────────────┘
┌───────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (soubor .rule)                │
│     - goal-*        (úloha pojmenování)                   │
│     - keyresult-*   (ověřitelné výsledky)                 │
│     - task-*        (omezení specifická pro úlohu)        │
│     - session:      (auditní stopa u pravidla cíle)       │
│         prefer     (5 odpovědí init-004)                  │
│         init_verdicts  (rozhodnutí brány pro kandidáty)   │
│         scores     (D1-D7 ukotvené pro každého kandidáta) │
│         final      (výběr + záloha)                       │
└───────────────────────────────────────────────────────────┘
┌───────────────────────────────────────────────────────────┐
│  3. AUDITuj šablonou template/naming.okr-creator.yml      │
│     x rule check -r <naming-dir> naming.<user-task>.yml   │
└───────────────────────────────────────────────────────────┘
```

## Pracovní postup — krok za krokem

### Krok 1 · Prozkoumej cíl

Než cokoli napíšeš, zodpověz tyto otázky. NEPOUŽÍVEJ přeskočení — bez odpovědí nemůže hodnotitel ukotvit D4 (TRIAL/REAL) ani D5 (RUN/TEST).

- **Co se pojmenovává?** — modul / dílčí příkaz / pole / proměnná — platí jiná pravidla formy pojmenování
- **Jakou hraje roli?** — ukotvuje pojem (např. "trial-run modul" → samostatný runner, Stage 1 dvoufázového testu)
- **Jaké předchozí MUSÍ nést?** — dominantní význam holého slova se musí shodovat (např. trial-run potřebuje TRIAL+RUN, ne REAL+TEST)
- **Jakých předchozích se MUSÍ vyvarovat?** — znečištění unittest (`*test`/`*case`), falečné (`*mock`/`*fake`/`*stub`/`*dry`), reálný deployment (`field*`/`*live*`)
- **Jaký archetyp sedí?** — ship / plane / rocket / factory / abstract — řídí D6/D7

Výstup: jednořádkové formulování cíle, např.
> "Vybrat název samostatného modulu x-cmd pro trial-run (Stage 1 dvoufázového testu), který na D1-D7 skóruje 8.0+, je na první pohled srozumitelný a přežije všechny fast-faily červených čar / slovníku / délky."

### Krok 2 · Vytvoř záznam sessionu

Zkopíruj šablonu a vystřihni / vyplň.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Pak vyplň 4 sekce (od shora):

#### 2a. Pravidlo cíle (úloha pojmenování)

Nahraď `goal-TBD_task_id` skutečným ID. Sufix ID má odrážet úlohu (např. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <one-line goal statement from Step 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concept + role + anti-priors, from Step 1>
```

#### 2b. Klíčové výsledky (ověřitelné výsledky)

Nahraď každé `keyresult-kr*_TBD_short_label`. Každý KR je pravidlo, které musí jít projít jako PASS. Přidej jich tolik, kolik úloha má.

```yaml
keyresult-kr1-top-pick-committed:
  name: <verifiable outcome 1>
  level: error
  desc:
  - <what counts as passing — concrete criterion, not "looks good">
```

#### 2c. Pravidla specifická pro úlohu (omezení kandidátů)

Nahraď každé `TBD_task_id-*` skutečným ID omezení, které odpovídá sufrixu task-id cíle. Vystřihni ta, která neplatí, podle potřeby přidej nová.

Běžné vzory:
- `must-be-X-not-Y` — soulad pojmů (např. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — tvrdý rozsah D1
- `must-imply-<archetype>` — vazba D7
- `<domain>-specific-acceptable` / `not-acceptable` — úzké doménové povolení
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

#### 2d. Záznam sessionu (auditní stopa u pravidla cíle)

Vyplň všechny 4 podsekce:

**prefer** — MUSÍ zodpovědět všech 5 otázek, i když je odpověď "ne / slabé":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<list of narrow domains OK, e.g. [naval]>]   # [] = žádný úzký domén OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — jeden záznam na každého zvažovaného kandidáta, včetně odmítnutých:
```yaml
init_verdicts:
  - { name: <candidate>, gate: init-005 | init-006 | init-007 | pass, reason: "<why>" }
  # init-005 = shoda s vzorem červené čáry (automatické odmítnutí)
  # init-006 = první význam ve slovníku odporuje cíli
  # init-007 = délka mimo rozsah (< 2 nebo > 8)
  # pass     = prošel všechny init brány, způsobilý pro bodování
```

**scores** — jeden záznam na každého kandidáta, který prošel init. Všechna skóre >= 6.0. Každé skóre MUSÍ mít ukotvení:
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

**final** — deklaruj výběr + zálohu:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Krok 3 · Audituj meta-pravidlem

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator (v `template/naming.okr-creator.yml`) spouští 11 kontrol (směs error a warn):

| Kontrola | Úroveň | Co ověřuje |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | soubor má ≥1 pravidlo `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | soubor má ≥1 pravidlo `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | soubor má ≥1 task pravidlo (ne goal/keyresult) |
| `okr-creator-010` has-session-record | error | pravidlo cíle má pole `session:` |
| `okr-creator-011` prefer-answers-all-five | error | všech 5 otázek init-004 zodpovězeno |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts neprázdný |
| `okr-creator-013` scores-have-anchors | error | každé skóre má neprázdný seznam anchors |
| `okr-creator-014` scores-no-below-6 | error | všechna skóre >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` deklarováno |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | skóre pick >= 7.0 |

**Pokud selhá kterákoli kontrola úrovně error**: oprav soubor a spusť znovu. Časté opravy:
- Chybí pole prefer → přidej ho do `session.prefer`
- Holé skóre → přidej `anchors: [...]`
- Skóre < 6 → přesuň do `init_verdicts` (odmítnuto) nebo přeformuluj skóre
- Chybí final → přidej `final: { pick, backup }`

**Pokud selhají kontroly úrovně warn**: rozhodni, jestli to řešit, nebo kompromis zdokumentovat.

### Krok 4 · Uživatel vybere finální název

Skill navrhuje; uživatel rozhoduje. Finální název je deklarován v `session.final.pick` a zapsán.

## Soubory

| Soubor | Role | Formát |
|---|---|---|
| `SKILL.md` | Tento soubor — pracovní postup + index souborů | markdown |
| `naming.template.yml` | ŠABLONA s placeholdery `TBD_*` — kopíruj, přejmenuj, vyplň | `.rule` |
| `naming.trial-run-module.yml` | Vypracovaný příklad kompletního záznamu sessionu | `.rule` |
| `template/naming-concept.yml` | Objektivní hodnotící framework (D1–D7, červené čáry, ukotvení bodování) — jako položky `.rule` | `.rule` |
| `template/naming-brand.yml` | Brandová pravidla x-cmd (délka, velikost písmen, preference předchozích významů) — jako položky `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-pravidlo: audituje `naming.<user-task>.yml` (11 kontrol výše) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Volitelná předvolba pojmenování modulů x-cmd (úvodní záznam sessionu) | `.rule` |

## Rozdělení subjektivní a objektivní části

| Objektivní (v souborech / kódu) | Subjektivní (zeptáno na začátku, neboduje se) |
|---|---|
| První význam ve slovníku | "Chci barevný, nebo abstraktní" |
| Počet písmen | "Chci přípustnou doménu X" |
| Sémantická třída Trial / Real / Run / Test | "Chci námořní metaforu, nebo ne" |
| Doslovný význam složeniny | "Chci původ čínský, nebo anglický" |
| Znečištění předchozími významy (unittest testcase, dryrun) | "Chci krátké, nebo srozumitelné" |

## Pravidla

- **MUSÍ** nejdřív prozkoumat cíl — co se pojmenovává, jakou hraje roli, jaký pojem ho ukotvuje.
- **MUSÍ** začít z `naming.template.yml` (placeholdery `TBD_*`) a podle potřeby vystřihovat / vyplňovat.
- **MUSÍ** vyprodukovat `naming.<user-task>.yml` (formát `.rule`) s cílem / klíčovými výsledky / task pravidly / záznamem sessionu.
- **MUSÍ** spustit `x rule check` s `template/naming.okr-creator.yml` pro audit záznamu sessionu.
- **MUSÍ** ukotvovat skóre v objektivních faktech — nikdy nenadhodnocovat/nepodhodnocovat podle reakce uživatele.
- **MUSÍ** nechat uživateli vybrat finální název — skill navrhuje, uživatel rozhoduje.
- **NESMÍ** přidávat subjektivní pravidla do `template/naming-concept.yml` — ta patří do `session.prefer` konkrétní úlohy.

## Související

- [rule](../rule/SKILL.md) — session pojmenování se kontroluje přes x rule
- [score](../score/SKILL.md) — kandidáti se obodovávají přes score framework
- [ontology-database](../ontology-database/SKILL.md) — vybraný název zůstává v ondb
