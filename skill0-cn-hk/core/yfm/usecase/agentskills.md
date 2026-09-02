# Agent Skills

規範：<https://agentskills.io/specification>

## 典型示例

```markdown
---
name: pdf-processing
description: 提取 PDF 文本、填表、合併文件。處理 PDF 時使用。
license: Apache-2.0
compatibility: 需要 Python 3.14+ 和 uv
allowed-tools: Bash(git:*) Bash(jq:*) Read
metadata:
  author: example-org
  version: "1.0"
  tags: "pdf,forms,extraction"
---
```

## 標籤提取

- **key** — `metadata.tags`（嵌一層，非頂層）
- **type** — **字符串**。規範強制 `metadata` 為 string→string map；不允許 list。
- **separator** — 規範未定義。skill0 約定：逗號，無空格。

這裏用逗號 join 是安全的，因為值域受限：slug 為 `[a-z0-9-]`，不能含逗號。注意同一 front matter 中 `allowed-tools` 是 **空格** 分隔，而 `metadata.tags` 是逗號分隔 —— 規範內的分隔符不統一，按 key 分發。

## 頂層是閉合集合

只有：`name`、`description`、`license`、`compatibility`、`metadata`、`allowed-tools`。

頂層 `version`、`author`、`tag`、`date` 都是不合規的 —— 它們應位於 `metadata:` 之下。這與其他方言的最大差異：其他方言允許在頂層加字段；這個不允許。

## 本體映射

`metadata:` 下一切都是 string，無需類型推斷 —— 每個 key 直接成為 entity property。

規範建議 key 名"合理唯一"以避免衝突，因此 `metadata:` 裏的通用 key（`type`、`category`、`related`）必須視作本地命名，不可假定跨方言同義。

## 約束

- `name`：1–64 字符，`[a-z0-9-]`，首尾無連字符，無連續 `--`，必須等於父目錄名
- `description`：1–1024 字符
- `compatibility`：≤500 字符