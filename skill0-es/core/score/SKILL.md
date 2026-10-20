---
name: score
description: |
  Marco de puntuación por dimensiones ponderadas para agentes de IA — "No adivines. Puntúa." Idea central: primero entender las necesidades, después redactar e iterar, el agente es el analista. Produce un TSV ordenado con `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"No adivines. Puntúa."
Marco de puntuación por dimensiones ponderadas para agentes de IA.
## Cómo usarlo
**Primero entiende, después puntúa.** Haz suficientes preguntas antes de definir las dimensiones. Dimensiones equivocadas → puntuaciones equivocadas, por precisa que sea la exactitud.
**Redacta y luego itera.** Cuando las necesidades no estén del todo claras, haz un estándar de lo mejor que puedas, puntúa y muestra los resultados. Los usuarios reaccionan a Rankings concretos — "este factor debería pesar más", "te dejaste X". Esa es la señal. Refina y vuelve a puntuar. Una iteración le gana a diez rondas de adivinanza.
**El agente es el analista.** Tras compute, lee el TSV. Explica por qué X le ganó a Y. Destaca las sorpresas. Propón ajustes. El ranking inicia la conversación, no la termina.
## Flujo principal
```
① Entiende las necesidades  → ② Define score.yml  → ③ Puntúa score.tsv  → ④ x score compute  → ⑤ Informa e itera
```
Salida: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, ordenado de forma descendente. rank=1 es el mejor.
## Ejemplo — ayudar a un usuario a decidir eslóganes promocionales
1. Habla con el usuario para definir las dimensiones y criterios de evaluación. Escribe `slogan.score.yml`.
2. La IA puntúa cada eslogan por dimensión (0–10, con evidencia) → `slogan.score.tsv`. Deja total y rank en blanco.
3. `x score compute slogan.score.yml slogan.score.tsv` → rellena total + rank.
4. Lee los resultados, conversa con el usuario. Ajusta puntuaciones o añade candidatos, repite.
5. O bien: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Más ejemplos: [EXAMPLE.md](EXAMPLE.md).
## Modelo de dos archivos
- `*.score.yml` — Estándar reutilizable: dimensiones, factores, descripciones
- `**.score.tsv` — Objetivos + puntuaciones + evidencia; columna 1 = nombre del objetivo
`x score compute <yml> <tsv>` es lo mismo que `python compute.py`.
## Escenarios de aplicación
1. **Le da al agente un flujo de decisión.** score.yml ancla al agente a un proceso estructurado — el agente sigue el estándar, no el ánimo del último mensaje.
2. **Las decisiones se basan en reglas.** Dimensiones × factores × evidencia → total ponderado → rank. Cada puntuación está anclada a hechos. El razonamiento es transparente.
3. **Se ajusta a necesidades distintas.** Cambia dimensiones, ajusta factores, añade filtros duros (columna `block`). La misma plantilla, otros usuarios.
4. **Evoluciona según se aclaran las necesidades.** Borrador → puntuación → feedback → refinado → más preciso.
5. **Archivo estándar + resultados archivados para cualquier skill.** score.yml = estándar de decisión. score.tsv = registro de decisión. Ambos archivables, revisables, compartibles.
---
## Fórmula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — entero 1–10. Línea base = 2. 1=menor, 4=2×, 6=3×, 8=4×, 10=5×. Se normaliza automáticamente.
- **score** — 0–10 por dimensión, anclada a evidencia.
- **total** — total ponderado 0–100.
Las cabeceras de dimensión muestran el peso en %: `factor ÷ Σ(factor) × 100`.
## Columnas de salida
| Columna | Origen | Descripción |
|--------|--------|-------------|
| `target` | entrada | Nombre del candidato |
| `total` | calculado | Puntuación ponderada (0–100) |
| `rank` | calculado | 1 = mejor. `X` si está bloqueado |
| `block` | entrada | Filtro duro — no vacío = descalificado, enviado al final, rank=X |
| `reason` | entrada/salida | Opcional: notas de la IA sobre matices de la puntuación |
| `<dim> (X%)` | calculado | Puntuaciones por dimensión, la cabecera muestra el peso % |
| `evidence` | entrada | Hechos que respaldan cada puntuación |
## Escala
- 9–10 — Excelente — cumple los criterios por completo
- 7–8 — Bueno — cumple los criterios, con una brecha menor
- 5–6 — Adecuado — dirección correcta, fallo notable
- 3–4 — Débil — brecha significativa
- 1–2 — Fallo — apenas lo aborda
- 0 — N/D — no aplica
## Reglas
1. **Anclaje a evidencia** — cada puntuación DEBE tener evidencia. Hechos, no sentimientos.
2. **Usa todo el rango** — 5 es el punto medio, no el valor por defecto. 0 y 10 son raros pero posibles.
3. **Los factores son amplificadores relativos** — factor 2 = 2× la influencia del factor 1. Se normaliza automáticamente.
4. **Objetivos únicos y no vacíos** — la columna 1 de cada fila debe tener nombre de objetivo. Sin duplicados, sin blancos.
5. **El agente lee, informa, decide** — tras compute, explica los resultados. Vuelve a puntuar o repondera según haga falta.
## Archivos
- `SKILL.cn.md` — versión en chino
- `compute.py` — valida + calcula total + rank
- `template/*.score.yml` — más de 35 plantillas. `x score ls` lista, `x score init -t <name>` copia
- `EXAMPLE.md` — más ejemplos de uso
- `rule-vs-score.md` — cuándo usar rule frente a score
- `score-template-writer.md` — cómo escribir plantillas de puntuación

## Relacionadas

- [rule](../rule/SKILL.md) — compañero de cumplimiento
- [naming](../naming/SKILL.md) — aquí se puntúan los nombres candidatos
