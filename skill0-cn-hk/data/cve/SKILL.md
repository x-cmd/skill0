---
name: cve
description: |
  通過 x cve 查詢 CVE 記錄 —— 緩存、零 API key、按日 xz TSV。
  加載條件：cve、vulnerability id、kev、epss、nvd、cvelist 或 security advisory。

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

按年 xz 壓縮 TSV；當年與去年自動刷新（1 小時 TTL），更早年份保持凍結 180 天。第一個在線日後，`x cve` 可無限離線工作。

## `x cve` 快速上手

```bash
x cve info CVE-2024-0001      # id 查詢（簡寫：x cve 2024-0001）
x cve year 2024               # 按年流式輸出，可管道的 TSV
x cve detail CVE-2024-0001    # 完整上游記錄（products, CWE, refs, ADP）
```

`x cve -h` 查看全部 flag、子命令與簡寫形式。

## 數據與鄰近工具

每日 xz TSV 發佈於 `github.com/x-cmd/cve/releases/download/data/`（schema 見 release）。緩存記錄是一份精簡投影 —— 對於再跳一步的問題：

- `x shodan cve CVE-X` — EPSS 分數、KEV 成員、exploit 文章、廠商 advisory
- `x kev ls` — CISA KEV 目錄（已知被利用列表，全表）
- `x osv` — 按包版本號粒度的查詢（"我這個版本是否受影響"）；接受 `osv-*` 與 `cve-*` id
- `x cve detail` — 原始 `CVEProject/cvelistV5` JSON（權威上游，按需拉取）