---
name: devloop
description: Pętla rozwoju sterowana celem — zdefiniuj cel, zapisz reguły z wynikami kluczowymi, zweryfikuj wizualnie, zsynchronizuj z trackerem issue.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Konfiguracja

```
x rule init :ror                          # albo zestaw reguł specyficzny dla projektu
x env use agent-browser                   # do weryfikacji wizualnej
```

## Przepływ pracy

```
cel → rule.yml → kod → weryfikacja → issue
```

### 1. Zdefiniuj cel → zapisz rule.yml

Przed pisaniem kodu utwórz dla zadania plik rule.yml:

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

Pola reguły: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Zobacz `x rule -h`.

**MUST** zawierać `goal` i `keyresults` — dwa obowiązkowe pola każdego zadania deweloperskiego.

### 2. Wykonaj → weryfikacja wizualna (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... wprowadź zmiany ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**MUST** zrobić zrzut ekranu przed i po. Porównaj z intencją:
1. Sprawdzenie wzrokiem AI: czy after.png odpowiada celowi?
2. Jeśli nie — iteruj i zrób zrzut ponownie
3. **Usuń wszystkie dane prywatne** (tokeny, adresy e-mail, dane osobowe) przed wgraniem

### 3. Zweryfikuj za pomocą x rule

```
x rule scan <pliki>     # szybko (~1 min), na pętli wewnętrznej
x rule check <pliki>    # dokładnie (~10 min)
x rule audit <pliki>    # pełny raport (~30 min)
```

### 4. Synchronizuj z trackerem issue

Zobacz [issue/SKILL.md](../issue/SKILL.md). Minimum: wklej do issue cel, wyniki kluczowe, rule.yml i zrzuty ekranu przed/po.

## Narzędzia agenta

- `x rule scan` — szybkie sprawdzenie w trakcie iteracji
- `x rule check` — pełna zgodność przed commitem
- `agent-browser screenshot` — wizualny dowód przed/po
- `gh issue create/comment` — synchronizacja celu + rule.yml z trackerem

## Powiązane

- [rule](../rule/SKILL.md) — rule.yml to szkielet weryfikacji
- [score](../score/SKILL.md) — punktacja KR korzysta z ramki score
- [install](../install/SKILL.md) — konfiguruje środowisko deweloperskie
- [agent-browser](../../it/agent-browser/SKILL.md) — wizualna weryfikacja przed/po
- [issue](../issue/SKILL.md) — synchronizuje cel + KR + zrzuty ekranu z trackerem issue
- [repo](../repo/SKILL.md) — pobiera/wypyła pracę w repozytoriach
- [prompt](../prompt/SKILL.md) — konwencje promptów często napędzają zadania devloop