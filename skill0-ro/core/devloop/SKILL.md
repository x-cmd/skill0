---
name: devloop
description: Buclă de dezvoltare bazată pe obiectiv — definește obiectivul, scrie reguli cu key-results, verifică vizual, sincronizează în issue tracker.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # sau un ruleset specific proiectului
x env use agent-browser                   # pentru verificare vizuală
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. Definește obiectivul → scrie rule.yml

Înainte de a scrie cod, creează un rule.yml pentru task:

```yaml
goal: "Fix English version showing Chinese tags in Features section"
keyresults:
  - kr-1: "English mode Features tags are all English"
  - kr-2: "Chinese mode Features tags remain Chinese"
  - kr-3: "Build passes with no regressions"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - When language=en, all details[] items must be English
    - No Chinese characters in any tag badge in English mode
```

Câmpurile unei reguli: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Vezi `x rule -h`.

**TREBUIE** să includă `goal` și `keyresults` — cele două câmpuri obligatorii pentru orice task de dezvoltare.

### 2. Execută → verificare vizuală (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... fă modificările ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**TREBUIE** capturi de ecran înainte și după. Compară cu intenția:
1. Verificare vizuală AI: after.png corespunde obiectivului?
2. Dacă nu corespunde → iterază și recapturează
3. **Șterge toate datele private** (token-uri, e-mailuri, informații personale) înainte de upload

### 3. Verifică cu x rule

```
x rule scan <files>     # rapid (~1 min), pentru bucla interioară
x rule check <files>    # riguros (~10 min)
x rule audit <files>    # raport complet (~30 min)
```

### 4. Sincronizează în issue tracker

Vezi [issue/SKILL.md](../issue/SKILL.md). Minim: postează obiectivul, key-results, rule.yml și capturile înainte/după în issue.

## Unelte pentru agent

- `x rule scan` — verificare rapidă în timpul iterațiilor
- `x rule check` — conformitate completă înainte de commit
- `agent-browser screenshot` — dovadă vizuală înainte/după
- `gh issue create/comment` — sincronizează obiectivul + rule.yml în tracker

## Related

- [rule](../rule/SKILL.md) — rule.yml e scheletul de verificare
- [score](../score/SKILL.md) — scoring-ul KR folosește framework-ul score
- [install](../install/SKILL.md) — pregătește mediul de dezvoltare
- [agent-browser](../../it/agent-browser/SKILL.md) — verificare vizuală înainte/după
- [issue](../issue/SKILL.md) — sincronizează obiectivul + KR-urile + capturile în issue tracker
- [repo](../repo/SKILL.md) — face pull/push la muncă în repo-uri
- [prompt](../prompt/SKILL.md) — convențiile de prompt dictează adesea task-uri devloop