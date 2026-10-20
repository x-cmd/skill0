---
name: cve
description: |
  Consulte registros de CVE via x cve — em cache, sem API key, TSV xz diário.
  Carregue para cve, id de vulnerabilidade, kev, epss, nvd, cvelist ou advisory de segurança.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

TSV comprimidos em xz por ano; o ano atual e o anterior se atualizam sozinhos (TTL de 1 h), anos mais antigos ficam congelados por 180 dias. Depois do primeiro dia online, `x cve` funciona offline indefinidamente.

## Início rápido com `x cve`

```bash
x cve info CVE-2024-0001      # busca por id (forma curta: x cve 2024-0001)
x cve year 2024               # fluxo por ano, TSV amigável a pipes
x cve detail CVE-2024-0001    # registro completo do upstream (products, CWE, refs, ADP)
```

`x cve -h` para todas as flags, subcomandos e formas curtas.

## Dados e ferramentas relacionadas

TSV xz diários publicados em `github.com/x-cmd/cve/releases/download/data/` (schema documentado na release). O registro em cache é uma projeção enxuta — para as perguntas que vão um passo além dele:

- `x shodan cve CVE-X` — pontuação EPSS, pertencimento ao KEV, artigos sobre exploits, avisos dos vendors
- `x kev ls` — catálogo KEV da CISA (lista de explorados conhecidos, tabela completa)
- `x osv` — consulta por pacote e versão ("a MINHA versão é vulnerável?"); aceita ids `osv-*` e `cve-*`
- `x cve detail` — JSON bruto de `CVEProject/cvelistV5` (upstream canônico, buscado sob demanda)