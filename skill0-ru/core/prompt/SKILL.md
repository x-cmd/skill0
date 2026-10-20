---
name: prompt
description: Соглашения prompt-инжиниринга для x-cmd — повторное использование через шаблонные переменные, правила структуры, паттерны принудительной безопасности.
metadata:
  related: "devloop,rule"
---


# Prompt

## Базовый принцип: повторное использование, а не копирование

Промпты в x-cmd собираются из переиспользуемых фрагментов, а не пишутся как монолиты. Шаблон промпта содержит переменные `<PLACEHOLDER>`, которые разрешаются во время выполнения shell-модулем.

Пример из `claw`:
```
first_contact.md          # самостоятельный — загружается в <FIRST_CONTACT_PROMPT>
msg_telegram.md           # собирает: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # те же фрагменты, другой адаптер платформы
heartbeat.md              # другой рабочий процесс, общий <CHECK_PROMPT>
```

**Зачем**: одно исправление распространяется на всё. Адаптеры платформ (Telegram, Feishu, WeChat) разделяют поведенческие правила, но отличаются командами отправки и ограничениями форматирования.

Подробные паттерны повторного использования см. в [reusing.md](reusing.md).

## Правила структуры

- Каждый файл промпта — полный, самодостаточный набор инструкций для одного сценария
- Используйте плейсхолдеры `<UPPER_CASE>` для переменных — никогда не вставляйте реальные данные в код
- Плейсхолдеры разрешаются вызывающим модулем, а не самим промптом
- Фрагмент = функция (логика и поток), данные добавляются во время выполнения (как передача аргументов)

## Паттерн принудительной безопасности

Правила безопасности и поведения ДОЛЖНЫ быть явными и сильными:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Используйте MUST, NEVER, DO NOT. См. правило языка безопасности в [skill0-writer](../skill0-writer/SKILL.md).

## Паттерн руководства по формату

Когда промпты адресованы нескольким платформам с разными возможностями форматирования:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Реальные примеры

Фрагменты промптов сейчас живут в `lib/data/prompt/` каждого модуля (например, `claw/lib/data/prompt/`).
Позднее они переедут в `skill0/lib/skill0/<subskill>/` — та же структура, каноническое расположение.

Текущие примеры в `claw/lib/data/prompt/`:
- `first_contact.md` — приветствие нового рабочего пространства, переиспользуемый фрагмент
- `heartbeat.md` — фоновый агент, читает состояние рабочего пространства
- `msg_<platform>.md` — обработчики сообщений для каждой платформы, разделяют общие фрагменты

## Связанное

- [devloop](../devloop/SKILL.md) — промпты часто управляют задачами devloop
- [rule](../rule/SKILL.md) — правила структуры промптов обеспечиваются x rule
