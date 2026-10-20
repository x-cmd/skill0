---
name: skill0
description: "Kořenový index dílčích skillů x-cmd skill0. Definuje OKR stylový pracovní postup agenta (cíl → výsledky ověřené pravidly → provedení), vyhledávání skillů a preference nástrojů pro agenty. Styl: nejdřív principy, stručně, konkrétnosti přenechat autoritativním externím zdrojům."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 kóduje principy, ne data

LLM průběžně absorbuje obecné znalosti; úkolem skill0 je zakódovat konvence a ukazatele na zdroje a postupem času je řídnout, až LLM dožene. Ověřuj prvními daty (`x rfc`, `x cve`, `x wkp`, `agent-browser`) a aktuální nejlepší praxí (`x skill`, `x clawhub`), pak rekonstruj pomocí formální logiky místo memorování.

## Dílčí skilly tvoří orientovaný graf ve 4 bucketech

Buckety: `core/`, `data/`, `it/`, `life/`. Cesta: `<bucket>/<slug>/SKILL.md`. Strojově čitelný katalog (name + description) je v [index.tsv](index.tsv). Jeden dokument zde kdysi žil jako průvodce interakcí mezi managerem a životním stylem; byl přesunut do [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md), protože není součástí grafu skill0.

## Cíl → keyresults → x-rule je OKR pracovní postup

Cíl: Co dosáhnout
Klíčové výsledky: Jak ověřit
Ověření: `x rule check/audit`

## Po vytvoření kostry upřednostni nástroje x-cmd pro provádění

- `x skill` — kurátorský katalog skillů x-cmd, který prošel lidskou kontrolou.
- `x clawhub` — globální registr skillů. **Pozor**: nahrávání je bezplatné, MUSÍš spustit `x clawhub skill moderate <name>` pro automaticky vygenerovaný bezpečnostní report.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — řízení projektů, plánování, agenti na pozadí, ontologie, wiki. Spusť `x [mod] --help`.

## Každý SKILL.md musí projít skill0-writer

Konvence najdeš v [skill0-writer](core/skill0-writer/SKILL.md).
