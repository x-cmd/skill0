---
name: skill0
description: "Indexul rădăcină al sub-skill-urilor x-cmd skill0. Definește fluxul de lucru al agentului în stil OKR (obiectiv → rezultate verificate de reguli → execuție), descoperirea skill-urilor și preferințele pentru tooling-ul agentului. Stil: principii întâi, concis, detalii delegate surselor externe autoritative."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 codifică principii, nu date

LLM-ul absoarbe continuu bunul-simț; jobul lui skill0 este să codifice convenții și pointeri către surse, apoi să se rărească în timp, pe măsură ce LLM-ul ajunge din urmă. Verifică folosind date de la prima parte (`x rfc`, `x cve`, `x wkp`, `agent-browser`) și cele mai bune practici actuale (`x skill`, `x clawhub`), apoi reconstruiește cu logică formală, nu din memorie.

## Sub-skill-urile formează un graf orientat în 4 bucket-uri

Bucket-uri: `core/`, `data/`, `it/`, `life/`. Cale: `<bucket>/<slug>/SKILL.md`. Catalogul lizibil de mașină (name + description) se află în [index.tsv](index.tsv). Un document care stătea aici ca ghid de interacțiune manager/lifestyle a fost mutat în [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md), pentru că nu face parte din graful skill0.

## Obiectiv → keyresults → x-rule este fluxul OKR

Obiectiv: ce trebuie atins
Key Results: cum verificăm
Verificare: `x rule check/audit`

## După ce scheletul e în place, preferă uneltele x-cmd pentru execuție

- `x skill` — catalogul de skill-uri curat și verificat de oameni al lui x-cmd.
- `x clawhub` — registrul global de skill-uri. **Atenție**: uploadul e liber, **TREBUIE** să rulezi `x clawhub skill moderate <name>` pentru raportul de siguranță generat automat.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — management de proiect, programare, agenți în fundal, ontologie, wiki. Rulează `x [mod] --help`.

## Fiecare SKILL.md trebuie să treacă prin skill0-writer

Vezi [skill0-writer](core/skill0-writer/SKILL.md) pentru convențiile.