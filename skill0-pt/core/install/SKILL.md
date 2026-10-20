---
name: install
description: |
  Instale software de qualquer jeito que o sistema permita. Recomenda `x install` — uma única porta de
  entrada que lista todos os métodos e escolhe o melhor; além dos canais `x eget`/`x env use`/`x pixi` e
  dos gerenciadores de pacotes do sistema com troca de mirror. Todos os canais do x-cmd instalam em $HOME —
  sem sudo, sem poluição.
  Use para "install", "apt", "brew", "eget", "pixi", "gerenciador de pacotes", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Instale software de qualquer jeito que o sistema permita. **Todos os canais do x-cmd (`x eget`, `x env use`, `x pixi`) instalam em `$HOME` — sem sudo, sem poluir o sistema.** Apenas os gerenciadores de pacotes do sistema (`x apt`, `x brew`, …) tocam o SO e podem precisar de sudo.

## Escolha um canal

- `x install` — **Recomendado.** Uma única porta de entrada — lista todos os métodos para uma ferramenta e escolhe o melhor
- `x eget` — Binários mais novos direto dos repos upstream (releases do GitHub / Codeberg)
- `x env use` — Runtimes e ferramentas hospedados pelo x-cmd (encobre `x pkg use`)
- `x pixi` — pacotes conda / do ecossistema pixi
- `x apt/brew/dnf/pacman` — Gerenciadores de pacotes do sistema (podem precisar de sudo)

## Pré-requisitos

O x-cmd oferece todos os canais acima:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — a porta de entrada recomendada

Toda ferramenta traz vários caminhos de instalação; o `x install` escolhe automaticamente o melhor. Todas as formas abaixo são não interativas (seguras para agente / CI):
```bash
x install bun                            # instala — escolhe o melhor método automaticamente
x install --printinfo ripgrep            # lista todos os métodos de instalação primeiro (somente leitura)
x install --withtool brew jq             # força um gerenciador; ou a forma com prefixo: brew/jq
x install --sys bun                      # apenas gerenciadores de pacotes do sistema
x install --printcmd bun vim             # mostra o comando, não executa
x install --env                          # sondagem de plataforma / arch / distro
x install --available-tool --installed   # quais gerenciadores de pacotes existem aqui
```

### Descubra o que é instalável

`x install --ls` emite um TSV de todas as ferramentas indexadas — use grep / awk offline:
```bash
x install --ls --tsv | head -1                  # cabeçalho
x install --ls --tsv | grep -i json             # busca por palavra-chave
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filtra por linguagem
x install --search http                         # busca agregada entre os registros
```
Colunas do TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Troque de mirror (downloads mais rápidos)

Redirecione um gerenciador de pacotes lento para um mirror mais rápido / local. Cada um tem `mirror ls` (lista opções) e `mirror set <code>` (aplica, não interativo):
```bash
x brew mirror ls          # lista: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # aplica o mirror da Tsinghua
x apt mirror set tuna     # mesma forma no Debian / Ubuntu (também dnf, pacman)
```
Requer que o gerenciador de pacotes alvo esteja instalado.

## Para saber mais

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Relacionados

- [x-cmd](../x-cmd/SKILL.md) — entrada guarda-chuva que dá a frente ao install
- [agent-browser](../../it/agent-browser/SKILL.md) — o install encaminha para o agent-browser quando não existe binário
- [env](../env/SKILL.md) — install e env compartilham a arquitetura de canais x