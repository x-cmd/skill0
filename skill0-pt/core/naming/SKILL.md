---
name: naming
description: |
  Framework de nomenclatura para módulos / comandos / subcomandos do x-cmd. Subjetivo + orientado a
  cenário; a skill é uma casca fina, NÃO um manual de regras. Três camadas: investigar (objetivo),
  naming.<user-task>.yml (OKR + registro de sessão, um arquivo .rule), naming.okr-creator.yml (meta-regra
  que audita a sessão).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Nomenclatura é **subjetiva + orientada a cenário**. Esta skill é um **framework**, não um manual de regras — ela não embute regras subjetivas de nomenclatura.

## Mapa rápido

```
┌─────────────────────────────────────────────────────────┐
│  1. INVESTIGUE o objetivo                                │
│     O que está sendo nomeado? Que papel? Que conceito?  │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (arquivo .rule)              │
│     - goal-*        (a tarefa de nomenclatura)          │
│     - keyresult-*   (resultados verificáveis)           │
│     - task-*        (restrições específicas da tarefa)  │
│     - session:      (trilha de auditoria na regra goal) │
│         prefer     (5 respostas de init-004)            │
│         init_verdicts  (decisões de gate por candidato) │
│         scores     (ancorado em D1-D7 por candidato)    │
│         final      (escolha + reserva)                   │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. AUDITE com template/naming.okr-creator.yml          │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — passo a passo

### Passo 1 · Investigue o objetivo

Antes de escrever qualquer coisa, responda a estas perguntas. NÃO pule — sem as respostas, o scorer não consegue ancorar D4 (TRIAL/REAL) nem D5 (RUN/TEST).

- **O que está sendo nomeado?** — módulo / subcomando / campo / variável — regras de forma de nomenclatura diferentes se aplicam
- **Que papel ele exerce?** — ancora o conceito (ex.: "módulo de trial-run" → runner autônomo, Estágio 1 de um teste em duas etapas)
- **Que prior o nome DEVE carregar?** — o sentido dominante da palavra isolada precisa bater (ex.: trial-run precisa de TRIAL+RUN, não REAL+TEST)
- **Que priors ele DEVE EVITAR?** — poluição de unittest (`*test`/`*case`), fake (`*mock`/`*fake`/`*stub`/`*dry`), deployment real (`field*`/`*live*`)
- **Qual arquétipo combina?** — ship / plane / rocket / factory / abstract — dirige D6/D7

Saída: uma declaração de objetivo em uma linha, por exemplo
> "Escolher um nome de módulo x-cmd autônomo para trial-run (Estágio 1 do teste em duas etapas) que pontue 8.0+ em D1-D7, seja autoexplicativo à primeira vista e sobreviva a todos os fast-fail de linha vermelha / dicionário / comprimento."

### Passo 2 · Crie o registro da sessão

Copie o template e recorte / preencha.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Depois preencha as 4 seções (de cima para baixo):

#### 2a. Regra de objetivo (a tarefa de nomenclatura)

Substitua `goal-TBD_task_id` por um ID real. O sufixo do ID deve refletir a tarefa (ex.: `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <declaração de objetivo em uma linha, do Passo 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <conceito + papel + anti-priors, do Passo 1>
```

#### 2b. Key results (resultados verificáveis)

Substitua cada `keyresult-kr*_TBD_short_label`. Cada KR é uma regra que precisa poder passar (PASS). Adicione tantos quantos a tarefa tiver.

```yaml
keyresult-kr1-top-pick-committed:
  name: <resultado verificável 1>
  level: error
  desc:
  - <o que conta como passar — critério concreto, não "parece bom">
```

#### 2c. Regras específicas da tarefa (restrições sobre os candidatos)

Substitua cada `TBD_task_id-*` por um ID de restrição real que corresponda ao sufixo task-id do objetivo. Recorte as que não se aplicam e adicione novas conforme necessário.

Padrões comuns:
- `must-be-X-not-Y` — alinhamento de conceito (ex.: `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — faixa rígida de D1
- `must-imply-<archetype>` — vínculo de D7
- `<domain>-specific-acceptable` / `not-acceptable` — permissão de domínio restrito
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <restrição, ex.: "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <o que o candidato precisa satisfazer>
  - <qual dimensão D1-D7 esta restrição afeta>
  tldr:
  - wrong: <contraexemplo>
  - right: <bom exemplo>
```

#### 2d. Registro da sessão (trilha de auditoria na regra de objetivo)

Preencha todas as 4 subseções:

**prefer** — DEVE responder às 5 perguntas, mesmo que a resposta seja "não / fraco":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<lista de domínios restritos OK, ex.: [naval]>]   # [] = nenhum domínio restrito OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — uma entrada por candidato considerado, incluindo os rejeitados:
```yaml
init_verdicts:
  - { name: <candidato>, gate: init-005 | init-006 | init-007 | pass, reason: "<por quê>" }
  # init-005 = casou com padrão de linha vermelha (rejeição automática)
  # init-006 = o primeiro sentido do dicionário contradiz o alvo
  # init-007 = comprimento fora da faixa (< 2 ou > 8)
  # pass     = passou em todos os gates de init, elegível para pontuação
