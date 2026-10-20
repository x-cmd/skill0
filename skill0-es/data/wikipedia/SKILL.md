---
name: wikipedia
description: |
  Busca y lee Wikipedia vía x wkp — API de MediaWiki, sin API key,
  sin instalar nada; consulta, extrae, sugiere y enruta a DDG en un solo módulo.
  Carga para wiki, wikipedia, encyclopedia lookup, article summary.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

La salida es una extracción en texto plano (~primer párrafo + infobox). El verbo del subcomando marca la forma — `hop` para buscar y resumir, `extract` para títulos conocidos, `search` para candidatos, `suggest` para "quizas querías decir". El sitio por defecto es la Wikipedia en inglés; `--lang` / `--api-url` cambian a otros wikis.

## Inicio rápido con `x wkp`

```bash
x wkp hop Python                      # buscar + extraer el primer resultado de una sentada
x wkp extract OpenAI                  # resumen de una página conocida
x wkp search "Linux kernel"           # listar candidatos cuando el título es incierto
x wkp suggest pythen                  # ¿quisiste decir?: pistas de corrección antes de buscar
```

`x wkp -h` para todas las flags y subcomandos.

## Datos y herramientas adyacentes

Upstream: `https://en.wikipedia.org/w/api.php` — API de acción de MediaWiki. Los proyectos hermanos (Wikidata, Wiktionary, Commons) se alcanzan igual; apunta `--api-url` al subdominio correspondiente.

Para las preguntas que van un salto más allá de un resumen en wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — el mismo módulo `x wkp`, enrutado vía el índice de Wikipedia de DuckDuckGo (gestiona mejor las consultas ambiguas o coloquiales que la búsqueda por título)
- `x ddgo <query>` — búsqueda web general, útil cuando Wikipedia no tiene artículo pero el tema existe en la web abierta
- Consulta la skill [knowledge](../knowledge/SKILL.md) para el kit de investigación más amplio con `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — recurre al navegador cuando de verdad necesitas la página renderizada (infoboxes, tablas, imágenes)
