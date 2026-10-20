---
name: skill0
description: "Korzeń indeksu podumiejętności x-cmd skill0. Definiuje przepływ pracy agenta w stylu OKR (cel → wynik zweryfikowany regułami → wykonanie), odkrywanie umiejętności oraz preferencje narzędzi agenta. Styl: najpierw zasady, zwięźle, szczegóły deleguj do autorytatywnych źródeł zewnętrznych."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 koduje zasady, nie dane

LLM ciągle przyswaja sobie wiedzę pospolitą; zadaniem skill0 jest zakodować konwencje i wskaźniki do źródeł, a następnie z czasem się zcieńczać, w miarę jak LLM nadrabia zaległości. Weryfikuj za pomocą danych pierwszej ręki (`x rfc`, `x cve`, `x wkp`, `agent-browser`) oraz aktualnej najlepszej praktyki (`x skill`, `x clawhub`), a potem odtwarzaj wiedzę logiką formalną, zamiast polegać na zapamiętywaniu.

## Podumiejętności tworzą graf skierowany w obrębie 4 wiader

Wiadra: `core/`, `data/`, `it/`, `life/`. Ścieżka: `<bucket>/<slug>/SKILL.md`. Katalog czytelny maszynowo (nazwa + opis) znajduje się w [index.tsv](index.tsv). Dawniej mieszkał tu jeden dokument będący przewodnikiem interakcji menedżer/życie; przeniesiono go do [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md), ponieważ nie jest częścią grafu skill0.

## Cel → wyniki kluczowe → x-rule to przepływ OKR

Cel: Co osiągnąć
Wyniki kluczowe: Jak zweryfikować
Weryfikacja: `x rule check/audit`

## Po zbudowaniu szkieletu do wykonania preferuj narzędzia x-cmd

- `x skill` — starannie wybrany katalog umiejętności x-cmd, zweryfikowany przez ludzi.
- `x clawhub` — globalny rejestr umiejętności. **Uwaga**: wgrywanie jest bezpłatne, więc **musisz** uruchomić `x clawhub skill moderate <name>`, aby otrzymać automatycznie wygenerowany raport bezpieczeństwa.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — zarządzanie projektem, planowanie, agenci w tle, ontologia, wiki. Uruchom `x [mod] --help`.

## Każdy SKILL.md musi przejść przez skill0-writer

Konwencje opisuje [skill0-writer](core/skill0-writer/SKILL.md).