---
name: cve
description: |
  Vyhledávání záznamů CVE přes x cve — v mezipaměti, bez API klíče, denní xz TSV.
  Načítej pro cve, vulnerability id, kev, epss, nvd, cvelist nebo security advisory.

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

Komprimované xz TSV po jednotlivých rocích; běžný a předchozí rok se automaticky obnovují (TTL 1 h), starší roky zůstávají zmražené po dobu 180 dní. Po prvním online dni `x cve` funguje offline neomezeně dlouho.

## Rychlý start s `x cve`

```bash
x cve info CVE-2024-0001      # vyhledání podle id (zkráceně: x cve 2024-0001)
x cve year 2024               # roční stream, TSV vhodný pro přesměrování
x cve detail CVE-2024-0001    # úplný upstream záznam (produkty, CWE, reference, ADP)
```

`x cve -h` pro všechny příznaky, podpříkazy a zkrácené formy.

## Data a související nástroje

Denní xz TSV je publikováno na `github.com/x-cmd/cve/releases/download/data/` (schéma je dokumentováno u daného release). Záznam v mezipaměti je jen tenká projekce — pro otázky, které sahají o krok dál, slouží:

- `x shodan cve CVE-X` — skóre EPSS, členství v KEV, články o exploitech, bezpečnostní bulletiny výrobců
- `x kev ls` — katalog CISA KEV (seznam známě zneužitých zranitelností, kompletní tabulka)
- `x osv` — dotaz na úrovni jednotlivých verzí balíčků („je MOJE verze zranitelná"); přijímá id `osv-*` i `cve-*`
- `x cve detail` — surový JSON z `CVEProject/cvelistV5` (kanonický upstream, načítán na vyžádání)
