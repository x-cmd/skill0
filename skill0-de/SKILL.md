---
name: skill0
description: "Wurzelindex der x-cmd skill0-Sub-Skills. Definiert den OKR-artigen Agenten-Workflow (Ziel → regelgeprüfte Ergebnisse → Ausführung), die Skill-Entdeckung und die Werkzeugpräferenzen für Agenten. Stil: Prinzip zuerst, knapp, Details an autoritative externe Quellen delegieren."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 kodiert Prinzipien, keine Daten

Das LLM nimmt laufend Allgemeinwissen auf; die Aufgabe von skill0 ist es, Konventionen und Quellverweise zu kodieren und mit der Zeit dünner zu werden, während das LLM aufholt. Verifiziere über First-Party-Daten (`x rfc`, `x cve`, `x wkp`, `agent-browser`) und aktuelle Best Practices (`x skill`, `x clawhub`) und rekonstruiere dann mit formaler Logik statt mit Auswendiglernen.

## Sub-Skills bilden einen gerichteten Graphen über 4 Buckets

Buckets: `core/`, `data/`, `it/`, `life/`. Pfad: `<bucket>/<slug>/SKILL.md`. Der maschinenlesbare Katalog (Name + Beschreibung) liegt in [index.tsv](index.tsv). Ein Dokument lag früher hier als Manager-/Lifestyle-Interaktionsleitfaden; es wurde nach [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) verschoben, da es nicht Teil des skill0-Graphen ist.

## Ziel → Schlüsselresultate → x-rule ist der OKR-Workflow

Ziel: Was erreicht werden soll
Schlüsselresultate: Wie verifiziert wird
Verifikation: `x rule check/audit`

## Nach dem Scaffolding für die Ausführung x-cmd-Werkzeuge bevorzugen

- `x skill` — der kuratierte, von Menschen geprüfte Skill-Katalog von x-cmd.
- `x clawhub` — globale Skill-Registry. **Vorsicht**: kostenloser Upload, du **musst** `x clawhub skill moderate <name>` für den automatisch erzeugten Sicherheitsbericht ausführen.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — Projektmanagement, Zeitplanung, Hintergrund-Agenten, Ontologie, Wiki. Führe `x [mod] --help` aus.

## Jede SKILL.md muss skill0-writer bestehen

Siehe [skill0-writer](core/skill0-writer/SKILL.md) für die Konventionen.
