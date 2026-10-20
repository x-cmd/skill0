---
name: wikipedia
description: |
  Pesquise e leia a Wikipedia via x wkp — API do MediaWiki, sem API key,
  zero instalação; query, extract, suggest e rota DDG em um único módulo.
  Carregue para wiki, wikipedia, consulta a enciclopédia, resumo de artigo.

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

A saída é um extrato em texto puro (roughly o primeiro parágrafo + a infobox). O verbo do subcomando define o formato — `hop` para buscar-e-depois-resumir, `extract` para títulos conhecidos, `search` para candidatos, `suggest` para "você quis dizer". O site padrão é a Wikipedia em inglês; `--lang` / `--api-url` mudam para outros wikis.

## Início rápido com `x wkp`

```bash
x wkp hop Python                      # busca + extrato do primeiro resultado de uma vez
x wkp extract OpenAI                  # resumo de uma página conhecida
x wkp search "Linux kernel"           # lista candidatos quando o título é incerto
x wkp suggest pythen                  # "você quis dizer": dicas de correção antes da busca
```

`x wkp -h` para todas as flags e subcomandos.

## Dados e ferramentas relacionadas

Upstream: `https://en.wikipedia.org/w/api.php` — action API do MediaWiki. Os projetos irmãos (Wikidata, Wiktionary, Commons) são alcançados do mesmo jeito; aponte o `--api-url` para o subdomínio correspondente.

Para as perguntas que vão um passo além de um resumo em wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — mesmo módulo `x wkp`, roteado pelo índice da Wikipedia do DuckDuckGo (lida melhor do que a busca por título com queries ambíguas ou coloquiais)
- `x ddgo <query>` — busca web em geral, útil quando a Wikipedia não tem o artigo mas o assunto existe na web aberta
- Veja a skill [knowledge](../knowledge/SKILL.md) para o kit de pesquisa mais completo com `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — recorre ao navegador quando você realmente precisa da página renderizada (infoboxes, tabelas, imagens)