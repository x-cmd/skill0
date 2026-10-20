---
name: cve
description: |
  CVE-Einträge über x cve nachschlagen — zwischengespeichert, ohne API-Schlüssel, tägliches xz-TSV.
  Laden für cve, vulnerability id, kev, epss, nvd, cvelist oder Security-Advisory.

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

Pro Jahr xz-komprimiertes TSV; aktuelles und vorletztes Jahr werden automatisch aktualisiert (1 h TTL), ältere Jahre bleiben 180 d eingefroren. Nach dem ersten Online-Tag arbeitet `x cve` dauerhaft offline.

## Schnellstart mit `x cve`

```bash
x cve info CVE-2024-0001      # ID-Nachschlag (Kurzform: x cve 2024-0001)
x cve year 2024               # Jahres-Stream, pipe-freundliches TSV
x cve detail CVE-2024-0001    # vollständiger Upstream-Eintrag (Produkte, CWE, Referenzen, ADP)
```

`x cve -h` für alle Flags, Unterbefehle und Kurzformen.

## Daten und angrenzende Werkzeuge

Tägliches xz-TSV veröffentlicht unter `github.com/x-cmd/cve/releases/download/data/` (Schema beim Release dokumentiert). Der zwischengespeicherte Eintrag ist eine dünne Projektion — für Fragen, die einen Hop weiter gehen:
- `x shodan cve CVE-X` — EPSS-Score, KEV-Mitgliedschaft, Exploit-Artikel, Hersteller-Advisories
- `x kev ls` — CISA-KEV-Katalog (bekannt ausgenutzte Liste, vollständige Tabelle)
- `x osv` — Abfrage auf Paket-Versionsebene ("ist MEINE Version verwundbar"); akzeptiert `osv-*`- und `cve-*`-IDs
- `x cve detail` — rohes `CVEProject/cvelistV5`-JSON (kanonisches Upstream, bei Bedarf abgerufen)
