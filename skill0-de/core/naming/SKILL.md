---
name: naming
description: |
  Namensframework für x-cmd-Module / Befehle / Unterbefehle. Subjektiv + szenario-getrieben; der Skill ist eine dünne Hülle, KEIN Regelbuch. Drei Ebenen: recherchieren (Ziel), naming.<user-task>.yml (OKR + Sitzungsprotokoll, eine .rule-Datei), naming.okr-creator.yml (Meta-Regel, die die Sitzung auditiert).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Benennung ist **subjektiv + szenario-getrieben**. Dieser Skill ist ein **Framework**, kein Regelbuch — er schreibt keine subjektiven Benennungsregeln fest.

## Schnellübersicht

```
┌─────────────────────────────────────────────────────────┐
│  1. ZIEL recherchieren                                   │
│     Was wird benannt? Welche Rolle? Welches Konzept?    │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (.rule-Datei)                │
│     - goal-*        (die Benennungsaufgabe)             │
│     - keyresult-*   (überprüfbare Ergebnisse)            │
│     - task-*        (aufgabenspezifische Randbedingungen) │
│     - session:      (Audit-Spur zur Zielregel)           │
│         prefer     (5 Antworten aus init-004)           │
│         init_verdicts  (Gate-Entscheide je Kandidat)    │
│         scores     (D1-D7 verankert je Kandidat)        │
│         final      (Auswahl + Rückfall)                 │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITIEREN mit template/naming.okr-creator.yml      │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — Schritt für Schritt

### Schritt 1 · Das Ziel recherchieren

Beantworte, bevor du irgendetwas schreibst, diese Fragen. **Nicht** überspringen — ohne Antworten kann der Scorer D4 (TRIAL/REAL) oder D5 (RUN/TEST) nicht verankern.

- **Was wird benannt?** — Modul / Unterbefehl / Feld / Variable — es gelten unterschiedliche Regeln für die Namensform
- **Welche Rolle spielt es?** — verankert das Konzept (z. B. "trial-run-Modul" → eigenständiger Runner, Stufe 1 eines zweistufigen Tests)
- **Welche Prior **muss** es tragen?** — die dominante Bedeutung als Nacktwort muss passen (z. B. trial-run braucht TRIAL+RUN, nicht REAL+TEST)
- **Welche Prioren **muss** es vermeiden?** — unittest-Verschmutzung (`*test`/`*case`), Falsches (`*mock`/`*fake`/`*stub`/`*dry`), echtes Deployment (`field*`/`*live*`)
- **Welches Archetyp passt?** — ship / plane / rocket / factory / abstract — steuert D6/D7

Ergebnis: eine einzeilige Zielaussage, z. B.
> "Wähle einen eigenständigen x-cmd-Modulnamen für trial-run (Stufe 1 eines zweistufigen Tests), der auf D1-D7 mindestens 8.0 erzielt, auf den ersten Blick selbsterklärend ist und alle Rotlinien-/Wörterbuch-/Längen-Fast-Fails übersteht."

### Schritt 2 · Das Sitzungsprotokoll anlegen

Vorlage kopieren und zuschneiden / ausfüllen.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Dann fülle die 4 Abschnitte von oben nach unten aus:

#### 2a. Goal-Regel (die Benennungsaufgabe)

Ersetze `goal-TBD_task_id` durch eine echte ID. Das ID-Suffix sollte die Aufgabe widerspiegeln (z. B. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <einzeilige Zielaussage aus Schritt 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <Konzept + Rolle + Anti-Prioren, aus Schritt 1>
```

#### 2b. Schlüsselresultate (überprüfbare Ergebnisse)

Ersetze jedes `keyresult-kr*_TBD_short_label`. Jedes KR ist eine Regel, die bestehen können muss. Füge so viele hinzu, wie die Aufgabe hat.

```yaml
keyresult-kr1-top-pick-committed:
  name: <überprüfbares Ergebnis 1>
  level: error
  desc:
  - <was als Bestehen zählt — konkretes Kriterium, nicht "sieht gut aus">
```

