---
name: naming
description: |
  Marco de nomenclatura para módulos / comandos / subcomandos de x-cmd. Subjetivo + guiado por escenarios; la skill es una cáscara fina, NO un manual de reglas. Tres capas: investigación (objetivo), naming.<user-task>.yml (OKR + registro de sesión, un archivo .rule), naming.okr-creator.yml (meta-regla que audita la sesión).
metadata:
  related: "rule,score,ontology-database"
---


# Nomenclatura

Nombrar es **subjetivo + guiado por escenarios**. Esta skill es un **marco**, no un manual de reglas — no incorporates reglas de nomenclatura subjetivas.

## Mapa rápido

```
┌─────────────────────────────────────────────────────────┐
│  1. INVESTIGA el objetivo                               │
│     ¿Qué se está nombrando? ¿Qué rol? ¿Qué concepto?    │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (archivo .rule)              │
│     - goal-*        (la tarea de nomenclatura)          │
│     - keyresult-*   (resultados verificables)            │
│     - task-*        (restricciones de la tarea)          │
│     - session:      (traza de auditoría sobre la regla  │
│         prefer        objetivo)                         │
│         init_verdicts  (decisiones de filtro candidate) │
│         scores     (anclajes D1-D7 por candidato)        │
│         final      (elección + alternativa)              │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITA con template/naming.okr-creator.yml          │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Flujo de trabajo — paso a paso

### Paso 1 · Investiga el objetivo

Antes de escribir nada, responde a estas preguntas. NO las salte — sin respuestas, el scorer no puede anclar D4 (TRIAL/REAL) ni D5 (RUN/TEST).

- **¿Qué se está nombrando?** — módulo / subcomando / campo / variable — aplican reglas de forma distintas
- **¿Qué rol juega?** — ancla el concepto (p. ej. "módulo trial-run" → runner autónomo, Stage 1 de una prueba en dos etapas)
- **¿Qué prior DEBE cargar?** — el significado dominante de la palabra desnuda tiene que coincidir (p. ej. trial-run necesita TRIAL+RUN, no REAL+TEST)
- **¿Qué priors DEBE EVITAR?** — contaminación de unittest (`*test`/`*case`), falso (`*mock`/`*fake`/`*stub`/`*dry`), despliegue real (`field*`/`*live*`)
- **¿Qué arquetipo encaja?** — ship / plane / rocket / factory / abstract — determina D6/D7

Salida: una declaración de objetivo en una línea, por ejemplo
> "Elegir un nombre de módulo x-cmd autónomo para trial-run (Stage 1 de una prueba en dos etapas) que puntúe 8.0+ en D1-D7, se autoexplique de un vistazo y supere todos los fast-fail de línea roja / diccionario / longitud."

### Paso 2 · Crea el registro de sesión

Copia la plantilla y recorta / rellena.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Después rellena 4 secciones (de arriba abajo):

#### 2a. Regla de objetivo (la tarea de nomenclatura)

Sustituye `goal-TBD_task_id` por un ID real. El sufijo del ID debe reflejar la tarea (p. ej. `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <declaración de objetivo en una línea del Paso 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concepto + rol + anti-priors, del Paso 1>
```

#### 2b. Resultados clave (resultados verificables)

Sustituye cada `keyresult-kr*_TBD_short_label`. Cada KR es una regla que debe poder pasar. Añade tantos como tenga la tarea.

```yaml
keyresult-kr1-top-pick-committed:
  name: <resultado verificable 1>
  level: error
  desc:
  - <qué cuenta como aprobado — criterio concreto, no "parece bien">
```

#### 2c. Reglas específicas de la tarea (restricciones sobre los candidatos)

Sustituye cada `TBD_task_id-*` por un ID de restricción real que coincida con el sufijo task-id del objetivo. Recorta las que no apliquen, añade nuevas cuando haga falta.

Patrones habituales:
- `must-be-X-not-Y` — alineación de concepto (p. ej. `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — rango estricto de D1
- `must-imply-<archetype>` — vínculo de D7
- `<domain>-specific-acceptable` / `not-acceptable` — permiso de dominio estrecho
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <restricción, p. ej. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <qué debe cumplir el candidato>
  - <qué dimensión D1-D7 restringe esto>
  tldr:
  - wrong: <contraejemplo>
  - right: <buen ejemplo>
```

#### 2d. Registro de sesión (traza de auditoría sobre la regla de objetivo)

Rellena las 4 subsecciones:

**prefer** — DEBES responder a las 5 preguntas, aunque la respuesta sea "no / débil":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<lista de dominios estrechos OK, p. ej. [naval]>]   # [] = ningún dominio estrecho vale
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — una entrada por candidato considerado, incluidos los descartados:
```yaml
init_verdicts:
  - { name: <candidato>, gate: init-005 | init-006 | init-007 | pass, reason: "<por qué>" }
  # init-005 = coincide con patrón de línea roja (descarte automático)
  # init-006 = el primer significado del diccionario contradice el objetivo
  # init-007 = longitud fuera de rango (< 2 o > 8)
  # pass     = superó todos los filtros init, elegible para puntuación
