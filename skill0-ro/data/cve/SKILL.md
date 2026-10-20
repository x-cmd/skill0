---
name: cve
description: |
  Caută înregistrări CVE prin x cve — în cache, fără cheie API, TSV xz zilnic.
  Încarcă pentru cve, vulnerability id, kev, epss, nvd, cvelist sau security advisory.

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

TSV comprimat xz pe ani; anul curent și cel precedent se reîmprospătează automat (TTL 1 h), anii mai vechi rămân îngheațați 180 de zile. După prima zi online, `x cve` funcționează offline la nesfârșit.

## Quick Start cu `x cve`

```bash
x cve info CVE-2024-0001      # id lookup (shorthand: x cve 2024-0001)
x cve year 2024               # per-year stream, pipe-friendly TSV
x cve detail CVE-2024-0001    # full upstream record (products, CWE, refs, ADP)
```

`x cve -h` pentru toate flag-urile, subcomenzile și formele scurte.

## Date și unelte învecinate

TSV xz zilnic publicat la `github.com/x-cmd/cve/releases/download/data/` (schema documentată la release). Înregistrarea din cache e o proiecție subțire — pentru întrebările care merg cu un hop mai departe:

- `x shodan cve CVE-X` — scor EPSS, apartenență la KEV, articole despre exploit-uri, avizuri furnizori
- `x kev ls` — catalogul CISA KEV (lista exploit-urilor cunoscute, tabel complet)
- `x osv` — interogare la nivel de versiune pe pachet („versiunea MEA e vulnerabilă?"); acceptă id-uri `osv-*` și `cve-*`
- `x cve detail` — JSON brut din `CVEProject/cvelistV5` (upstream canonic, adus la cerere)