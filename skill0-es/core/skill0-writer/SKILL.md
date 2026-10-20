---
name: skill0-writer
description: Convenciones de escritura para documentos de skill0 — estructura piramidal, límites de líneas y reglas de disposición.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Los documentos de skill0 siguen el **principio piramidal**: los agentes pueden leer solo las primeras 10–30 líneas, así que la información más importante va primero. El detalle más allá de la línea 30 es un extra, no la carga.

## Lo que ninguna regla atrapa

- **Claridad antes que brevedad.** Un documento corto que da una respuesta equivocada es peor que uno largo que da la correcta.
- **Las advertencias de seguridad /safety DEBEN ser explícitas** — usa DEBES, NUNCA, NO HAGAS. Enuncia los matices como afirmaciones completas, no como paréntesis.
- **No desarrolles el conocimiento común.** Si una palabra de convención más una o dos frases transmiten la idea, detente. El lector ya sabe qué son YAML, git y una caché; gasta el contexto en lo específico de este repo. La justificación es el principal culpable — da el motivo de una regla solo cuando parece incorrecta sin él. (`sw-1200`)
- **Tablas solo para matrices reales.** 3+ columnas cuyas filas deben leerse unas contra otras. Una tabla de dos columnas es una lista con sintaxis de tabla — escribe la lista. Un dataset va en un `.tsv` externo junto al doc, enlazado, para que `x tsv` pueda consultarlo. (`sw-1250`)

## YFM — solo `SKILL.md`

```yaml
---
name: <slug>                  # debe ser igual al nombre del directorio
description: <resumen de 1-2 frases que el agente usa para decidir si la carga>
---
```

`name` y `description` son los que sostienen el peso. Todo lo demás se anida bajo el bloque `metadata:` de [yfm](../yfm/SKILL.md) como escalares separados por comas — opcional, y añade estructura para indexación, descubrimiento y enganches de ontología.

**Los subarchivos no llevan YFM.** Solo `SKILL.md` lo filtra un cargador, así que solo él necesita front matter. Cualquier otro archivo (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) lo lee directamente un agente que ya decidió abrirlo — el YFM ahí es puro coste de tokens, repite un propósito que el título y la primera línea ya dan. Empieza esos archivos en el encabezado `#`. Desviarse requiere un motivo declarado en el propio archivo.

Para versiones localizadas al chino, usa un `SKILL.cn.md` paralelo (uno por skill). No mezcles idiomas dentro de un mismo archivo.

## Comprobaciones mecánicas

Viven en [skill0-writer.rule.yml](skill0-writer.rule.yml). Ejecuta `x rule lint skill0-writer.rule.yml` y `x rule check -r skill0-writer.rule.yml lib/skill0/`. Cobertura: presencia de YFM + campos name/description, formato del name, número de líneas ≤ 100 (ideal 50), orden de secciones install → usage → advanced → links, solo inglés, sin intro / sin conclusión / sin repetición, sin archivos huérfanos.

## Comprobación de seguridad ante el truncamiento

Tras escribir, revisa en la línea 30: ¿un agente que se detuviera aquí formaría una comprensión equivocada?

Si es así, adelanta el matiz crítico. Las primeras 30 líneas deben dar un modelo mental correcto (aunque incompleto). Más allá de la línea 30, amplía con detalle — la pirámide se autocorrige.

## Carga en dos capas: description para coincidir, body para consultar

Los cargadores de skills (Claude Code, Cursor, Continue, etc.) cargan SKILL.md en dos etapas:

  1. **YFM `description:`** — se carga automáticamente en el catálogo del agente
     para la coincidencia. El agente lee la descripción para decidir si
     cargar la skill.
  2. **Body** — se carga bajo demanda tras una coincidencia. Material de consulta.

Implicaciones:

- **Description** = *qué es + cuándo cargarla* — densa en palabras clave,
  rica en disparadores, escueta.
- **Body** = *cómo usarla + referencia* — ejemplos, esquemas, casos
  límite, enlaces a documentación más profunda.

**No dupliques contenido entre las dos capas.** Lo que la descripción transmita, el body debería *desarrollarlo*, no repetir la misma superficie. En particular, el primer párrafo del body no debe listar las mismas características que la descripción — el body empieza con la referencia, no con un segundo resumen.

Una prueba práctica: si borras la descripción entera y solo lees las primeras 30 líneas del body, el agente debería seguir viendo qué hace la skill y cuándo cargarla. Si solo la descripción aporta esa información, el body no añade nada arriba — mueve la explicación al body y deja que la descripción cargue con el titular.

## Una skill es un paquete de conocimiento, no un tutorial

El body de una skill es un **informe para el LLM**, no un curso para principiantes.

- **La capacidad** vive en el LLM. El body no enseña.
- **El conocimiento** vive en las herramientas de datos de x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) y fuentes externas. El body apunta; el agente vuelve a consultarlo.
- **El encuadre** es trabajo de la skill: nombrar la forma del problema, la convención, la salida estructurada, la herramienta de x-cmd que se debe usar.

Una skill carga el ángulo de resolución, la convención, la forma de la salida y punteros a fuentes. **No** carga capacidad (el LLM ya la tiene), datos estáticos (se pudren) ni tutoriales (usa sidecars).

Cuando los detalles sean demasiado específicos o demasiado volátiles, empújalos a un sidecar (`references/`, `ANALYTICS.md`) o a documentación externa siempre actualizada.

## Enlaces externos

Recopila dos tipos: **enlaces raíz** (puntos de entrada como `llms.txt`, índice de docs) y **enlaces útiles** (enlaces dirigidos para ese 20% de docs que cubre el 80% de los casos de uso). Lista primero la raíz, después los útiles — la IA entiende el orden. **Sin duplicación** salvo que el énfasis sea crítico.

## Matices blandos (decisiones de criterio)

- **Los subarchivos (CLEANUP.md, references/*)** pueden ser más largos que SKILL.md, pero las primeras 20 líneas siguen sosteniendo la carga (la misma pirámide).
- **DEBES** enlazar cada subarchivo desde su SKILL.md padre (enlace hacia adelante obligatorio). El enlace de vuelta al SKILL.md padre desde un subarchivo es **opcional** — los archivos usecase referencian al padre implícitamente por su ruta. Lo aplica `sw-1000-no-orphan-docs` en [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Especulación** — enuncia hechos comprobados, o etiquétalos como "sin probar".
- **Emojis** salvo que el tema de la skill los requiera.

## Relacionadas

- [yfm](../yfm/SKILL.md) — convención YFM que skill0-writer aplica en la capa 1
- [naming](../naming/SKILL.md) — la nomenclatura también sigue las reglas de escritura
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — aplicación mecánica
