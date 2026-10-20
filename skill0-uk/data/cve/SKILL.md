---
name: cve
description: |
  Шукайте записи CVE через x cve — з кешем, без API key, щоденний xz TSV.
  Завантажувати для cve, vulnerability id, kev, epss, nvd, cvelist або security advisory.

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

TSV, стиснутий xz, розбитий по роках; поточний і попередній рік оновлюються автоматично (TTL 1 година), старіші роки залишаються замороженими 180 днів. Після першого дня онлайн `x cve` працює офлайн нескінченно.

## Швидкий старт з `x cve`

```bash
x cve info CVE-2024-0001      # пошук за id (скорочено: x cve 2024-0001)
x cve year 2024               # потік за роком, TSV зручний для конвеєрів
x cve detail CVE-2024-0001    # повний upstream-запис (products, CWE, refs, ADP)
```

`x cve -h` — усі flag, підкоманди та скорочені форми.

## Дані та сусідні інструменти

Щоденний xz TSV публікується на `github.com/x-cmd/cve/releases/download/data/` (schema описана в release). Запис у кеші — це тонка проекція; для питань, які заходять за неї на один крок:

- `x shodan cve CVE-X` — бал EPSS, наявність у KEV, статті про експлойти, advisory від вендорів
- `x kev ls` — каталог CISA KEV (список відомих експлойтованих, повна таблиця)
- `x osv` — запит на рівні версії пакета («чи вразлива МОЯ версія»); приймає id `osv-*` і `cve-*`
- `x cve detail` — сирий JSON з `CVEProject/cvelistV5` (канонічний upstream, завантажується на вимогу)