#### 2c. Aufgabenspezifische Regeln (Randbedingungen für Kandidaten)

Ersetze jedes `TBD_task_id-*` durch eine echte Randbedingungs-ID, die zum task-id-Suffix des Ziels passt. Schneide die nicht passenden weg, füge bei Bedarf neue hinzu.

Häufige Muster:
- `must-be-X-not-Y` — Konzeptausrichtung (z. B. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — harte D1-Spanne
- `must-imply-<archetype>` — D7-Bindung
- `<domain>-specific-acceptable` / `not-acceptable` — Erlaubnis für eine enge Domäne
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <Randbedingung, z. B. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <was der Kandidat erfüllen muss>
  - <welche D1-D7-Dimension diese Regel einschränkt>
  tldr:
  - wrong: <Gegenbeispiel>
  - right: <gutes Beispiel>
```

#### 2d. Sitzungsprotokoll (Audit-Spur zur Zielregel)

Fülle alle 4 Unterabschnitte aus:

**prefer** — **MUSS** alle 5 Fragen beantworten, selbst wenn die Antwort "nein / schwach" lautet:
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<Liste enger Domänen, die okay sind, z. B. [naval]>]   # [] = keine enge Domäne okay
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — ein Eintrag je betrachtetem Kandidaten, auch für die abgelehnten:
```yaml
init_verdicts:
  - { name: <Kandidat>, gate: init-005 | init-006 | init-007 | pass, reason: "<warum>" }
  # init-005 = Rotlinien-Muster-Treffer (automatische Ablehnung)
  # init-006 = erste Bedeutung im Wörterbuch widerspricht dem Ziel
  # init-007 = Länge außerhalb des Bereichs (< 2 oder > 8)
  # pass     = alle init-Gates bestanden, für das Scoring zugelassen
```

**scores** — ein Eintrag je Kandidaten, der init bestanden hat. Alle Scores >= 6.0. Jeder Score **MUSS** Anker haben:
```yaml
scores:
  - name: <Kandidat>
    score: <0_to_10>
    anchors:
      - "D1: <Beleg für die Buchstabenanzahl>"
      - "D2: <Beleg für die erste Wörterbuchbedeutung>"
      - "D3: <Beleg für die wörtliche Kompositbedeutung>"
      - "D4: <Beleg für trial vs. real>"
      - "D5: <Beleg für run vs. test>"
      - "D6: <Beleg für Anschaulichkeit>"
      - "D7: <Beleg für große Ausrüstung>"
    misses:
      - "<was fehlt — nur echte Fehlstellen auflisten, nicht immer alle 7>"
```

**final** — Auswahl plus Rückfall festlegen:
```yaml
final:
  pick: <gewinnender Kandidat>
  backup: <zweitbester_oder_null>
```

### Schritt 3 · Mit der Meta-Regel auditieren

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

Der OKR-Creator (in `template/naming.okr-creator.yml`) führt 11 Prüfungen aus (eine Mischung aus error und warn):

| Prüfung | Stufe | Was sie verifiziert |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | Die Datei hat >=1 `goal-*`-Regel |
| `okr-creator-002` has-keyresult-rules | error | Die Datei hat >=1 `keyresult-*`-Regel |
| `okr-creator-003` has-task-specific-rules | error | Die Datei hat >=1 Aufgabenregel (weder goal noch keyresult) |
| `okr-creator-010` has-session-record | error | Die Zielregel hat ein `session:`-Feld |
| `okr-creator-011` prefer-answers-all-five | error | Alle 5 Fragen aus init-004 sind beantwortet |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts ist nicht leer |
| `okr-creator-013` scores-have-anchors | error | Jeder Score hat eine nicht-leere Ankerliste |
| `okr-creator-014` scores-no-below-6 | error | Alle Scores >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` ist gesetzt |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | Score des pick >= 7.0 |

**Wenn eine error-Prüfung fehlschlägt**: Datei reparieren und erneut ausführen. Häufige Korrekturen:
- Fehlendes prefer-Feld → zu `session.prefer` hinzufügen
- Nackter Score → `anchors: [...]` hinzufügen
- Score < 6 → nach `init_verdicts` verschieben (abgelehnt) oder den Score neu fassen
- Fehlendes final → `final: { pick, backup }` hinzufügen

**Wenn warn-Prüfungen fehlschlagen**: entscheide, ob du das angehst oder den Trade-off dokumentierst.

### Schritt 4 · Der Benutzer wählt den endgültigen Namen

Der Skill schlägt vor; der Benutzer entscheidet. Der endgültige Name wird in `session.final.pick` festgelegt und committet.

## Dateien

| Datei | Rolle | Format |
|---|---|---|
| `SKILL.md` | Diese Datei — Workflow + Dateiindex | markdown |
| `naming.template.yml` | VORLAGE mit `TBD_*`-Platzhaltern — kopieren, umbenennen, ausfüllen | `.rule` |
| `naming.trial-run-module.yml` | Durchgearbeitetes Beispiel eines vollständigen Sitzungsprotokolls | `.rule` |
| `template/naming-concept.yml` | Objektives Bewertungsframework (D1–D7, Rotlinien, Scoring-Anker) — als `.rule`-Einträge | `.rule` |
| `template/naming-brand.yml` | x-cmd-Markenregeln (Länge, Groß-/Kleinschreibung, Prior-Präferenzen) — als `.rule`-Einträge | `.rule` |
| `template/naming.okr-creator.yml` | Meta-Regel: auditiert eine `naming.<user-task>.yml` (die 11 Prüfungen oben) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Optionale x-cmd-Modulnamens-Voreinstellung (Start-Sitzungsprotokoll) | `.rule` |

## Subjektiv vs. objektiv

| Objektiv (in Dateien / Code) | Subjektiv (bei init abgefragt, nicht gescort) |
|---|---|
| Erste Bedeutung im Wörterbuch | "Ich will anschaulich statt abstrakt" |
| Buchstabenanzahl | "Ich will Domäne X akzeptiert" |
| Semantikklasse Trial / Real / Run / Test | "Ich will die Marine-Metapher okay oder nicht" |
| Wörtliche Kompositbedeutung | "Ich will chinesischen statt englischen Ursprung" |
| Prior-Verschmutzung (unittest testcase, dryrun) | "Ich will kurz statt selbsterklärend" |

## Regeln

- **MUSS** zuerst das Ziel recherchieren — was benannt wird, welche Rolle es spielt, welches Konzept verankert.
- **MUSS** von `naming.template.yml` starten (TBD_*-Platzhalter) und je nach Aufgabe zuschneiden / ausfüllen.
- **MUSS** eine `naming.<user-task>.yml` (`.rule`-Format) mit Ziel / Schlüsselresultaten / Aufgabenregeln / Sitzungsprotokoll erzeugen.
- **MUSS** `x rule check` mit `template/naming.okr-creator.yml` ausführen, um das Sitzungsprotokoll zu auditieren.
- **MUSS** Scores in objektiven Fakten verankern — niemals aufgrund der Reaktion des Benutzers hoch- oder runter-adjustieren.
- **MUSS** den Benutzer den endgültigen Namen wählen lassen — der Skill schlägt vor, der Benutzer entscheidet.
- **DARF NICHT** subjektive Regeln zu `template/naming-concept.yml` hinzufügen — die gehören in das aufgabenspezifische `session.prefer`.

## Verwandt

- [rule](../rule/SKILL.md) — die Naming-Sitzung wird über x rule geprüft
- [score](../score/SKILL.md) — Kandidaten werden über das Score-Framework bewertet
- [ontology-database](../ontology-database/SKILL.md) — der gewählte Name bleibt in ondb bestehen