```

**scores** — uma entrada por candidato que passou no init. Todas as pontuações >= 6.0. Toda pontuação DEVE ter âncoras:
```yaml
scores:
  - name: <candidato>
    score: <0_to_10>
    anchors:
      - "D1: <evidência de contagem de letras>"
      - "D2: <evidência do primeiro sentido do dicionário>"
      - "D3: <evidência do composto literal>"
      - "D4: <evidência de trial vs real>"
      - "D5: <evidência de run vs test>"
      - "D6: <evidência de vivacidade>"
      - "D7: <evidência de equipamento grande>"
    misses:
      - "<o que falta — liste apenas misses reais, nem sempre os 7>"
```

**final** — declare a escolha + a reserva:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Passo 3 · Audite com a meta-regra

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

O OKR-creator (em `template/naming.okr-creator.yml`) roda 11 checagens (uma mistura de error e warn):

| Checagem | Nível | O que verifica |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | o arquivo tem >=1 regra `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | o arquivo tem >=1 regra `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | o arquivo tem >=1 regra de tarefa (não goal/keyresult) |
| `okr-creator-010` has-session-record | error | a regra de objetivo tem o campo `session:` |
| `okr-creator-011` prefer-answers-all-five | error | as 5 perguntas de init-004 foram respondidas |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts não está vazio |
| `okr-creator-013` scores-have-anchors | error | toda pontuação tem uma lista de âncoras não vazia |
| `okr-creator-014` scores-no-below-6 | error | todas as pontuações >= 6.0 |
| `okr-creator-015` final-section-present | error | `final.pick` declarado |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | score(pick) >= 7.0 |

**Se alguma checagem error falhar**: corrija o arquivo e rode de novo. Correções comuns:
- Campo prefer faltando → adicione em `session.prefer`
- Pontuação sem lastro → adicione `anchors: [...]`
- Pontuação < 6 → mova para `init_verdicts` (rejeitado) ou reformule a pontuação
- final faltando → adicione `final: { pick, backup }`

**Se as checagens warn falharem**: decida se vale corrigir ou documentar o trade-off.

### Passo 4 · O usuário escolhe o nome final

A skill propõe; o usuário decide. O nome final é declarado em `session.final.pick` e commitado.

## Arquivos

| Arquivo | Papel | Formato |
|---|---|---|
| `SKILL.md` | Este arquivo — workflow + índice de arquivos | markdown |
| `naming.template.yml` | TEMPLATE com placeholders `TBD_*` — copie, renomeie, preencha | `.rule` |
| `naming.trial-run-module.yml` | Exemplo prático de um registro de sessão completo | `.rule` |
| `template/naming-concept.yml` | Framework de avaliação objetiva (D1–D7, linhas vermelhas, âncoras de pontuação) — como entradas `.rule` | `.rule` |
| `template/naming-brand.yml` | Regras de marca do x-cmd (comprimento, caixa, preferências de prior) — como entradas `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-regra: audita um `naming.<user-task>.yml` (as 11 checagens acima) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset opcional de nomenclatura de módulos x-cmd (registro de sessão inicial) | `.rule` |

## Divisão subjetivo vs objetivo

| Objetivo (nos arquivos / código) | Subjetivo (perguntado no init, não pontuado) |
|---|---|
| Primeiro sentido do dicionário | "Prefiro vívido vs abstrato" |
| Contagem de letras | "Aceito o domínio X" |
| Classe semântica trial / real / run / test | "Aceito ou não a metáfora naval" |
| Significado literal do composto | "Prefiro origem chinesa vs inglesa" |
| Poluição de priors (unittest testcase, dryrun) | "Prefiro curto vs autoexplicativo" |

## Regras

- **DEVE** investigar o objetivo primeiro — o que está sendo nomeado, que papel exerce, que conceito ancora.
- **DEVE** começar de `naming.template.yml` (placeholders TBD_*) e recortar / preencher conforme a tarefa exigir.
- **DEVE** produzir um `naming.<user-task>.yml` (formato `.rule`) com objetivo / key results / regras de tarefa / registro de sessão.
- **DEVE** rodar `x rule check` com `template/naming.okr-creator.yml` para auditar o registro de sessão.
- **DEVE** ancorar as pontuações em fatos objetivos — nunca inflar/deflar por causa da reação do usuário.
- **DEVE** deixar o usuário escolher o nome final — a skill propõe, o usuário decide.
- **NÃO DEVE** adicionar regras subjetivas a `template/naming-concept.yml` — elas vão para o `session.prefer` de cada tarefa.

## Relacionados

- [rule](../rule/SKILL.md) — a sessão de nomenclatura é checada via x rule
- [score](../score/SKILL.md) — os candidatos são pontuados via o framework de score
- [ontology-database](../ontology-database/SKILL.md) — o nome escolhido fica persistido no ondb