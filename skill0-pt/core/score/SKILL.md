---
name: score
description: |
  Framework de pontuação por dimensões ponderadas para agentes de IA — "Não chute. Pontue." Ideia central:
  entender as necessidades primeiro, rascunhar e depois iterar, o agente é o analista. Saída em TSV
  ranqueado via `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Não chute. Pontue."
Framework de pontuação por dimensões ponderadas para agentes de IA.
## Como usar
**Entenda primeiro, pontue depois.** Faça perguntas suficientes antes de definir as dimensões. Dimensões erradas → pontuações erradas, não importa a precisão.
**Rascunhe e depois itere.** Quando as necessidades não estiverem totalmente claras, faça um padrão de melhor esforço, pontue e mostre os resultados. Os usuários reagem a rankings concretos — "esse fator deveria ter mais peso", "você esqueceu X". Esse é o sinal. Refine e reponte. Uma iteração vale mais que dez rodadas de adivinhação.
**O agente é o analista.** Depois do compute, leia o TSV. Explique por que X venceu Y. Destaque as surpresas. Sugira ajustes. O ranking inicia a conversa, não a encerra.
## Fluxo principal
```
① Entenda as necessidades  → ② Defina o score.yml  → ③ Pontue o score.tsv  → ④ x score compute  → ⑤ Reporte e itere
```
Saída: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, ordenado em decrescente. rank=1 é o melhor.
## Exemplo — ajudando um usuário a decidir slogans promocionais
1. Discuta com o usuário para definir dimensões e critérios de avaliação. Escreva `slogan.score.yml`.
2. A IA pontua cada slogan por dimensão (0–10, com evidências) → `slogan.score.tsv`. Deixe total e rank em branco.
3. `x score compute slogan.score.yml slogan.score.tsv` → preenche total + rank.
4. Leia os resultados, discuta com o usuário. Ajuste pontuações ou adicione candidatos, repita.
5. Ou: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Mais exemplos: [EXAMPLE.md](EXAMPLE.md).
## Modelo de dois arquivos
- `*.score.yml` — Padrão reutilizável: dimensões, fatores, descrições
- `**.score.tsv` — Alvos + pontuações + evidências; coluna 1 = nome do alvo
`x score compute <yml> <tsv>` é o mesmo que `python compute.py`.
## Cenários de aplicação
1. **Dá ao agente um workflow de decisão.** O score.yml ancora o agente a um processo estruturado — o agente segue o padrão, não o humor da última mensagem.
2. **As decisões são baseadas em regras.** Dimensões × fatores × evidências → total ponderado → rank. Toda pontuação está ancorada em fatos. O raciocínio é transparente.
3. **Ajusta-se a necessidades diferentes.** Troque dimensões, ajuste fatores, adicione filtros rígidos (coluna `block`). O mesmo template, usuários diferentes.
4. **Evolui conforme as necessidades se esclarecem.** Rascunho → pontuação → feedback → refino → mais preciso.
5. **Arquivo de padrão + resultados arquivados para qualquer skill.** score.yml = padrão de decisão. score.tsv = registro de decisão. Ambos arquiváveis, revisáveis, compartilháveis.
---
## Fórmula
```
total = Σ(fator × score) ÷ Σ(fator) × 10   →   0–100
```
- **factor** — inteiro 1–10. Linha de base = 2. 1=menor, 4=2×, 6=3×, 8=4×, 10=5×. Normalizado automaticamente.
- **score** — 0–10 por dimensão, ancorado em evidências.
- **total** — total ponderado 0–100.
Os cabeçalhos de dimensão mostram o peso em %: `factor ÷ Σ(factor) × 100`.
## Colunas de saída
| Coluna | Origem | Descrição |
|--------|--------|-------------|
| `target` | entrada | Nome do candidato |
| `total` | calculado | Pontuação ponderada (0–100) |
| `rank` | calculado | 1 = melhor. `X` se bloqueado |
| `block` | entrada | Filtro rígido — não vazio = desqualificado, vai para o fim, rank=X |
| `reason` | entrada/saída | Opcional: notas da IA sobre nuances da pontuação |
| `<dim> (X%)` | calculado | Pontuações por dimensão, o cabeçalho mostra o peso em % |
| `evidence` | entrada | Fatos que sustentam cada pontuação |
## Escala
- 9–10 — Excelente — atende plenamente aos critérios
- 7–8 — Bom — atende aos critérios, com uma lacuna pequena
- 5–6 — Adequado — direção certa, lacuna notável
- 3–4 — Fraco — lacuna significativa
- 1–2 — Reprovado — mal endereçado
- 0 — N/A — não se aplica
## Regras
1. **Ancoragem em evidências** — toda pontuação DEVE ter evidências. Fatos, não sentimentos.
2. **Use a faixa toda** — 5 é o ponto médio, não o padrão. 0 e 10 são raros, mas possíveis.
3. **Fatores são amplificadores relativos** — fator 2 = 2× a influência do fator 1. Normalizado automaticamente.
4. **Alvos únicos e não vazios** — toda linha da coluna 1 precisa ter um nome de alvo. Sem duplicados, sem branco.
5. **O agente lê, reporta, decide** — depois do compute, explique os resultados. Reponte ou reponderre os pesos conforme necessário.
## Arquivos
- `SKILL.cn.md` — versão em chinês
- `compute.py` — Valida + calcula total + rank
- `template/*.score.yml` — 35+ templates. `x score ls` lista, `x score init -t <name>` copia
- `EXAMPLE.md` — Mais exemplos de uso
- `rule-vs-score.md` — Quando usar rule vs score
- `score-template-writer.md` — Como escrever templates de pontuação

## Relacionados

- [rule](../rule/SKILL.md) — companheiro de conformidade
- [naming](../naming/SKILL.md) — nomes de candidatos pontuados aqui