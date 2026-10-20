---
name: ontology-database
description: Grafo de conhecimento tipado via log TSV append-only — CRUD de entidades, relações dirigidas, validação de schema, raciocínio multi-hop. CLI via `x ondb`, protocolo legível por AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Grafo de conhecimento tipado: tudo é uma **entidade** (id + type + properties) conectada por **relações dirigidas** (from → rel → to). Todas as mutações acrescentam linhas TSV — nunca sobrescrevem. O log TSV É o banco.

## Formato do log TSV (o protocolo)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # cria entidade
set     <id>  <epoch_ms>  key  val                             # atualiza propriedade
rm      <id>  <epoch_ms>                                       # apaga entidade
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # cria relação
unlink  <from>  <rel>  <to>  <epoch_ms>                        # remove relação
# separado por tabs; escape: \t → tab, \n → newline, \\ → backslash
# as propriedades são pares key/val alternados (cada um é um campo tab separado)
```

Qualquer linguagem lê isso. AWK faz streaming, Python usa dicts, SQLite materializa. **O log é a fonte da verdade.**

## Uso da CLI

```
x ondb add --type Person --name Alice                            # UUID automático
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # detalhe da entidade
x ondb set --id t1 status=done                                  # atualiza prop
x ondb rm --id t1                                               # apaga

x ondb link --from proj_001 --rel has_task --to t1              # cria relação
x ondb link --from t1 --rel blocks --to t2                      # com props do link: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # relações de saída
x ondb linked --id t1 --direction incoming                      # de entrada (quem aponta PARA)
x ondb related --id proj_001 --rel has_task --json              # entidade inteira do outro lado

x ondb ls --type Task                                           # lista por tipo
x ondb query --type Task --where status=open --json             # filtra por props
```

`linked` = metadados da relação. `related` = a entidade inteira do outro lado. Use `--dir <path>` / `-d <path>` para o diretório de dados (→ `path/ondb.tsv`).

## Schema e validação

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # checa required, enum, refs penduradas, cardinalidade, ciclos
```

Diretivas: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. A validação é separada da escrita.

## Princípios de arquitetura

- **O log é a fonte** — o log TSV é autoritativo; o SQLite é uma visão materializada
- **Append-only** — `set`, `rm`, `unlink` acrescentam linhas; nunca modificam linhas existentes
- **Múltiplas instâncias** — um ondb por subdomínio (padrão); merge apenas para cadeias entre domínios
- **Type = Concept** — o mesmo nome de tipo sempre significa o mesmo conceito
- **Valide sob demanda** — nenhuma checagem de schema na escrita; rode `validate` depois de mudanças em lote

## Backends

| Backend | Quando | |
|---|---|---|
| **AWK** (padrão) | < 2k entidades | Zero deps, streaming |
| Python | Médio | Estruturas de dados ricas |
| JS/Bun | Web apps | JSON nativo |
| SQLite | > 5k entidades | Gerado automaticamente a partir do log TSV |

## Estrutura de diretórios

```
<datadir>/ONDB.DESC.txt    # Obrigatório. Identifica a instância ondb
<datadir>/ondb.tsv         # Log append-only
<datadir>/schema.tsv       # Opcional. Restrições
<datadir>/ondb.db          # Opcional. Visão materializada em SQLite
```

## Para mais informações

- `x ondb --help` — referência da CLI
- `x ondb libpath {awk,py,js}` — caminhos de biblioteca para queries customizadas
- [ondb SKILL.md](../../../ondb/SKILL.md) — documentação completa (cenários, integração, queries customizadas, config de WAL do SQLite)

## Relacionados

- [yfm](../yfm/SKILL.md) — o `metadata:` do yfm é a superfície de ingestão recomendada
- [rule](../rule/SKILL.md) — as regras de validação de schema moram no framework de rules