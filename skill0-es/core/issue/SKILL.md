---
name: issue
description: Gestión de incidencias para devloop — plantillas para objetivo, rule.yml, resultados clave y ciclo de vida de la incidencia.
metadata:
  related: "devloop,repo"
---


# issue

Parte de [devloop](../devloop/SKILL.md).

## Plantilla de incidencia de desarrollo nueva

```
gh issue create --title "<ámbito>: <descripción corta>" --body "$(cat <<'EOF'
## Objetivo
<objetivo en una línea>

## Resultados clave
- [ ] KR-1: <resultado verificable>
- [ ] KR-2: <resultado verificable>

## rule.yml
```yaml
goal: "<igual que arriba>"
keyresults:
  - kr-1: "<igual que arriba>"
  - kr-2: "<igual que arriba>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<patrón de archivo>"
    level: error
    desc:
    - <criterio>
```

## Capturas de pantalla
- Antes: <imagen o "N/D">
- Después: <imagen o "pendiente">
EOF
)"
```

## Ciclo de vida de la incidencia

| Etapa | Acción | Contenido del comentario |
|-------|--------|-----------------|
| Creada | `gh issue create` con la plantilla | objetivo, resultados clave, rule.yml |
| En curso | Actualizar según avanza el trabajo | notas de avance, capturas intermedias |
| Verificada | `x rule check` pasa | resultado del rule check, captura final |
| Cerrada | `gh issue close` | SHA del commit, resumen de la verificación final |

## Plantilla del comentario de cierre

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verificado
- rule.yml: <bloque de código o enlace>
- x rule check: PASS
- Antes: <imagen>
- Después: <imagen>
- Commit: <sha>
EOF
)"
```

## Reglas

- **DEBES** incluir `goal` y `keyresults` en toda incidencia de desarrollo — sin excepciones
- **DEBES** publicar rule.yml como bloque de código en el cuerpo de la incidencia o en el primer comentario
- **DEBES** hacer capturas antes y después para los cambios de frontend
- **NUNCA** cierres una incidencia sin evidencia de verificación
- Enlaza las incidencias al tablero del proyecto para que se vean en el roadmap

## Relacionadas

- [devloop](../devloop/SKILL.md) — gestor de los bucles dirigidos por objetivos (objetivo/rule.yml/KRs)
- [repo](../repo/SKILL.md) — las incidencias se enganchan a repos en la disposición x-repo
