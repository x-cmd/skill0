---
name: cve
description: |
  Cerca i record CVE tramite x cve — in cache, senza API key, TSV xz giornaliero.
  Carica per cve, vulnerability id, kev, epss, nvd, cvelist o security advisory.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

TSV compressi xz per anno; l'anno corrente e il precedente si aggiornano da soli (TTL di 1 h), gli anni più vecchi restano congelati per 180 giorni. Dopo il primo giorno online, `x cve` funziona offline per sempre.

## Guida rapida con `x cve`

```bash
x cve info CVE-2024-0001      # ricerca per id (abbreviazione: x cve 2024-0001)
x cve year 2024               # flusso per anno, TSV compatibile con le pipe
x cve detail CVE-2024-0001    # record completo dall'upstream (products, CWE, refs, ADP)
```

`x cve -h` per tutti i flag, i sottocomandi e le forme abbreviate.

## Dati e strumenti adiacenti

TSV xz giornalieri pubblicati su `github.com/x-cmd/cve/releases/download/data/` (schema documentato nella release). Il record in cache è una proiezione ridotta — per le domande che vanno un passo oltre:

- `x shodan cve CVE-X` — punteggio EPSS, appartenenza a KEV, articoli sugli exploit, advisory dei vendor
- `x kev ls` — catalogo KEV della CISA (elenco degli exploit noti, tabella completa)
- `x osv` — query a livello di pacchetto e versione ("la MIA versione è vulnerabile?"); accetta id `osv-*` e `cve-*`
- `x cve detail` — JSON grezzo da `CVEProject/cvelistV5` (upstream canonico, scaricato su richiesta)