---
name: prompt
description: Konwencje inżynierii promptów dla x-cmd — ponowne użycie przez zmienne szablonu, reguły struktury, wzorce egzekwowania bezpieczeństwa.
metadata:
  related: "devloop,rule"
---


# Prompt

## Zasada podstawowa: używaj ponownie, nie duplikuj

Prompty w x-cmd są składane z fragmentów wielokrotnego użytku, a nie pisane jako monolity. Szablon promptu zawiera zmienne `<PLACEHOLDER>`, które moduł shella rozwiązuje w czasie działania.

Przykład z `claw`:
```
first_contact.md          # samodzielny — wczytywany do <FIRST_CONTACT_PROMPT>
msg_telegram.md           # składa: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # te same fragmenty, inny adapter platformy
heartbeat.md              # inny przepływ, współdzieli <CHECK_PROMPT>
```

**Dlaczego**: jedna poprawka rozchodzi się wszędzie. Adaptery platform (Telegram, Feishu, WeChat) dzielą reguły zachowania, ale różnią się poleceniami wysyłki i limitami formatowania.

Szczegółowe wzorce ponownego użycia znajdziesz w [reusing.md](reusing.md).

## Reguły struktury

- Każdy plik promptu to kompletny, samodzielny zestaw instrukcji dla jednego scenariusza
- Używaj symboli zastępczych `<UPPER_CASE>` dla zmiennych — nigdy nie osadzaj prawdziwych danych
- Symbole zastępcze rozwiązuje moduł wywołujący, nie sam prompt
- Fragment = funkcja (logika i przepływ), dane dokładane są w czasie działania (jak ustawianie argumentów)

## Wzorzec egzekwowania bezpieczeństwa

Reguły bezpieczeństwa i zachowania MUSZĄ być jawne i stanowcze:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Używaj MUST, NEVER, DO NOT. Zasada języka bezpieczeństwa opisana jest w [skill0-writer](../skill0-writer/SKILL.md).

## Wzorzec przewodnika formatowania

Gdy prompty celują w wiele platform o różnych możliwościach formatowania:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Prawdziwe przykłady

Fragmenty promptów mieszkają obecnie w `lib/data/prompt/` każdego modułu (np. `claw/lib/data/prompt/`).
Zostaną przeniesione do `skill0/lib/skill0/<subskill>/` — ta sama struktura, lokalizacja kanoniczna.

Obecne przykłady w `claw/lib/data/prompt/`:
- `first_contact.md` — powitanie nowej przestrzeni roboczej, fragment wielokrotnego użytku
- `heartbeat.md` — agent w tle, odczytuje stan przestrzeni roboczej
- `msg_<platform>.md` — obsługi wiadomości dla poszczególnych platform, dzielą wspólne fragmenty

## Powiązane

- [devloop](../devloop/SKILL.md) — prompty często napędzają zadania devloop
- [rule](../rule/SKILL.md) — reguły struktury promptów są egzekwowane przez x rule