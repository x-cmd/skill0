---
name: prompt
description: Prompt-Engineering-Konventionen für x-cmd — Wiederverwendung über Template-Variablen, Strukturregeln, Muster zur Durchsetzung von Sicherheitsregeln.
metadata:
  related: "devloop,rule"
---


# Prompt

## Kernprinzip: wiederverwenden, nicht duplizieren

Prompts in x-cmd werden aus wiederverwendbaren Fragmenten zusammengesetzt, nicht als Monolithen geschrieben. Eine Prompt-Vorlage enthält `<PLACEHOLDER>`-Variablen, die zur Laufzeit vom Shell-Modul aufgelöst werden.

Beispiel aus `claw`:
```
first_contact.md          # eigenständig — wird in <FIRST_CONTACT_PROMPT> geladen
msg_telegram.md           # setzt zusammen: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # gleiche Fragmente, anderer Plattform-Adapter
heartbeat.md              # anderer Workflow, teilt <CHECK_PROMPT>
```

**Warum**: eine Korrektur wirkt überall. Plattform-Adapter (Telegram, Feishu, WeChat) teilen Verhaltensregeln, unterscheiden sich aber in Send-Befehlen und Formatierungsgrenzen.

Siehe [reusing.md](reusing.md) für detaillierte Wiederverwendungsmuster.

## Strukturregeln

- Jede Prompt-Datei ist ein vollständiger, in sich geschlossener Instruktionssatz für ein Szenario
- Nutze `<UPPER_CASE>`-Platzhalter für Variablen — niemals echte Daten inline einbetten
- Platzhalter werden vom aufrufenden Modul aufgelöst, nicht vom Prompt selbst
- Fragment = Funktion (Logik und Ablauf), Daten werden zur Laufzeit angehängt (wie beim Setzen von Argumenten)

## Muster zur Durchsetzung von Sicherheitsregeln

Sicherheits- und Verhaltensregeln MÜSSEN explizit und deutlich formuliert sein:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Verwende MUST, NEVER, DO NOT. Siehe [skill0-writer](../skill0-writer/SKILL.md) für die Regel zur Sicherheitssprache.

## Muster für einen Format-Leitfaden

Wenn Prompts mehrere Plattformen mit unterschiedlichen Formatierungsfähigkeiten ansteuern:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Echte Beispiele

Prompt-Fragmente liegen derzeit im `lib/data/prompt/` jedes Moduls (z. B. `claw/lib/data/prompt/`).
Sie werden nach `skill0/lib/skill0/<subskill>/` migrieren — gleiche Struktur, kanonischer Ort.

Aktuelle Beispiele in `claw/lib/data/prompt/`:
- `first_contact.md` — Begrüßung eines neuen Workspace, wiederverwendbares Fragment
- `heartbeat.md` — Hintergrund-Agent, liest den Workspace-Zustand
- `msg_<platform>.md` — Nachrichten-Handler pro Plattform, teilen gemeinsame Fragmente

## Verwandt

- [devloop](../devloop/SKILL.md) — Prompts treiben oft devloop-Aufgaben an
- [rule](../rule/SKILL.md) — Prompt-Strukturregeln werden von x rule durchgesetzt
