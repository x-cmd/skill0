---
source: lib/skill0/data/cve/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: cve
description: |
  通过 x cve 查询 CVE 记录 —— 缓存、零 API key、按日 xz TSV。
  加载条件：cve、vulnerability id、kev、epss、nvd、cvelist 或 security advisory。

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

按年 xz 压缩 TSV；当年与去年自动刷新（1 小时 TTL），更早年份保持冻结 180 天。第一个在线日后，`x cve` 可无限离线工作。

## `x cve` 快速上手

```bash
x cve info CVE-2024-0001      # id 查询（简写：x cve 2024-0001）
x cve year 2024               # 按年流式输出，可管道的 TSV
x cve detail CVE-2024-0001    # 完整上游记录（products, CWE, refs, ADP）
```

`x cve -h` 查看全部 flag、子命令与简写形式。

## 数据与邻近工具

每日 xz TSV 发布于 `github.com/x-cmd/cve/releases/download/data/`（schema 见 release）。缓存记录是一份精简投影 —— 对于再跳一步的问题：

- `x shodan cve CVE-X` — EPSS 分数、KEV 成员、exploit 文章、厂商 advisory
- `x kev ls` — CISA KEV 目录（已知被利用列表，全表）
- `x osv` — 按包版本号粒度的查询（"我这个版本是否受影响"）；接受 `osv-*` 与 `cve-*` id
- `x cve detail` — 原始 `CVEProject/cvelistV5` JSON（权威上游，按需拉取）