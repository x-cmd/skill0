# Agent Skills

规范：<https://agentskills.io/specification>

## 典型示例

```markdown
---
name: pdf-processing
description: 提取 PDF 文本、填表、合并文件。处理 PDF 时使用。
license: Apache-2.0
compatibility: 需要 Python 3.14+ 和 uv
allowed-tools: Bash(git:*) Bash(jq:*) Read
metadata:
  author: example-org
  version: "1.0"
  tags: "pdf,forms,extraction"
---
```

## 标签提取

- **key** — `metadata.tags`（嵌一层，非顶层）
- **type** — **字符串**。规范强制 `metadata` 为 string→string map；不允许 list。
- **separator** — 规范未定义。skill0 约定：逗号，无空格。

这里用逗号 join 是安全的，因为值域受限：slug 为 `[a-z0-9-]`，不能含逗号。注意同一 front matter 中 `allowed-tools` 是 **空格** 分隔，而 `metadata.tags` 是逗号分隔 —— 规范内的分隔符不统一，按 key 分发。

## 顶层是闭合集合

只有：`name`、`description`、`license`、`compatibility`、`metadata`、`allowed-tools`。

顶层 `version`、`author`、`tag`、`date` 都是不合规的 —— 它们应位于 `metadata:` 之下。这与其他方言的最大差异：其他方言允许在顶层加字段；这个不允许。

## 本体映射

`metadata:` 下一切都是 string，无需类型推断 —— 每个 key 直接成为 entity property。

规范建议 key 名"合理唯一"以避免冲突，因此 `metadata:` 里的通用 key（`type`、`category`、`related`）必须视作本地命名，不可假定跨方言同义。

## 约束

- `name`：1–64 字符，`[a-z0-9-]`，首尾无连字符，无连续 `--`，必须等于父目录名
- `description`：1–1024 字符
- `compatibility`：≤500 字符