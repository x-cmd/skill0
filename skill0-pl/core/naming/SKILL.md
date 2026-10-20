---
name: naming
description: |
  Ramka nazewnictwa dla modułów / poleceń / podpoleceń x-cmd. Subiektywna + sterowana scenariuszem; ta umiejętność to cienka powłoka, a NIE kodeks reguł. Trzy warstwy: zbadaj (cel), naming.<zadanie-użytkownika>.yml (OKR + zapis sesji, plik .rule), naming.okr-creator.yml (meta-reguła, która kontroluje sesję).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Nazewnictwo jest **subiektywne i sterowane scenariuszem**. Ta umiejętność to **ramka**, a nie kodeks reguł — nie wtapia w nią subiektywnych reguł nazwniczych.

## Szybka mapa

```
┌───────────────────────────────────────────────────────────┐
│ 1. ZBADAJ cel                                             │
│    Co jest nazywane? Jaka rola? Jakie pojęcie?            │
└───────────────────────────────────────────────────────────┘
                          ↓
┌───────────────────────────────────────────────────────────┐
│ 2. naming.<zadanie-użytkownika>.yml  (plik .rule)         │
│    - goal-*        (zadanie nazwnicze)                    │
│    - keyresult-*   (weryfikowalne wyniki)                 │
│    - task-*        (ograniczenia specyficzne              │
│                    dla zadania)                           │
│    - session:      (ślad audytowy reguły celu)            │
│        prefer     (5 odpowiedzi init-004)                 │
│        init_verdicts  (decyzje bramki dla kandydatów)     │
│        scores     (D1-D7 zakotwiczone dla kandydata)      │
│        final      (wybór + zapasowy)                      │
└───────────────────────────────────────────────────────────┘
                          ↓
┌───────────────────────────────────────────────────────────┐
│ 3. SKONTROLUJ szablonem template/naming.okr-creator.yml   │
│    x rule check -r <katalog-naming> naming.<zadanie>.yml  │
└───────────────────────────────────────────────────────────┘
```

## Przepływ pracy — krok po kroku

### Krok 1 · Zbadaj cel

Zanim cokolwiek napiszesz, odpowiedz na te pytania. NIE pomijaj — bez odpowiedzi punktujący nie zakotwiczy D4 (TRIAL/REAL) ani D5 (RUN/TEST).

