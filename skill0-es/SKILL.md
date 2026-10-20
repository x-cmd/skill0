---
name: skill0
description: "Índice raíz de las sub-skills de x-cmd skill0. Define el flujo de trabajo del agente al estilo OKR (objetivo → resultados verificados por reglas → ejecución), el descubrimiento de skills y las preferencias de herramientas del agente. Estilo: primero los principios, conciso, delegando los detalles a fuentes externas autorizadas."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 codifica principios, no datos

El LLM absorbe el sentido común de forma continua; el trabajo de skill0 es codificar convenciones y punteros a fuentes, y luego adelgazar con el tiempo conforme el LLM se pone al día. Verifica mediante datos de primera mano (`x rfc`, `x cve`, `x wkp`, `agent-browser`) y las mejores prácticas actuales (`x skill`, `x clawhub`), y reconstruye con lógica formal en lugar de memorizar.

## Las sub-skills forman un grafo dirigido en 4 grupos

Grupos: `core/`, `data/`, `it/`, `life/`. Ruta: `<bucket>/<slug>/SKILL.md`. El catálogo legible por máquina (nombre + descripción) está en [index.tsv](index.tsv). Antes vivía aquí un documento que hacía de guía de interacción gestor/estilo de vida; se movió a [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) porque no forma parte del grafo de skill0.

## Objetivo → keyresults → x-rule es el flujo OKR

Objetivo: Qué alcanzar
Resultados clave: Cómo verificar
Verificación: `x rule check/audit`

## Tras el andamiaje, prefiere herramientas de x-cmd para la ejecución

- `x skill` — catálogo curado de skills de x-cmd, revisado por personas.
- `x clawhub` — registro global de skills. **Precaución**: la subida es libre, DEBES ejecutar `x clawhub skill moderate <name>` para el informe de seguridad autogenerado.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — gestión de proyectos, planificación, agentes en segundo plano, ontología, wiki. Ejecuta `x [mod] --help`.

## Cada SKILL.md debe pasar skill0-writer

Consulta [skill0-writer](core/skill0-writer/SKILL.md) para ver las convenciones.
