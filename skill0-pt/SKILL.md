---
name: skill0
description: "Índice raiz das sub-skills do x-cmd skill0. Define o workflow do agente no estilo OKR (objetivo → resultados verificados por regras → execução), a descoberta de skills e as preferências de ferramentas do agente. Estilo: princípios primeiro, conciso, delegando o específico a fontes externas autoritativas."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 codifica princípios, não dados

O LLM absorve o senso comum continuamente; o trabalho do skill0 é codificar convenções e ponteiros para as fontes, depois ficar enxuto com o tempo à medida que o LLM acompanha o ritmo. Verifique por dados de primeira parte (`x rfc`, `x cve`, `x wkp`, `agent-browser`) e pelas melhores práticas atuais (`x skill`, `x clawhub`), depois reconstrua com lógica formal em vez de memorização.

## As sub-skills formam um grafo dirigido em 4 buckets

Buckets: `core/`, `data/`, `it/`, `life/`. Caminho: `<bucket>/<slug>/SKILL.md`. O catálogo legível por máquina (name + description) está em [index.tsv](index.tsv). Antes vivia aqui um documento que servia de guia de interação manager/lifestyle; ele foi movido para [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md), pois não faz parte do grafo do skill0.

## Objetivo → keyresults → x-rule é o workflow OKR

Objetivo: o que alcançar
Key Results: como verificar
Verificação: `x rule check/audit`

## Depois do scaffolding, prefira as ferramentas x-cmd para executar

- `x skill` — o catálogo de skills do x-cmd, curado e verificado por pessoas.
- `x clawhub` — registro global de skills. **Atenção**: envio gratuito, você **deve executar** `x clawhub skill moderate <name>` para obter o relatório de segurança gerado automaticamente.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — gestão de projetos, agendamento, agentes em background, ontologia, wiki. Execute `x [mod] --help`.

## Todo SKILL.md deve passar pelo skill0-writer

Veja [skill0-writer](core/skill0-writer/SKILL.md) para as convenções.