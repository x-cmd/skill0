---
name: score
description: |
  Framework di valutazione a dimensioni pesate per agenti AI — "Non indovinare. Valuta." Idea di fondo: prima capire i bisogni, poi abbozzare e iterare, l'agente è l'analista. Produce un TSV ordinato tramite `x score compute`.
metadata:
  related: "rule,naming"
---


# Score
"Non indovinare. Valuta."
Framework di valutazione a dimensioni pesate per agenti AI.
## Come usarlo
**Prima capire, poi valutare.** Fai domande sufficienti prima di definire le dimensioni. Dimensioni sbagliate → punteggi sbagliati, per quanto precisa sia la misura.
**Abbozza e poi itera.** Quando i bisogni non sono del tutto chiari, fai uno standard al meglio delle tue possibilità, valuta e mostra i risultati. Gli utenti reagiscono a classificazioni concrete — "questo fattore dovrebbe pesare di più", "ti sei dimenticato di X". È quello il segnale. Affina e rivaluta. Un'iterazione vale dieci giri di supposizioni.
**L'agente è l'analista.** Dopo il compute, leggi il TSV. Spiega perché X ha battuto Y. Evidenzia le sorprese. Suggerisci aggiustamenti. La classifica apre la conversazione, non la chiude.
## Flusso principale
```
① Capire i bisogni  →  ② Definire score.yml  →  ③ Valutare score.tsv  →  ④ x score compute  →  ⑤ Referire e iterare
```
Output: `target, total, rank, block, reason, <dim> (X%), evidence`. Total 0–100, ordinato in modo decrescente. rank=1 è il migliore.
## Esempio — aiutare un utente a scegliere gli slogan promozionali
1. Discuti con l'utente per definire dimensioni e criteri di valutazione. Scrivi `slogan.score.yml`.
2. L'AI valuta ogni slogan per ogni dimensione (0–10, con evidenze) → `slogan.score.tsv`. Lascia vuoti total e rank.
3. `x score compute slogan.score.yml slogan.score.tsv` → riempie total + rank.
4. Leggi i risultati, discuti con l'utente. Adegua i punteggi o aggiungi candidati, ripeti.
5. Oppure: `x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
Altri esempi: [EXAMPLE.md](EXAMPLE.md).
## Modello a due file
- `*.score.yml` — Standard riusabile: dimensioni, fattori, descrizioni
- `**.score.tsv` — Obiettivi + punteggi + evidenze; colonna 1 = nome dell'obiettivo
`x score compute <yml> <tsv>` equivale a `python compute.py`.
## Scenari di applicazione
1. **Dà agli agenti un workflow decisionale.** score.yml àncora l'agente a un processo strutturato — l'agente segue lo standard, non l'umore dell'ultimo messaggio.
2. **Le decisioni sono basate su regole.** Dimensioni × fattori × evidenze → totale pesato → rank. Ogni punteggio è ancorato a fatti. Il ragionamento è trasparente.
3. **Si adatta a esigenze diverse.** Cambia dimensioni, aggiusta i fattori, aggiungi filtri rigidi (colonna `block`). Stesso template, utenti diversi.
4. **Evolue man mano che le esigenze si chiariscono.** Bozza → valutazione → feedback → affinamento → più netto.
5. **File standard + risultati archiviati per qualsiasi skill.** score.yml = standard decisionale. score.tsv = verbale decisionale. Entrambi archiviabili, revisionabili, condivisibili.
---
## Formula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — intero 1–10. Base = 2. 1=minore, 4=2×, 6=3×, 8=4×, 10=5×. Normalizzato automaticamente.
- **score** — da 0 a 10 per dimensione, ancorato alle evidenze.
- **total** — totale pesato da 0 a 100.
Le intestazioni delle dimensioni mostrano la percentuale di peso: `factor ÷ Σ(factor) × 100`.
## Colonne di output
| Column | Source | Description |
|--------|--------|-------------|
| `target` | input | Nome del candidato |
| `total` | calcolato | Punteggio pesato (0–100) |
| `rank` | calcolato | 1 = migliore. `X` se bloccato |
| `block` | input | Filtro rigido — non vuoto = squalificato, spinto in fondo, rank=X |
| `reason` | input/output | Facoltativo: note dell'AI sulle sfumature del punteggio |
| `<dim> (X%)` | calcolato | Punteggi per dimensione, l'intestazione mostra la percentuale di peso |
| `evidence` | input | Fatti che sostengono ogni punteggio |
## Scala
- 9–10 — Eccellente — soddisfa pienamente i criteri
- 7–8 — Buono — soddisfa i criteri, lacuna minore
- 5–6 — Adeguato — direzione giusta, omissione notevole
- 3–4 — Debole — lacuna significativa
- 1–2 — Fallito — appena affrontato
- 0 — N/D — non applicabile
## Regole
1. **Ancoraggio alle evidenze** — ogni punteggio DEVE avere evidenze. Fatti, non sensazioni.
2. **Usa tutto l'intervallo** — 5 è il punto medio, non il valore predefinito. 0 e 10 sono rari ma possibili.
3. **I fattori sono amplificatori relativi** — factor 2 = 2× l'influenza di factor 1. Normalizzato automaticamente.
4. **Obiettivi unici e non vuoti** — ogni riga della colonna 1 deve avere un nome di obiettivo. Nessun duplicato, nessun vuoto.
5. **L'agente legge, riferisce, decide** — dopo il compute, spiega i risultati. Rivaluta o riappesa secondo necessità.
## File
- `SKILL.cn.md` — Versione cinese
- `compute.py` — Valida + calcola total + rank
- `template/*.score.yml` — 35+ template. `x score ls` li elenca, `x score init -t <name>` li copia
- `EXAMPLE.md` — Altri esempi d'uso
- `rule-vs-score.md` — Quando usare rule e quando score
- `score-template-writer.md` — Come scrivere i template di valutazione

## Related

- [rule](../rule/SKILL.md) — compagno di conformità abbinato
- [naming](../naming/SKILL.md) — qui vengono valutati i nomi candidati