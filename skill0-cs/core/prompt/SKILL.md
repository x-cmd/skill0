---
name: prompt
description: Konvence prompt engineeringu pro x-cmd — znovuvyužití přes template proměnné, pravidla struktury, vzory vynucování bezpečnosti.
metadata:
  related: "devloop,rule"
---


# Prompt

## Základní princip: znovuvyužívat, ne duplikovat

Prompty v x-cmd se skládají ze znovuvyužitelných fragmentů, nejsou psané jako monolitní bloky. Šablona promptu obsahuje proměnné `<PLACEHOLDER>`, které za běhu vyhodnocuje shell modul.

Příklad z `claw`:
```
first_contact.md          # samostatný — načítá se do <FIRST_CONTACT_PROMPT>
msg_telegram.md           # skládá: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # stejné fragmenty, jiný adaptér platformy
heartbeat.md              # jiný workflow, sdílí <CHECK_PROMPT>
```

**Proč**: jedna oprava se propaguje všude. Platformní adaptéry (Telegram, Feishu, WeChat) sdílejí pravidla chování, ale liší se příkazy odesílání a limity formátování.

Podrobné vzory znovuvyužití najdeš v [reusing.md](reusing.md).

## Pravidla struktury

- Každý soubor promptu je kompletní, samostatná sada instrukcí pro jeden scénář
- Pro proměnné používej placeholdery `<UPPER_CASE>` — nikdy nevkládej skutečná data přímo
- Placeholdery vyhodnocuje volající modul, ne samotný prompt
- Fragment = funkce (logika a tok), data se přidávají za běhu (jako nastavování argumentů)

## Vzor vynucování bezpečnosti

Bezpečnostní pravidla a pravidla chování MUSÍ být explicitní a důrazná:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Používej MUSÍ, NIKDY, NEPOUŽÍVEJ. Bezpečnostní jazykové pravidlo najdeš v [skill0-writer](../skill0-writer/SKILL.md).

## Vzor průvodce formátováním

Když prompty míří na více platforem s různými formátovacími schopnostmi:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Skutečné příklady

Fragmenty promptů dnes žijí v `lib/data/prompt/` každého modulu (např. `claw/lib/data/prompt/`).
Migrují do `skill0/lib/skill0/<subskill>/` — stejná struktura, kanonické umístění.

Současné příklady v `claw/lib/data/prompt/`:
- `first_contact.md` — uvítání nového workspace, znovuvyužitelný fragment
- `heartbeat.md` — agent na pozadí, čte stav workspace
- `msg_<platform>.md` — obslužné rutiny zpráv pro jednotlivé platformy, sdílejí společné fragmenty

## Související

- [devloop](../devloop/SKILL.md) — prompty často řídí úlohy devloopu
- [rule](../rule/SKILL.md) — pravidla struktury promptů vynucuje x rule
