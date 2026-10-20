---
name: devloop
description: Loop de desenvolvimento orientado a objetivo — definir o objetivo, escrever regras com key-results, verificar visualmente, sincronizar com o rastreador de issues.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # ou um ruleset específico do projeto
x env use agent-browser                   # para verificação visual
```

## Workflow

```
objetivo → rule.yml → código → verificação → issue
```

### 1. Defina o objetivo → escreva rule.yml

Antes de codar, crie um rule.yml para a tarefa:

```yaml
goal: "Corrigir a versão em inglês mostrando tags chinesas na seção Features"
keyresults:
  - kr-1: "As tags de Features no modo inglês são todas em inglês"
  - kr-2: "As tags de Features no modo chinês permanecem em chinês"
  - kr-3: "O build passa sem regressões"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Quando language=en, todos os itens details[] devem estar em inglês
    - Nenhum caractere chinês em nenhuma tag badge no modo inglês
```

Campos de rule: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Veja `x rule -h`.

**DEVE** incluir `goal` e `keyresults` — os dois campos obrigatórios de toda tarefa de dev.

### 2. Execute → verificação visual (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... faça as alterações ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**DEVE** tirar screenshot antes e depois. Compare com a intenção:
1. Verificação pela visão da IA: o after.png corresponde ao objetivo?
2. Se não corresponder → itere e tire um novo screenshot
3. **Apague todos os dados privados** (tokens, e-mails, informações pessoais) antes de enviar

### 3. Verifique com x rule

```
x rule scan <files>     # rápido (~1 min), para o loop interno
x rule check <files>    # minucioso (~10 min)
x rule audit <files>    # relatório completo (~30 min)
```

### 4. Sincronize com o rastreador de issues

Veja [issue/SKILL.md](../issue/SKILL.md). Mínimo: poste objetivo, key-results, rule.yml e os screenshots antes/depois na issue.

## Ferramentas do agente

- `x rule scan` — verificação rápida durante a iteração
- `x rule check` — conformidade completa antes do commit
- `agent-browser screenshot` — prova visual antes/depois
- `gh issue create/comment` — sincroniza objetivo + rule.yml com o rastreador

## Relacionados

- [rule](../rule/SKILL.md) — rule.yml é o esqueleto da verificação
- [score](../score/SKILL.md) — a pontuação de KRs usa o framework de score
- [install](../install/SKILL.md) — prepara o ambiente de desenvolvimento
- [agent-browser](../../it/agent-browser/SKILL.md) — verificação visual antes/depois
- [issue](../issue/SKILL.md) — sincroniza objetivo + KRs + screenshots com o rastreador de issues
- [repo](../repo/SKILL.md) — faz pull/push do trabalho nos repos
- [prompt](../prompt/SKILL.md) — as convenções de prompt frequentemente conduzem tarefas do devloop