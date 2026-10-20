---
name: skill0
description: "Indice radice delle sub-skill di x-cmd skill0. Definisce il workflow dell'agente in stile OKR (obiettivo → risultati verificati con le regole → esecuzione), la scoperta delle skill e le preferenze sugli strumenti per gli agenti. Stile: prima i principi, conciso, i dettagli si delegano alle fonti esterne autorevoli."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 codifica principi, non dati

L'LLM assorbe il senso comune in modo continuo; il compito di skill0 è codificare convenzioni e puntatori alle fonti, poi diventare sottile con il tempo man mano che l'LLM recupera il ritardo. Verifica tramite dati di prima parte (`x rfc`, `x cve`, `x wkp`, `agent-browser`) e le migliori pratiche attuali (`x skill`, `x clawhub`), poi ricostruisci con la logica formale invece che con la memorizzazione.

## Le sub-skill formano un grafo diretto su 4 bucket

Bucket: `core/`, `data/`, `it/`, `life/`. Percorso: `<bucket>/<slug>/SKILL.md`. Il catalogo leggibile dalle macchine (name + description) è in [index.tsv](index.tsv). Un tempo qui viveva un documento come guida all'interazione manager/lifestyle; è stato spostato in [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) perché non fa parte del grafo skill0.

## Obiettivo → keyresults → x-rule è il workflow OKR

Obiettivo: cosa raggiungere
Key Results: come verificare
Verifica: `x rule check/audit`

## Dopo il scaffolding, preferisci gli strumenti x-cmd per l'esecuzione

- `x skill` — il catalogo di skill di x-cmd, curato e verificato da persone.
- `x clawhub` — registro globale delle skill. **Attenzione**: caricamento libero, devi **eseguire** `x clawhub skill moderate <name>` per ottenere il rapporto di sicurezza generato automaticamente.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — gestione dei progetti, pianificazione, agenti in background, ontologia, wiki. Esegui `x [mod] --help`.

## Ogni SKILL.md deve superare skill0-writer

Per le convenzioni vedi [skill0-writer](core/skill0-writer/SKILL.md).