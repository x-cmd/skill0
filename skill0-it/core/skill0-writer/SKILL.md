---
name: skill0-writer
description: Convenzioni di scrittura per i documenti skill0 — struttura a piramide, limiti di righe e regole di layout.
metadata:
  related: "yfm,naming"
---

# skill0-writer

I documenti skill0 seguono il **principio della piramide**: gli agenti possono leggere solo le prime 10–30 righe, quindi le informazioni più importanti devono venire per prime. Il dettaglio oltre la riga 30 è un bonus, non il carico.

## Cose che nessuna regola cattura

- **La chiarezza più della brevità.** Un documento breve che dà la risposta sbagliata è peggio di uno lungo che dà quella giusta.
- **Gli avvisi di sicurezza DEBONO essere espliciti** — usa MUST, NEVER, DO NOT. Esponi le avvertenze come affermazioni complete, non come parentesi.
- **Non sviluppare il senso comune.** Se una parola di convenzione più una o due frasi trasmette il punto, fermati. Il lettore sa già cosa sono YAML, git e una cache; spendi il contesto su ciò che è specifico di questo repo. La giustificazione è il colpevole abituale — dai il motivo di una regola solo quando senza sembra sbagliato. (`sw-1200`)
- **Tabelle solo per vere matrici.** 3+ colonne le cui righe vanno lette l'una contro l'altra. Una tabella a due colonne è un elenco con la sintassi delle tabelle — scrivi l'elenco. Un dataset sta in un `.tsv` esterno accanto al documento, collegato, così `x tsv` può interrogarlo. (`sw-1250`)

## YFM — solo `SKILL.md`

```yaml
---
name: <slug>                  # deve essere uguale al nome della directory
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` e `description` sono portanti. Tutto il resto sta sotto il blocco `metadata:` di [yfm](../yfm/SKILL.md) come scalari separati da virgole — facoltativi, e aggiungono struttura per indicizzazione, scoperta e agganci ontologici.

**I sotto-file non hanno YFM.** Solo `SKILL.md` viene filtrato da un loader, quindi solo lui ha bisogno di front matter. Ogni altro file (`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …) viene letto direttamente da un agente che ha già deciso di aprirlo — lì YFM è puro costo di token, un ripetere uno scopo che il titolo e la prima riga già danno. Inizia quei file dall'heading `#`. Deviarti richiede una ragione dichiarata dentro il file stesso.

Per le versioni localizzate in cinese usa un `SKILL.cn.md` parallelo (uno per skill). Non mescolare le lingue dentro un singolo file.

## Controlli meccanici

Vivono in [skill0-writer.rule.yml](skill0-writer.rule.yml). Esegui `x rule lint skill0-writer.rule.yml` e `x rule check -r skill0-writer.rule.yml lib/skill0/`. Copertura: presenza di YFM + campi name/description, formato del nome, numero di righe ≤ 100 (idealmente 50), ordine delle sezioni install → usage → advanced → links, solo inglese, niente introduzione / niente conclusione / niente ripetizioni, niente file orfani.

## Controllo di sicurezza sul troncamento

Dopo aver scritto, rileggi alla riga 30: un agente che si ferma qui formerebbe una comprensione sbagliata?

Se sì, sposta prima il qualificatore critico. Le prime 30 righe devono dare un modello mentale corretto (anche se incompleto). Oltre la riga 30, approfondisci con i dettagli — la piramide si autocorregge.

## Caricamento a due livelli: la descrizione per il matching, il corpo per la consultazione

I loader di skill (Claude Code, Cursor, Continue, ecc.) caricano SKILL.md in due fasi:

  1. **YFM `description:`** — caricata automaticamente nel catalogo
     dell'agente per il matching. L'agente legge la descrizione per decidere
     se caricare la skill.
  2. **Corpo** — caricato su richiesta dopo il match. Materiale di consultazione.

Conseguenze:

- **Descrizione** = *cos'è + quando caricarla* — densa di parole chiave,
  ricca di trigger, tersa.
- **Corpo** = *come usarla + referenza* — esempi, schemi, casi limite,
  link alla documentazione più approfondita.

**Non duplicare il contenuto tra i due livelli.** Qualunque cosa la descrizione comunichi, il corpo deve *svilupparla*, non ripeterla. In particolare il paragrafo iniziale del corpo non deve elencare le stesse funzionalità della descrizione — il corpo si apre con la referenza, non con un secondo riassunto.

Un test pratico: se cancelli del tutto la descrizione e leggi solo le prime 30 righe del corpo, l'agente dovrebbe comunque capire cosa fa la skill e quando caricarla. Se è solo la descrizione a portare quell'informazione, il corpo non ha niente da aggiungere in cima — sposta la spiegazione nel corpo e lascia che la descrizione porti il titolo.

## Una skill è un pacchetto di conoscenza, non un tutorial

Il corpo di una skill è un **briefing per l'LLM**, non un corso per un principiante.

- **La capacità** sta nell'LLM. Il corpo non insegna.
- **La conoscenza** sta negli strumenti dati di x-cmd (`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA) e nelle fonti esterne. Il corpo punta; l'agente riscarica.
- **L'inquadratura** è il lavoro della skill: nomina la forma del problema, la convenzione, l'output strutturato, lo strumento x-cmd da usare.

Una skill porta l'angolo di risoluzione, la convenzione, la forma dell'output e i puntatori alle fonti. Non porta la **capacità** (l'LLM ce l'ha già), i **dati statici** (invecchiscono) né i **tutorial** (usa i sidecar).

Dove i dettagli sono troppo specifici o troppo soggetti a obsolescenza, spingili su un sidecar (`references/`, `ANALYTICS.md`) o su una documentazione esterna sempre aggiornata.

## Link esterni

Raccogli due tipi: **link radice** (punti d'ingresso come `llms.txt`, indice della documentazione) e **link utili** (link mirati al 20% della documentazione che copre l'80% dei casi d'uso). Elenca prima le radici, poi le utili — l'AI capisce l'ordine. **Niente duplicazioni** salvo che l'enfasi sia cruciale.

## Avvertenze morbide (decisioni di giudizio)

- **Sotto-file (CLEANUP.md, references/*)** possono essere più lunghi di SKILL.md ma le prime 20 righe portano comunque il carico (stessa piramide).
- **DEVI** collegare ogni sotto-file dal suo SKILL.md genitore (link in avanti obbligatorio). Il link di ritorno dal sotto-file al suo SKILL.md è **facoltativo** — i file usecase referenziano il genitore implicitamente tramite il percorso. Imposto da `sw-1000-no-orphan-docs` in [skill0-writer.rule.yml](skill0-writer.rule.yml).
- **Speculazione** — enuncia i fatti verificati, oppure etichettali "non testato".
- **Emoji** a meno che l'argomento della skill non le richieda.

## Related

- [yfm](../yfm/SKILL.md) — convenzione YFM di cui skill0-writer impone il livello 1
- [naming](../naming/SKILL.md) — anche il naming segue le regole del writer
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — imposizione meccanica