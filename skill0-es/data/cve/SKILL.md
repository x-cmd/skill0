---
name: cve
description: |
  Consulta registros CVE vía x cve — cacheados, sin API key, TSV xz diario.
  Carga para cve, vulnerability id, kev, epss, nvd, cvelist, o security advisory.

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

TSV comprimido con xz por año; el año actual y el anterior se refrescan solos (TTL de 1 h), los años más antiguos quedan congelados 180 d. Tras el primer día con conexión, `x cve` funciona sin conexión indefinidamente.

## Inicio rápido con `x cve`

```bash
x cve info CVE-2024-0001      # búsqueda por id (forma corta: x cve 2024-0001)
x cve year 2024               # stream por año, TSV apto para tuberías
x cve detail CVE-2024-0001    # registro upstream completo (productos, CWE, refs, ADP)
```

`x cve -h` para todas las flags, subcomandos y formas cortas.

## Datos y herramientas adyacentes

TSV xz diario publicado en `github.com/x-cmd/cve/releases/download/data/` (esquema documentado en la release). El registro cacheado es una proyección fina — para las preguntas que van un salto más allá:

- `x shodan cve CVE-X` — puntuación EPSS, pertenencia a KEV, artículos sobre exploits, avisos del fabricante
- `x kev ls` — catálogo CISA KEV (lista de explotados conocidos, tabla completa)
- `x osv` — consulta por versión de paquete ("¿mi versión es vulnerable?"); acepta ids `osv-*` y `cve-*`
- `x cve detail` — JSON crudo de `CVEProject/cvelistV5` (upstream canónico, se descarga bajo demanda)
