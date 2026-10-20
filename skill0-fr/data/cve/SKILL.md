---
name: cve
description: |
  Consultez les enregistrements CVE via x cve — mis en cache, sans clé API, TSV xz quotidien.
  Charger pour cve, vulnerability id, kev, epss, nvd, cvelist, ou security advisory.

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

TSV compressé xz par année ; l'année courante et la précédente auto-rafraîchies (TTL 1h), les années plus anciennes restent gelées 180 j. Après le premier jour en ligne, `x cve` fonctionne hors ligne indéfiniment.

## Démarrage rapide avec `x cve`

```bash
x cve info CVE-2024-0001      # lookup par id (raccourci : x cve 2024-0001)
x cve year 2024               # flux par année, TSV pipe-friendly
x cve detail CVE-2024-0001    # enregistrement upstream complet (produits, CWE, refs, ADP)
```

`x cve -h` pour tous les flags, sous-commandes et formes raccourcies.

## Données et outils adjacents

TSV xz quotidien publié à `github.com/x-cmd/cve/releases/download/data/` (schéma documenté à la release). L'enregistrement en cache est une projection fine — pour les questions qui vont un saut au-delà :

- `x shodan cve CVE-X` — score EPSS, appartenance KEV, articles d'exploit, advisories vendeur
- `x kev ls` — catalogue CISA KEV (known-exploited list, table complète)
- `x osv` — requête par version de paquet (« ma version est-elle vulnérable ») ; accepte les ids `osv-*` et `cve-*`
- `x cve detail` — JSON brut `CVEProject/cvelistV5` (upstream canonique, fetched à la demande)
