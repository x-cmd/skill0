---
name: prompt
description: Convenzioni di prompt engineering per x-cmd — riuso tramite variabili di template, regole di struttura, schemi di enforcesment della sicurezza.
metadata:
  related: "devloop,rule"
---


# Prompt

## Principio fondamentale: riusa, non duplicare

I prompt in x-cmd sono assemblati da frammenti riusabili, non scritti come monoliti. Un template di prompt contiene variabili `<PLACEHOLDER>` che vengono risolte a runtime dal modulo shell.

Esempio da `claw`:
```
first_contact.md          # autonomo — caricato in <FIRST_CONTACT_PROMPT>
msg_telegram.md           # assembla: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # stessi frammenti, adattatore di piattaforma diverso
heartbeat.md              # workflow diverso, condivide <CHECK_PROMPT>
```

**Perché**: una correzione si propaga ovunque. Gli adattatori di piattaforma (Telegram, Feishu, WeChat) condividono le regole comportamentali ma differiscono nei comandi di invio e nei limiti di formattazione.

Per schemi di riuso dettagliati vedi [reusing.md](reusing.md).

## Regole di struttura

- Ogni file di prompt è un insieme di istruzioni completo e autosufficiente per uno scenario
- Usa placeholder `<UPPER_CASE>` per le variabili — mai dati reali inline
- I placeholder vengono risolti dal modulo chiamante, non dal prompt stesso
- Frammento = funzione (logica e flusso), i dati si aggiungono a runtime (come impostare argomenti)

## Schema di enforcesment della sicurezza

Le regole di sicurezza e comportamento DEVONO essere esplicite e perentorie:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Usa MUST, NEVER, DO NOT. Per la regola sul linguaggio di sicurezza vedi [skill0-writer](../skill0-writer/SKILL.md).

## Schema della guida di formattazione

Quando i prompt puntano a più piattaforme con capacità di formattazione diverse:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Esempi reali

I frammenti di prompt vivono attualmente in `lib/data/prompt/` di ogni modulo (ad es. `claw/lib/data/prompt/`).
Si trasferiranno in `skill0/lib/skill0/<subskill>/` — stessa struttura, posizione canonica.

Esempi attuali in `claw/lib/data/prompt/`:
- `first_contact.md` — saluto per un nuovo workspace, frammento riusabile
- `heartbeat.md` — agente in background, legge lo stato del workspace
- `msg_<platform>.md` — gestori di messaggi per piattaforma, condividono i frammenti comuni

## Related

- [devloop](../devloop/SKILL.md) — i prompt spesso guidano i task del devloop
- [rule](../rule/SKILL.md) — le regole di struttura dei prompt sono imposte da x rule