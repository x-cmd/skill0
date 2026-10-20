---
name: devloop
description: Cílem vedený vývojový cyklus — definovat cíl, psát pravidla s klíčovými výsledky, vizuálně ověřovat, synchronizovat do issue trackeru.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Nastavení

```
x rule init :ror                          # nebo pravidla specifická pro projekt
x env use agent-browser                   # pro vizuální ověření
```

## Pracovní postup

```
goal → rule.yml → code → verify → issue
```

### 1. Definuj cíl → napiš rule.yml

Před kódováním vytvoř pro úkol rule.yml:

```yaml
goal: "Opravit anglickou verzi, která v sekci Features zobrazuje čínské tagy"
keyresults:
  - kr-1: "V anglickém režimu jsou všechny tagy Features anglické"
  - kr-2: "V čínském režimu zůstávají tagy Features čínské"
  - kr-3: "Build projde bez regresí"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Když language=en, všechny položky details[] musí být anglické
    - Žádné čínské znaky v žádném tagovém badge v anglickém režimu
```

Pole pravidla: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Viz `x rule -h`.

**MUSÍ** obsahovat `goal` a `keyresults` — dvě povinná pole pro každou dev úlohu.

### 2. Proveď → vizuální ověření (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... proveď změny ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**MUSÍ** udělat screenshot před a po. Porovnej se záměrem:
1. Vizuální kontrola AI: odpovídá after.png cíli?
2. Pokud ne → iteruj a udělej screenshot znovu
3. **Před nahráním odstraň všechna osobní data** (tokeny, e-maily, osobní údaje)

### 3. Ověř pomocí x rule

```
x rule scan <files>     # rychlé (~1 min), pro vnitřní cyklus
x rule check <files>    # důkladné (~10 min)
x rule audit <files>    # úplný report (~30 min)
```

### 4. Synchronizuj do issue trackeru

Viz [issue/SKILL.md](../issue/SKILL.md). Minimum: zveřejni cíl, klíčové výsledky, rule.yml a screenshoty před/po do issue.

## Nástroje pro agenty

- `x rule scan` — rychlá kontrola během iterace
- `x rule check` — úplná kontrola compliance před commitem
- `agent-browser screenshot` — vizuální důkaz před/po
- `gh issue create/comment` — synchronizace cíle a rule.yml do trackeru

## Související

- [rule](../rule/SKILL.md) — rule.yml je kostra ověření
- [score](../score/SKILL.md) — bodování KR používá score framework
- [install](../install/SKILL.md) — nastavuje vývojové prostředí
- [agent-browser](../../it/agent-browser/SKILL.md) — vizuální ověření před/po
- [issue](../issue/SKILL.md) — synchronizuje cíl + KR + screenshoty do issue trackeru
- [repo](../repo/SKILL.md) — stahuje/pushuje práci v repozitářích
- [prompt](../prompt/SKILL.md) — konvence promptů často řídí úlohy devloopu
