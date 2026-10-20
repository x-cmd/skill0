---
name: prompt
description: Convenciones de ingeniería de prompts para x-cmd — reutilización mediante variables de plantilla, reglas de estructura, patrones de aplicación de la seguridad.
metadata:
  related: "devloop,rule"
---


# Prompt

## Principio central: reutiliza, no dupliques

Los prompts en x-cmd se ensamblan a partir de fragmentos reutilizables, no se escriben como monolitos. Una plantilla de prompt contiene variables `<PLACEHOLDER>` que el módulo de shell resuelve en tiempo de ejecución.

Ejemplo de `claw`:
```
first_contact.md          # independiente — se carga en <FIRST_CONTACT_PROMPT>
msg_telegram.md           # ensambla: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # mismos fragmentos, adaptador de plataforma distinto
heartbeat.md              # flujo de trabajo distinto, comparte <CHECK_PROMPT>
```

**Por qué**: una corrección se propaga a todas partes. Los adaptadores de plataforma (Telegram, Feishu, WeChat) comparten reglas de comportamiento pero difieren en comandos de envío y límites de formato.

Consulta [reusing.md](reusing.md) para los patrones detallados de reutilización.

## Reglas de estructura

- Cada archivo de prompt es un conjunto de instrucciones completo y autónomo para un escenario
- Usa marcadores `<UPPER_CASE>` para variables — nunca incrustes datos reales
- Los marcadores los resuelve el módulo que llama, no el propio prompt
- Fragmento = función (lógica y flujo), los datos se añaden en tiempo de ejecución (como pasar argumentos)

## Patrón de aplicación de la seguridad

Las reglas de seguridad y de comportamiento DEBEN ser explícitas y firmes:

```
=== REGLAS INQUEBRANTABLES ===
>> REGLA 1: Tu stdout es INVISIBLE. Cada respuesta DEBE usar el comando de envío. <<
>> REGLA 2: Responde PRIMERO, piensa DESPUÉS. Para tareas no triviales, envía el acuse de inmediato. <<
>> REGLA 3: Tareas complejas/largas → usa `x agent run`. NO bloquees al usuario. <<
```

Usa DEBES, NUNCA, NO HAGAS. Consulta [skill0-writer](../skill0-writer/SKILL.md) para la regla del lenguaje de seguridad.

## Patrón de guía de formato

Cuando los prompts apuntan a varias plataformas con distintas capacidades de formato:

```
GUÍA DE FORMATO:
- WeChat / WeChat empresarial: formato limitado. Texto plano, listas, emoji. Sin tablas.
- Telegram: markdown completo, incluidas tablas. Máx. 4096 caracteres.
- Feishu: markdown completo. Los mensajes de tarjeta necesitan JSON.
```

## Ejemplos reales

Los fragmentos de prompt viven hoy en el `lib/data/prompt/` de cada módulo (p. ej. `claw/lib/data/prompt/`).
Migrarán a `skill0/lib/skill0/<subskill>/` — misma estructura, ubicación canónica.

Ejemplos actuales en `claw/lib/data/prompt/`:
- `first_contact.md` — saludo de espacio de trabajo nuevo, fragmento reutilizable
- `heartbeat.md` — agente en segundo plano, lee el estado del espacio de trabajo
- `msg_<platform>.md` — manejadores de mensaje por plataforma, comparten fragmentos comunes

## Relacionadas

- [devloop](../devloop/SKILL.md) — los prompts suelen marcar las tareas de devloop
- [rule](../rule/SKILL.md) — las reglas de estructura de prompts las aplica x rule
