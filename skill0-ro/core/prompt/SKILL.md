---
name: prompt
description: Convenții de inginerie de prompt pentru x-cmd — reutilizare prin variabile de șablon, reguli de structură, tipare de impunere a siguranței.
metadata:
  related: "devloop,rule"
---


# Prompt

## Principiul de bază: reutilizează, nu duplica

Prompt-urile din x-cmd sunt asamblate din fragmente reutilizabile, nu scrise ca monolite. Un șablon de prompt conține variabile `<PLACEHOLDER>` care sunt rezolvate la runtime de modulul shell.

Exemplu din `claw`:
```
first_contact.md          # standalone — loaded into <FIRST_CONTACT_PROMPT>
msg_telegram.md           # assembles: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # same fragments, different platform adapter
heartbeat.md              # different workflow, shares <CHECK_PROMPT>
```

**De ce**: o singură reparare se propagă peste tot. Adapter-ele de platformă (Telegram, Feishu, WeChat) împart reguli de comportament dar diferă prin comenzile de trimitere și limitele de formatare.

Vezi [reusing.md](reusing.md) pentru tiparele de reutilizare în detaliu.

## Reguli de structură

- Fiecare fișier de prompt e un set complet și autonom de instrucțiuni pentru un singur scenariu
- Folosește placeholder-uri `<UPPER_CASE>` pentru variabile — niciodată date reale inline
- Placeholder-urile sunt rezolvate de modulul care apelează, nu de prompt
- Fragment = funcție (logica și fluxul), datele se adaugă la runtime (ca la setarea argumentelor)

## Tipar de impunere a siguranței

Regulile de siguranță și comportament TREBUIE să fie explicite și ferme:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Folosește MUST, NEVER, DO NOT. Vezi [skill0-writer](../skill0-writer/SKILL.md) pentru regula de limbaj de securitate.

## Tipar de ghid de formatare

Când prompt-urile vizează mai multe platforme cu capacități de formatare diferite:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Exemple reale

Fragmentele de prompt trăiesc momentan în `lib/data/prompt/` al fiecărui modul (de ex. `claw/lib/data/prompt/`).
Ele vor migra în `skill0/lib/skill0/<subskill>/` — aceeași structură, locație canonică.

Exemple actuale în `claw/lib/data/prompt/`:
- `first_contact.md` — salut pentru workspace nou, fragment reutilizabil
- `heartbeat.md` — agent în fundal, citește starea workspace-ului
- `msg_<platform>.md` — handler-e de mesaj per platformă, împart fragmente comune

## Related

- [devloop](../devloop/SKILL.md) — prompt-urile dictează adesea task-uri devloop
- [rule](../rule/SKILL.md) — regulile de structură a prompt-urilor sunt impuse de x rule