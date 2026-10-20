---
name: time
description: |
  Cronometragem de execução de comandos — precisão de microssegundos, análise estatística, comparação.
  Zero barreira — use com x-cmd ou com o comando time embutido do shell.
  Use para "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Meça o tempo de execução de comandos. Da cronometragem única com precisão de microssegundos à análise estatística de múltiplas execuções.

## Início rápido

```bash
# Com x-cmd
x time <command>                      # Cronometragem única em microssegundos
x time stress -c 100 <command>        # Estatísticas de 100 execuções
x time cmp 'cmd1' 'cmd2' 'cmd3'      # Compara comandos

# Sem x-cmd — use os builtins do shell
time <command>                        # Cronometragem básica
# Para benchmark, use um laço:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## O que está disponível

- `x time <cmd>` — Execução única, precisão de microssegundos
- `x time getms <cmd>` — Precisão de milissegundos
- `x time stress -c N <cmd>` — N execuções com estatísticas completas
- `x time stress -b N <cmd>` — Decide as execuções automaticamente dentro do orçamento
- `x time cmp 'c1' 'c2'` — Compara múltiplos comandos

## Formatos de saída

- `--csv` CSV para análise programática
- `--tsv` Separado por tabulação
- `--yml` YAML

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões de benchmark
- Guia de interpretação estatística
- Anti-patterns comuns de performance

## Relacionados