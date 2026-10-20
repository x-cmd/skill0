---
name: cve
description: |
  Поиск записей CVE через x cve — кэшируется, без API-ключа, ежедневный xz TSV.
  Загружайте для cve, vulnerability id, kev, epss, nvd, cvelist или security advisory.

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

По-годовой xz-сжатый TSV; текущий и прошлый годы автоматически обновляются (TTL 1 ч), более старые годы остаются замороженными 180 дней. После первого дня онлайн `x cve` работает офлайн неограниченно долго.

## Быстрый старт с `x cve`

```bash
x cve info CVE-2024-0001      # поиск по id (сокращение: x cve 2024-0001)
x cve year 2024               # поток по году, TSV для конвейера
x cve detail CVE-2024-0001    # полная upstream-запись (products, CWE, refs, ADP)
```

`x cve -h` для всех флагов, подкоманд и сокращений.

## Данные и смежные инструменты

Ежедневный xz TSV публикуется по адресу `github.com/x-cmd/cve/releases/download/data/` (схема задокументирована в релизе). Кэшированная запись — это тонкая проекция; для вопросов, уходящих на шаг дальше:

- `x shodan cve CVE-X` — оценка EPSS, членство в KEV, статьи об эксплойтах, vendor advisories
- `x kev ls` — каталог CISA KEV (список известных эксплуатируемых уязвимостей, полная таблица)
- `x osv` — запрос на уровне версии пакета («уязвима ли МОЯ версия»); принимает id формата `osv-*` и `cve-*`
- `x cve detail` — сырой JSON из `CVEProject/cvelistV5` (канонический upstream, загружается по запросу)
