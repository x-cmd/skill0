---
name: skill0-writer
description: Convenções de escrita dos documentos do skill0 — estrutura de pirâmide, limites de linhas e regras de layout.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Os documentos do skill0 seguem o **princípio da pirâmide**: os agentes podem ler apenas as primeiras 10–30 linhas, então a informação mais importante precisa vir primeiro. O detalhe depois da linha 30 é bônus, não carga.

## O que nenhuma regra pega

- **Clareza acima de brevidade.** Um documento curto que dá a resposta errada é pior do que um longo que dá a resposta certa.
- **Avisos de segurança / MUST ser explícitos** — use DEVE, NUNCA, NÃO. Enuncie as ressalvas como afirmações completas, não como observações entre parênteses.
- **Não divulgue conhecimento comum.** Se uma palavra de convenção mais uma ou duas frases transmitem o ponto, pare. O leitor já sabe o que são YAML, git e cache; gaste o contexto com o que é específico deste repo. Justificação é o infrator habitual — só dê o motivo de uma regra quando ela parece errada sem ele. (`sw-1200`)
- **Tabelas só para matrizes de verdade.** 3+ colunas cujas linhas precisam ser lidas umas contra as outras. Uma tabela de duas colunas é uma lista vestida de sintaxe de tabela — escreva a lista. Um conjunto de dados pertence a um `.tsv` externo ao lado do doc, linkado, para o `x tsv` poder consultá-lo. (`sw-1250`)

## YFM — só no `SKILL.md`

```yaml
---
name: <slug>                  # deve ser igual ao nome do diretório
description: <resumo de 1-2 frases que o agente usa para decidir se carrega>
---
```

`name` e `description` são estruturais. Todo o resto fica aninhado sob o bloco `metadata:` do [yfm](../yfm/SKILL.md) como escalares separados por vírgula — opcional, e adiciona estrutura para indexação, descoberta e hooks de ontologia.

**Subarquivos não carregam YFM.** Só `SKILL.md` é filtrado por um loader, então só ele precisa de front matter. Qualquer outro arquivo (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) é lido direto por um agente que já decidiu abri-lo — YFM ali é custo puro de token, repetindo um propósito que o título e a primeira linha já dão. Comece esses arquivos no heading `#`. Desviar exige um motivo declarado dentro do próprio arquivo.

Para versões localizadas em chinês, use um `SKILL.cn.md` paralelo (um por skill). Não misture idiomas dentro de um único arquivo.

## Checagens mecânicas

Moram em [skill0-writer.rule.yml](skill0-writer.rule.yml). Rode `x rule lint skill0-writer.rule.yml` e `x rule check -r skill0-writer.rule.yml lib/skill0/`. Cobertura: presença de YFM + campos name/description, formato do name, contagem de linhas ≤ 100 (ideal 50), ordem de seções install → usage → advanced → links, somente inglês, no-intro / no-conclusion / no-repetition, no-orphan files.

## Checagem de segurança contra truncamento

Depois de escrever, revise na linha 30: um agente que parasse ali formaria um entendimento errado?

Se sim, mova o qualificador crítico para mais cedo. As primeiras 30 linhas precisam dar um modelo mental correto (mesmo que incompleto). Depois da linha 30, expanda com detalhe — a pirâmide se autocorrige.

## Carregamento em duas camadas: description para correspondência, body para referência

Os loaders de skills (Claude Code, Cursor, Continue, etc.) carregam o SKILL.md em dois estágios:

  1. **YFM `description:`** — carregado automaticamente no catálogo do
     agente para correspondência. O agente lê a description para decidir se
     carrega a skill.
  2. **Body** — carregado sob demanda após uma correspondência. Material de
     referência.

Implicações:

- **Description** = *o que é + quando carregar* — densa em palavras-chave,
  rica em gatilhos, enxuta.
- **Body** = *como usar + referência* — exemplos, schemas, casos de borda,
  links para docs mais profundos.

**Não duplique conteúdo entre as duas camadas.** O que a description transmitir, o body deve *expandir*, não restar a mesma superfície. Em particular o parágrafo de abertura do body não deve listar as mesmas features da description — o body abre com referência, não com um segundo resumo.

Um teste prático: se você apagar a description inteira e ler só as primeiras 30 linhas do body, o agente ainda deve ver o que a skill faz e quando carregá-la. Se só a description carrega essa informação, o body não tem nada a acrescentar no topo — mova a explicação para o body e deixe a description carregar a manchete.

## Uma skill é um pacote de conhecimento, não um tutorial

O body de uma skill é um **briefing para o LLM**, não um curso para iniciante.

- **Capacidade** mora no LLM. O body não ensina.
- **Conhecimento** mora nas ferramentas de dados do x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) e em fontes externas. O body aponta; o agente rebusca.
- **Enquadramento** é o trabalho da skill: nomeia a forma do problema, a convenção, a saída estruturada, a ferramenta x-cmd a usar.

Uma skill carrega o ângulo de resolução, a convenção, a forma da saída e ponteiros para as fontes. Ela **não** carrega capacidade (o LLM já tem), dados estáticos (eles envelhecem) nem tutoriais (use sidecars).

Onde os specifics forem detalhados demais ou atuais demais, empurre para um sidecar (`references/`, `ANALYTICS.md`) ou para um doc externo sempre atualizado.

## Links externos

Colete dois tipos: **links raiz** (pontos de entrada como `llms.txt`, índice de docs) e **links úteis** (links direcionados para os 20% dos docs que cobrem 80% dos casos de uso). Liste a raiz primeiro, os úteis depois — a IA entende ordem. **Sem duplicação**, a menos que a ênfase seja crítica.

## Ressalvas leves (decisões de julgamento)

- **Subarquivos (CLEANUP.md, references/*)** podem ser mais longos que o SKILL.md, mas as primeiras 20 linhas ainda carregam o peso (mesma pirâmide).
- **DEVE** linkar todo subarquivo a partir do seu SKILL.md pai (link forward obrigatório). O link de volta para o SKILL.md pai a partir de um subarquivo é **opcional** — arquivos de usecase referenciam o pai implicitamente pelo caminho. Imposto por `sw-1000-no-orphan-docs` em [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Especulação** — enuncie fatos testados, ou rotule como "não testado".
- **Emojis**, a menos que o tópico da skill exija.

## Relacionados

- [yfm](../yfm/SKILL.md) — convenção de YFM da qual o skill0-writer é a imposição da camada 1
- [naming](../naming/SKILL.md) — naming também segue as regras de escrita
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — imposição mecânica