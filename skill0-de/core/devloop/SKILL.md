---
name: devloop
description: Zielgetriebener Entwicklungszyklus — Ziel definieren, Regeln mit Schlüsselresultaten schreiben, visuell verifizieren, mit dem Issue-Tracker synchronisieren.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # oder projektspezifisches Regelset
x env use agent-browser                   # für visuelle Verifikation
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. Ziel definieren → rule.yml schreiben

Erstelle vor dem Codieren eine rule.yml für die Aufgabe:

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

Regelfelder: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Siehe `x rule -h`.

**MUSS** `goal` und `keyresults` enthalten — die zwei Pflichtfelder für jede Entwicklungsaufgabe.

### 2. Ausführen → visuelle Verifikation (Frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... Änderungen vornehmen ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**MUSS** vor und nach der Änderung Screenshots machen. Vergleiche gegen die Absicht:
1. KI-Vision-Check: Passt after.png zum Ziel?
2. Wenn nicht → iterieren und erneut screenshotten
3. **Alle Privatsphäre-Daten entfernen** (Tokens, E-Mails, persönliche Infos) vor dem Upload

### 3. Mit x rule verifizieren

```
x rule scan <files>     # schnell (~1 Min.), für die innere Schleife
x rule check <files>    # gründlich (~10 Min.)
x rule audit <files>    # vollständiger Bericht (~30 Min.)
```

### 4. Mit dem Issue-Tracker synchronisieren

Siehe [issue/SKILL.md](../issue/SKILL.md). Minimum: Ziel, Schlüsselresultate, rule.yml sowie Before-/After-Screenshots ins Issue stellen.

## Agenten-Werkzeuge

- `x rule scan` — Schnellcheck während der Iteration
- `x rule check` — vollständige Compliance vor dem Commit
- `agent-browser screenshot` — visueller Beleg vorher/nachher
- `gh issue create/comment` — Ziel + rule.yml mit dem Tracker synchronisieren

## Verwandt

- [rule](../rule/SKILL.md) — rule.yml ist das Verifikationsgerüst
- [score](../score/SKILL.md) — KR-Scoring nutzt das Score-Framework
- [install](../install/SKILL.md) — richtet die Entwicklungsumgebung ein
- [agent-browser](../../it/agent-browser/SKILL.md) — visuelle Verifikation vorher/nachher
- [issue](../issue/SKILL.md) — synchronisiert Ziel + KRs + Screenshots mit dem Issue-Tracker
- [repo](../repo/SKILL.md) — holt/pusht Arbeit in Repos
- [prompt](../prompt/SKILL.md) — Prompt-Konventionen treiben oft devloop-Aufgaben an
