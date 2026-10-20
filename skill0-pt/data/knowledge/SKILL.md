---
name: knowledge
description: |
  Pesquise no Hacker News, Wikipedia, DuckDuckGo, documentos RFC e Stack Exchange a partir da linha de comando.
  Zero barreira — instale o x-cmd e comece a pesquisar.
  Use para "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Pesquise nas fontes de conhecimento da internet a partir da linha de comando.

## Início rápido

```bash
# Instale o x-cmd
eval "$(curl https://get.x-cmd.com)"

# Posts mais votados do Hacker News
x hn top

# Busca na Wikipedia
x wkp "artificial intelligence"

# Busca no DuckDuckGo
x ddgo "rust programming language"

# Documentos RFC
x rfc 2616

# Busca no Stack Exchange
x se "how to exit vim"
```

## O que está disponível

| Comando | Fonte | Exemplo |
|---------|-------|---------|
| `x hn top` | Hacker News | Os 10 posts em alta |
| `x hn new` | Hacker News | Submissões mais recentes |
| `x wkp <query>` | Wikipedia | Busca por artigos |
| `x ddgo <query>` | DuckDuckGo | Busca na web |
| `x rfc <number>` | Documentos RFC | Lê as especificações RFC |
| `x se <query>` | Stack Exchange | Busca em perguntas e respostas |

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Mais fontes (Project Gutenberg, arxiv)
- Padrões de busca avançada
- Dicas de filtro e formatação dos resultados

## Experiência completa

`x knowledge --help` para todas as opções, depois de instalar o x-cmd.

## Relacionados