```

**scores** — una entrada por candidato que superó init. Todas las puntuaciones >= 6.0. Cada puntuación DEBE tener anclajes:
```yaml
scores:
  - name: <candidato>
    score: <0_to_10>
    anchors:
      - "D1: <evidencia del número de letras>"
      - "D2: <evidencia del primer significado del diccionario>"
      - "D3: <evidencia del significado literal del compuesto>"
      - "D4: <evidencia de trial frente a real>"
      - "D5: <evidencia de run frente a test>"
      - "D6: <evidencia de vividness>"
      - "D7: <evidencia de equipamiento grande>"
    misses:
      - "<qué falta — enumera solo los fallos reales, no siempre las 7>"
```

**final** — declara la elección y la alternativa:
```yaml
final:
  pick: <candidato_ganador>
  backup: <segundo_clasificado_o_null>
```

### Paso 3 · Audita con la meta-regla

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

El okr-creator (en `template/naming.okr-creator.yml`) ejecuta 11 comprobaciones (mezcla de error y warn):

| Comprobación | Nivel | Qué verifica |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | el archivo tiene ≥1 regla `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | el archivo tiene ≥1 regla `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | el archivo tiene ≥1 regla de tarea (ni goal ni keyresult) |
| `okr-creator-010` has-session-record | error | la regla goal tiene el campo `session:` |
| `okr-creator-011` prefer-answers-all-five | error | las 5 preguntas de init-004 respondidas |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts no vacío |
| `okr-creator-013` scores-have-anchors | error | cada puntuación tiene lista de anchors no vacía |
| `okr-creator-014` scores-no-below-6 | error | todas las puntuaciones >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` declarado |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | puntuación del pick >= 7.0 |

**Si falla alguna comprobación de error**: corrige el archivo y vuelve a ejecutarlo. Arreglos habituales:
- Falta un campo de prefer → añádelo a `session.prefer`
- Puntuación sin anclaje → añade `anchors: [...]`
- Puntuación < 6 → muévela a `init_verdicts` (descartado) o replantea la puntuación
- Falta final → añade `final: { pick, backup }`

**Si fallan las comprobaciones warn**: decide si resolverlas o documentar el trade-off.

### Paso 4 · El usuario elige el nombre final

La skill propone; el usuario decide. El nombre final se declara en `session.final.pick` y se confirma.

## Archivos

| Archivo | Rol | Formato |
|---|---|---|
| `SKILL.md` | Este archivo — flujo de trabajo + índice de archivos | markdown |
| `naming.template.yml` | PLANTILLA con marcadores `TBD_*` — copia, renombra, rellena | `.rule` |
| `naming.trial-run-module.yml` | Ejemplo trabajado de un registro de sesión completo | `.rule` |
| `template/naming-concept.yml` | Marco de evaluación objetiva (D1–D7, líneas rojas, anclajes de puntuación) — como entradas `.rule` | `.rule` |
| `template/naming-brand.yml` | Reglas de marca de x-cmd (longitud, mayúsculas, preferencias de prior) — como entradas `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-regla: audita un `naming.<user-task>.yml` (las 11 comprobaciones de arriba) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset opcional de nomenclatura de módulos x-cmd (registro de sesión inicial) | `.rule` |

## Reparto subjetivo / objetivo

| Objetivo (en archivos / código) | Subjetivo (preguntado al inicio, no puntúa) |
|---|---|
| Primer significado del diccionario | "Prefiero vívido frente a abstracto" |
| Número de letras | "Acepto el dominio X" |
| Clase semántica trial / Real / Run / Test | "Acepto o no la metáfora naval" |
| Significado literal del compuesto | "Prefiero origen chino frente a inglés" |
| Contaminación de priors (testcase de unittest, dryrun) | "Prefiero corto frente a autoexplicativo" |

## Reglas

- **DEBES** investigar el objetivo primero — qué se nombra, qué rol juega, qué concepto lo ancla.
- **DEBES** partir de `naming.template.yml` (marcadores TBD_*) y recortar / rellenar según exija la tarea.
- **DEBES** producir un `naming.<user-task>.yml` (formato `.rule`) con objetivo / resultados clave / reglas de tarea / registro de sesión.
- **DEBES** ejecutar `x rule check` con `template/naming.okr-creator.yml` para auditar el registro de sesión.
- **DEBES** anclar las puntuaciones en hechos objetivos — nunca inflar ni rebajar según la reacción del usuario.
- **DEBES** dejar que el usuario elija el nombre final — la skill propone, el usuario decide.
- **NO DEBES** añadir reglas subjetivas a `template/naming-concept.yml` — esas van a `session.prefer` de cada tarea.

## Relacionadas

- [rule](../rule/SKILL.md) — la sesión de nomenclatura se comprueba vía x rule
- [score](../score/SKILL.md) — los candidatos se puntúan con el marco de score
- [ontology-database](../ontology-database/SKILL.md) — el nombre elegido persiste en ondb
