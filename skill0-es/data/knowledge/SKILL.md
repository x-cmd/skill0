---
name: knowledge
description: |
  Busca en Hacker News, Wikipedia, DuckDuckGo, documentos RFC y Stack Exchange desde la línea de comandos.
  Sin barreras — instala x-cmd y empieza a buscar.
  Úsalo para "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Busca en las fuentes de conocimiento de internet desde la línea de comandos.

## Inicio rápido

```bash
# Instala x-cmd
eval "$(curl https://get.x-cmd.com)"

# Publicaciones principales de Hacker News
x hn top

# Búsqueda en Wikipedia
x wkp "artificial intelligence"

# Búsqueda en DuckDuckGo
x ddgo "rust programming language"

# Documentos RFC
x rfc 2616

# Búsqueda en Stack Exchange
x se "how to exit vim"
```

## Qué hay disponible

| Comando | Fuente | Ejemplo |
|---------|--------|---------|
| `x hn top` | Hacker News | Las 10 publicaciones en tendencia |
| `x hn new` | Hacker News | Envíos más recientes |
| `x wkp <query>` | Wikipedia | Buscar artículos |
| `x ddgo <query>` | DuckDuckGo | Búsqueda web |
| `x rfc <number>` | Documentos RFC | Leer especificaciones RFC |
| `x se <query>` | Stack Exchange | Buscar preguntas y respuestas |

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Más fuentes (Project Gutenberg, arxiv)
- Patrones de búsqueda avanzada
- Consejos de filtrado y formato de resultados

## Experiencia completa

`x knowledge --help` para todas las opciones tras instalar x-cmd.

## Relacionadas

