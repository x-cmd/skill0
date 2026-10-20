---
name: ccal
description: |
  Calendário da região da China com 调休、农历、节气、生肖、黄历吉凶、干支纪年.
  Múltiplos modos de acesso: `x ccal`, download direto do arquivo, ou tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — a regra em que um fim de semana pode ser "emprestado" para criar um dia útil de folga, ou um dia útil é devolvido quando um feriado cai no fim de semana — é o recurso-chave para usuários chineses que planejam em torno do calendário oficial de trabalho.

## Início rápido com `x ccal`

```bash
# Mostra todas as informações de data em forma tsv. Colunas TSV abaixo:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(tres estados:休，工，无-非 调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Mostra todas as informações de data em forma tsv
x ccal ls 2026-07
# Uma data específica em YAML
x ccal info 2026-05-31
# Obtém o diretório de dados. Se estiver vazio, tente `x ccal update`
x ccal datadir
```

`x ccal -h` para mais informações.

Atenção: a fonte de dados é https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Para economizar espaço, `x ccal` navega no tar.xz usando o comando tar, sem descompactar. Recomendamos esse método, mas se você precisar de um tratamento mais livre, pode descompactar conforme precisar.