---
name: cve
description: |
  Wyszukiwanie rejestrów CVE za pomocą x cve — z cache, bez klucza API, codzienny TSV w xz.
  Wczytuj dla cve, identyfikatora podatności, kev, epss, nvd, cvelist lub komunikatu bezpieczeństwa.

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

TSV skompresowany xz dla każdego roku; bieżący i poprzedni rok odświeżają się automatycznie (TTL 1 godz.), starsze lata pozostają zamrożone na 180 dni. Po pierwszym dniu pracy online `x cve` działa offline bez ograniczeń.

## Szybki start z `x cve`

```bash
x cve info CVE-2024-0001      # wyszukanie po identyfikatorze (skrót: x cve 2024-0001)
x cve year 2024               # strumień dla roku, TSV przyjazny dla potoków
x cve detail CVE-2024-0001    # pełny rejestr źródłowy (produkty, CWE, odnośniki, ADP)
```

`x cve -h` dla wszystkich flag, podpoleceń i form skróconych.

## Dane i powiązane narzędzia

Codzienny TSV w xz publikowany pod `github.com/x-cmd/cve/releases/download/data/` (schemas opisany przy wydaniu). Rejestr w cache to cienka projekcja — na pytania wykraczające jeden krok dalej masz:
- `x shodan cve CVE-X` — wynik EPSS, obecność w KEV, artykuły o exploitach, komunikaty producentów
- `x kev ls` — katalog CISA KEV (lista znanych exploitów, pełna tabela)
- `x osv` — zapytanie na poziomie wersji pakietu („czy MOJA wersja jest podatna"); przyjmuje identyfikatory `osv-*` i `cve-*`
- `x cve detail` — surowy JSON z `CVEProject/cvelistV5` (kanoniczne źródło, pobierane na żądanie)