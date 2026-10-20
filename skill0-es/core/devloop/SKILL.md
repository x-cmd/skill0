---
name: devloop
description: Bucle de desarrollo dirigido por objetivos — define el objetivo, escribe reglas con resultados clave, verifica visualmente, sincroniza con el gestor de incidencias.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Preparación

```
x rule init :ror                          # o un conjunto de reglas específico del proyecto
x env use agent-browser                   # para la verificación visual
```

## Flujo de trabajo

```
objetivo → rule.yml → código → verificar → incidencia
```

### 1. Define el objetivo → escribe rule.yml

Antes de programar, crea un rule.yml para la tarea:

```yaml
goal: "Corregir la versión en inglés que muestra etiquetas chinas en la sección Features"
keyresults:
  - kr-1: "En modo inglés, todas las etiquetas de Features están en inglés"
  - kr-2: "En modo chino, las etiquetas de Features siguen en chino"
  - kr-3: "La compilación pasa sin regresiones"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Cuando language=en, todos los elementos de details[] deben estar en inglés
    - Ningún distintivo de etiqueta puede contener caracteres chinos en modo inglés
```

Campos de una regla: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Consulta `x rule -h`.

**DEBES** incluir `goal` y `keyresults` — los dos campos obligatorios de toda tarea de desarrollo.

### 2. Ejecuta → verificación visual (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... realiza los cambios ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**DEBES** hacer captura antes y después. Compara con la intención:
1. Comprobación visual por IA: ¿coincide after.png con el objetivo?
2. Si no coincide → itera y vuelve a capturar
3. **Elimina todos los datos privados** (tokens, correos, información personal) antes de subir

### 3. Verifica con x rule

```
x rule scan <files>     # rápido (~1 min), para el bucle interno
x rule check <files>    # exhaustivo (~10 min)
x rule audit <files>    # informe completo (~30 min)
```

### 4. Sincroniza con el gestor de incidencias

Consulta [issue/SKILL.md](../issue/SKILL.md). Mínimo: publica el objetivo, los resultados clave, rule.yml y las capturas antes/después en la incidencia.

## Herramientas del agente

- `x rule scan` — comprobación rápida durante la iteración
- `x rule check` — cumplimiento completo antes de confirmar
- `agent-browser screenshot` — prueba visual antes/después
- `gh issue create/comment` — sincroniza objetivo + rule.yml con el gestor

## Relacionadas

- [rule](../rule/SKILL.md) — rule.yml es el esqueleto de verificación
- [score](../score/SKILL.md) — la puntuación de KR usa el marco de score
- [install](../install/SKILL.md) — prepara el entorno de desarrollo
- [agent-browser](../../it/agent-browser/SKILL.md) — verificación visual antes/después
- [issue](../issue/SKILL.md) — sincroniza objetivo + KRs + capturas con el gestor de incidencias
- [repo](../repo/SKILL.md) — descarga/sube el trabajo en los repos
- [prompt](../prompt/SKILL.md) — las convenciones de prompt suelen marcar las tareas de devloop
