---
name: ontology-database
description: Grafo de conocimiento tipado mediante un log TSV solo-append — CRUD de entidades, relaciones dirigidas, validación de esquema, razonamiento multi-salto. CLI vía `x ondb`, protocolo legible por AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Grafo de conocimiento tipado: todo es una **entidad** (id + type + properties) conectada por **relaciones dirigidas** (from → rel → to). Todas las mutaciones añaden líneas TSV — nunca sobrescriben. El log TSV ES la base de datos.

## Formato del log TSV (el protocolo)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # crear entidad
set     <id>  <epoch_ms>  key  val                             # actualizar propiedad
rm      <id>  <epoch_ms>                                       # borrar entidad
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # crear relación
unlink  <from>  <rel>  <to>  <epoch_ms>                        # quitar relación
# separado por tabuladores; escape: 	 → tab, 
 → salto de línea, \ → barra invertida
# las propiedades son pares key/val alternos (cada uno es un campo de tabulador aparte)
```

Cualquier lenguaje lo lee. AWK hace streaming, Python usa diccionarios, SQLite materializa. **El log es la fuente de verdad.**

## Uso del CLI

```
x ondb add --type Person --name Alice                            # UUID automático
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # detalle de la entidad
x ondb set --id t1 status=done                                  # actualizar propiedad
x ondb rm --id t1                                               # borrar

x ondb link --from proj_001 --rel has_task --to t1              # crear relación
x ondb link --from t1 --rel blocks --to t2                      # con propiedades de enlace: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relaciones salientes
x ondb linked --id t1 --direction incoming                      # entrantes (quién enlaza HACIA)
x ondb related --id proj_001 --rel has_task --json              # entidad completa del otro lado

x ondb ls --type Task                                           # listar por tipo
x ondb query --type Task --where status=open --json             # filtrar por propiedades
```

`linked` = metadatos de la relación. `related` = entidad completa del otro lado. Usa `--dir <path>` / `-d <path>` para el directorio de datos (→ `path/ondb.tsv`).

## Esquema y validación

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # comprueba required, enum, referencias colgantes, cardinalidad, ciclos
```

Directivas: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. La validación es independiente de la escritura.

## Principios de arquitectura

- **El log es la fuente** — el log TSV es autoritativo; SQLite es una vista materializada
- **Solo append** — `set`, `rm`, `unlink` añaden líneas; nunca modifican líneas existentes
- **Múltiples instancias** — un ondb por subdominio (por defecto); combina solo para cadenas entre dominios
- **Tipo = Concepto** — el mismo nombre de tipo siempre significa el mismo concepto
- **Validar bajo demanda** — sin comprobación de esquema al escribir; ejecuta `validate` tras cambios por lotes

## Backends

| Backend | Cuándo | |
|---|---|---|
| **AWK** (por defecto) | < 2k entidades | Sin dependencias, streaming |
| Python | Medio | Estructuras de datos ricas |
| JS/Bun | Aplicaciones web | JSON nativo |
| SQLite | > 5k entidades | Generado automáticamente desde el log TSV |

## Estructura de directorios

```
<datadir>/ONDB.DESC.txt    # Obligatorio. Identifica la instancia ondb
<datadir>/ondb.tsv         # Log solo-append
<datadir>/schema.tsv       # Opcional. Restricciones
<datadir>/ondb.db          # Opcional. Vista materializada en SQLite
```

## Para más información

- `x ondb --help` — referencia del CLI
- `x ondb libpath {awk,py,js}` — rutas de librerías para consultas personalizadas
- [ondb SKILL.md](../../../ondb/SKILL.md) — documentación completa (escenarios, integración, consultas personalizadas, configuración WAL de SQLite)

## Relacionadas

- [yfm](../yfm/SKILL.md) — el `metadata:` de yfm es la superficie de ingesta recomendada
- [rule](../rule/SKILL.md) — las reglas de validación de esquema viven en el marco rule