- **Co jest nazywane?** — moduł / podpolecenie / pole / zmienna — obowiązują różne reguły formy nazwy
- **Jaką rolę pełni?** — kotwica pojęcia (np. „moduł próby" → samodzielny biegacz, Etap 1 testu dwuetapowego)
- **Jakie wcześniejsze znaczenie MUSI nieść?** — dominujące znaczenie słowa bazowego musi się zgadzać (np. trial-run potrzebuje TRIAL+RUN, a nie REAL+TEST)
- **Jakich wcześniejszych znaczeń MUSI unikać?** — zanieczyszczenie od unittestów (`*test`/`*case`), sztuczne (`*mock`/`*fake`/`*stub`/`*dry`), prawdziwe wdrożenie (`field*`/`*live*`)
- **Jaki archetyp pasuje?** — statek / samolot / rakieta / fabryka / abstrakcja — napędza D6/D7

Wynik: jednozdaniowe stwierdzenie celu, np.
> "Wybierz samodzielną nazwę modułu x-cmd dla trial-run (Etap 1 testu dwuetapowego), która zdobywa 8.0+ na D1-D7, jest samowyjaśniająca na pierwszy rzut oka i przetrwa wszystkie szybkie odrzucenia: czerwoną linię / słownik / długość."

### Krok 2 · Utwórz zapis sesji

Skopiuj szablon i przytnij / uzupełnij.

```bash
cp naming.template.yml naming.<zadanie-użytkownika>.yml
```

Następnie uzupełnij 4 sekcje (od góry do dołu):

#### 2a. Reguła celu (zadanie nazwnicze)

Zamień `goal-TBD_task_id` na prawdziwy identyfikator. Sufiks identyfikatora powinien oddawać zadanie (np. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <jednozdaniowe stwierdzenie celu z Kroku 1>
  apply: "naming.<zadanie-użytkownika>.yml (self)"
  level: error
  desc:
  - <pojęcie + rola + anty-priory, z Kroku 1>
```

#### 2b. Wyniki kluczowe (weryfikowalne wyniki)

Zamień każde `keyresult-kr*_TBD_short_label`. Każdy KR to reguła, która MUSI dać się przejść (PASS). Dodaj tyle, ile zadanie ich potrzebuje.

```yaml
keyresult-kr1-top-pick-committed:
  name: <weryfikowalny wynik 1>
  level: error
  desc:
  - <co liczy się jako zaliczenie — konkretne kryterium, a nie "wygląda dobrze">
```

#### 2c. Reguły specyficzne dla zadania (ograniczenia kandydatów)

Zamień każde `TBD_task_id-*` na prawdziwy identyfikator ograniczenia zgodny z sufiksem task-id celu. Wytnij te, które nie pasują, i dodaj nowe w razie potrzeby.

Typowe wzorce:
- `must-be-X-not-Y` — zgodność pojęcia (np. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — twardy zakres D1
- `must-imply-<archetype>` — wiążące D7
- `<domena>-specific-acceptable` / `not-acceptable` — zgoda na wąską domenę
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <ograniczenie, np. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <co kandydat musi spełniać>
  - <który wymiar D1-D7 to ogranicza>
  tldr:
  - wrong: <przykład przeciwny>
  - right: <dobry przykład>
```

#### 2d. Zapis sesji (ślad audytowy reguły celu)

Uzupełnij wszystkie 4 podsekcje:

**prefer** — MUSI odpowiedzieć na wszystkie 5 pytań, nawet jeśli odpowiedź brzmi „nie / słabo":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<lista akceptowanych wąskich domen, np. [naval]>]   # [] = żadna wąska domena nie jest OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — po jednym wpisie na rozważonego kandydata, w tym odrzuconych:
```yaml
init_verdicts:
  - { name: <kandydat>, gate: init-005 | init-006 | init-007 | pass, reason: "<dlaczego>" }
  # init-005 = dopasowanie wzorca czerwonej linii (automatyczne odrzucenie)
  # init-006 = pierwsze znaczenie w słowniku przeczy celowi
  # init-007 = długość poza zakresem (< 2 lub > 8)
  # pass     = przeszedł wszystkie bramki init, kwalifikuje się do punktacji
```

**scores** — po jednym wpisie na kandydata, który przeszedł init. Wszystkie wyniki >= 6.0. Każdy wynik MUSI mieć kotwice:
```yaml
scores:
  - name: <kandydat>
    score: <0_do_10>
    anchors:
      - "D1: <dowód liczby liter>"
      - "D2: <dowód pierwszego znaczenia w słowniku>"
      - "D3: <dowód dosłownego znaczenia złożenia>"
      - "D4: <dowód trial vs real>"
      - "D5: <dowód run vs test>"
      - "D6: <dowód plastyczności>"
      - "D7: <dowód dużego sprzętu>"
    misses:
      - "<czego brakuje — wymieniaj tylko realne braki, nie zawsze wszystkie 7>"
```

**final** — ogłoś wybór + wariant zapasowy:
```yaml
final:
  pick: <kandydat_wygrany>
  backup: <drugi_lub_null>
```

### Krok 3 · Skontroluj meta-regułą

```bash
x rule check -r <katalog-naming> naming.<zadanie-użytkownika>.yml
```

OKR-creator (w `template/naming.okr-creator.yml`) wykonuje 11 kontroli (mix error i warn):

| Kontrola | Poziom | Co weryfikuje |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | plik ma ≥1 regułę `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | plik ma ≥1 regułę `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | plik ma ≥1 regułę zadania (nie goal/keyresult) |
| `okr-creator-010` has-session-record | error | reguła celu ma pole `session:` |
| `okr-creator-011` prefer-answers-all-five | error | odpowiedziano na wszystkie 5 pytań init-004 |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts niepuste |
| `okr-creator-013` scores-have-anchors | error | każdy wynik ma niepustą listę anchors |
| `okr-creator-014` scores-no-below-6 | error | wszystkie wyniki >= 6.0 |
| `okr-creator-015` final-section-present | error | zadeklarowano `final.pick` |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | wynik pick >= 7.0 |

**Jeśli któraś kontrola error się nie powiedzie**: napraw plik i uruchom ponownie. Typowe poprawki:
- Brak pola prefer → dodaj do `session.prefer`
- Goły wynik → dodaj `anchors: [...]`
- Wynik < 6 → przenieś do `init_verdicts` (odrzucony) albo przedstaw wynik inaczej
- Brak final → dodaj `final: { pick, backup }`

**Jeśli kontrole warn się nie powiodą**: zdecyduj, czy chcesz to poprawić, czy udokumentować kompromis.

### Krok 4 · Użytkownik wybiera ostateczną nazwę

Umiejętność proponuje; użytkownik decyduje. Ostateczna nazwa jest zadeklarowana w `session.final.pick` i zatwierdzona.

## Pliki

| Plik | Rola | Format |
|---|---|---|
| `SKILL.md` | Ten plik — przepływ pracy + indeks plików | markdown |
| `naming.template.yml` | SZABLON z symbolami `TBD_*` — skopiuj, zmień nazwę, uzupełnij | `.rule` |
| `naming.trial-run-module.yml` | Przykład kompletnego zapisu sesji | `.rule` |
| `template/naming-concept.yml` | Obiektywna ramka oceny (D1–D7, czerwone linie, kotwice punktacji) — jako wpisy `.rule` | `.rule` |
| `template/naming-brand.yml` | Reguły marki x-cmd (długość, wielkość liter, preferencje znaczeniowe) — jako wpisy `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-reguła: kontroluje `naming.<zadanie-użytkownika>.yml` (11 kontroli powyżej) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Opcjonalny preset nazewnictwa modułów x-cmd (startowy zapis sesji) | `.rule` |

## Podział na obiektywne i subiektywne

| Obiektywne (w plikach / kodzie) | Subiektywne (zapytane na starcie, niepunktowane) |
|---|---|
| Pierwsze znaczenie w słowniku | "Chcę plastyczne czy abstrakcyjne" |
| Liczba liter | "Akceptuję domenę X" |
| Klasa semantyczna Trial / Real / Run / Test | "Czy metafora morska jest OK" |
| Dosłowne znaczenie złożenia | "Chcę pochodzenie chińskie czy angielskie" |
| Zanieczyszczenie znaczeniowe (unittest testcase, dryrun) | "Wolę krótkie czy samowyjaśniające" |

## Reguły

- **MUST** zbadać cel najpierw — co jest nazywane, jaką rolę pełni, jakie pojęcie kotwiczy.
- **MUST** wychodzić z `naming.template.yml` (symbole TBD_*) i przycinać / uzupełniać zgodnie z potrzebą zadania.
- **MUST** wyprodukować `naming.<zadanie-użytkownika>.yml` (format `.rule`) z celem / wynikami kluczowymi / regułami zadania / zapisem sesji.
- **MUST** uruchomić `x rule check` z `template/naming.okr-creator.yml`, aby skontrolować zapis sesji.
- **MUST** zakotwiczać wyniki w obiektywnych faktach — nigdy nie zawyżać ani zaniżać na podstawie reakcji użytkownika.
- **MUST** pozwolić użytkownikowi wybrać ostateczną nazwę — umiejętność proponuje, użytkownik decyduje.
- **MUST NOT** dodawać subiektywnych reguł do `template/naming-concept.yml` — one trafiają do per-zadaniowe `session.prefer`.

## Powiązane

- [rule](../rule/SKILL.md) — sesja nazwnicza jest sprawdzana przez x rule
- [score](../score/SKILL.md) — kandydaci są punktowani przez ramkę score
- [ontology-database](../ontology-database/SKILL.md) — wybrana nazwa jest zapisywana w ondb