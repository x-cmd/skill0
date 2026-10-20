---
name: prompt
description: Устатovi prompt engineering в x-cmd — повторне використання через змінні шаблонів, правила структури, шаблони примусового забезпечення безпеки.
metadata:
  related: "devloop,rule"
---


# Prompt

## Головний принцип: повторно використовуй, не дублюй

Prompt-и в x-cmd збираються з багаторазових фрагментів, а не пишуться суцільними блоками. Шаблон prompt-у містить змінні `<PLACEHOLDER>`, які розкриваються під час виконання shell-модулем.

Приклад із `claw`:
```
first_contact.md          # standalone — loaded into <FIRST_CONTACT_PROMPT>
msg_telegram.md           # assembles: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # same fragments, different platform adapter
heartbeat.md              # different workflow, shares <CHECK_PROMPT>
```

**Чому**: одне виправлення розходиться на все. Платформні адаптери (Telegram, Feishu, WeChat) мають спільні правила поведінки, але різняться командами надсилання та обмеженнями форматування.

Детальні шаблони повторного використання див. у [reusing.md](reusing.md).

## Правила структури

- Кожен файл prompt-у — це повний, самодостатній набір інструкцій для одного сценарію
- Для змінних використовуй плейсхолдери `<UPPER_CASE>` — ніколи не вставляй справжні дані безпосередньо
- Плейсхолдери розкриває модуль, який викликає prompt, а не сам prompt
- Фрагмент = функція (логіка та потік), дані додаються під час виконання (як встановлення аргументів)

## Шаблон примусового забезпечення безпеки

Правила безпеки та поведінки МУСЯТЬ бути явними й категоричними:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Використовуй MUST, NEVER, DO NOT. Правило щодо мови безпеки див. у [skill0-writer](../skill0-writer/SKILL.md).

## Шаблон посібника з форматування

Коли prompt-и адресовані кільком платформам із різними можливостями форматування:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Справжні приклади

Фрагменти prompt-ів зараз розташовані в `lib/data/prompt/` кожного модуля (напр., `claw/lib/data/prompt/`).
Вони переїдуть до `skill0/lib/skill0/<subskill>/` — структура та сама, розташування канонічне.

Поточні приклади в `claw/lib/data/prompt/`:
- `first_contact.md` — привітання нового workspace, багаторазовий фрагмент
- `heartbeat.md` — фоновий агент, читає стан workspace
- `msg_<platform>.md` — обробники повідомлень для кожної платформи, спільні фрагменти

## Пов'язане

- [devloop](../devloop/SKILL.md) — prompt-и часто керують завданнями devloop
- [rule](../rule/SKILL.md) — правила структури prompt-ів забезпечує x rule