---
name: issue
description: Gestão de issues para o devloop — templates para objetivo, rule.yml, key-results e o ciclo de vida da issue.
metadata:
  related: "devloop,repo"
---


# issue

Parte do [devloop](../devloop/SKILL.md).

## Template de nova issue de dev

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Objetivo
<objetivo em uma linha>

## Key Results
- [ ] KR-1: <resultado verificável>
- [ ] KR-2: <resultado verificável>

## rule.yml
```yaml
goal: "<o mesmo acima>"
keyresults:
  - kr-1: "<o mesmo acima>"
  - kr-2: "<o mesmo acima>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<padrão de arquivo>"
    level: error
    desc:
    - <critério>
```

## Screenshots
- Antes: <imagem ou "N/A">
- Depois: <imagem ou "pendente">
EOF
)"
```

## Ciclo de vida da issue

| Etapa | Ação | Conteúdo do comentário |
|-------|--------|-----------------|
| Criada | `gh issue create` com o template | objetivo, key-results, rule.yml |
| Em andamento | Atualize conforme o trabalho avança | notas de progresso, screenshots intermediários |
| Verificada | `x rule check` passa | resultado do rule check, screenshot depois |
| Fechada | `gh issue close` | commit SHA, resumo da verificação final |

## Template do comentário de conclusão

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verificado
- rule.yml: <bloco de código ou link>
- x rule check: PASS
- Antes: <imagem>
- Depois: <imagem>
- Commit: <sha>
EOF
)"
```

## Regras

- **DEVE** incluir `goal` e `keyresults` em toda issue de dev — sem exceções
- **DEVE** postar o rule.yml como bloco de código no corpo da issue ou no primeiro comentário
- **DEVE** tirar screenshot antes e depois para mudanças de frontend
- **NUNCA** fechar uma issue sem evidência de verificação
- Vincule as issues ao quadro do projeto para visibilidade no roadmap

## Relacionados

- [devloop](../devloop/SKILL.md) — rastreador dos loops orientados a objetivo (objetivo/rule.yml/KRs)
- [repo](../repo/SKILL.md) — as issues se anexam aos repos no layout do x-repo