---
source: lib/skill0/core/yfm/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: yfm
description: |
  任意 markdown 文章的 YAML front matter（YFM）。x-cmd 的默认有三个：`tags`、`description`、`memo`。默认借鉴 Agent Skills frontmatter 形态 —— 见 <https://agentskills.io/specification>。yfm 模块是个 helper：`x yfm ls / init / lint`。

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## 采用 YFM

任何可能被 agent、索引或本体 pipeline 扫描的 markdown，都用 YFM。**若已有方言在用，跟着它走**（Agent Skills、Obsidian、Jekyll、Hugo 等）—— x-cmd 默认仅在没有其他方言管辖时生效。

## x-cmd 默认：三个字段

```yaml
---
tags: [design, front-matter]
description: 一句话摘要，读者用它决定是否打开本文件。
memo:
  2026-07-31T14:30:00+08:00: 砍掉 aliases；第三个字段重命名为 memo。
---

# 标题

正文...
```

- **`tags`** — 顶层 slug 列表 `[a-z0-9-]`。消费者：本体索引的 collector。
- **`description`** — 顶层字符串。一句话。不是 Agent Skills 的 `description:`（那是 SKILL.md 专属要求，由 `skill0-writer` 管辖）。
- **`memo:`** — 顶层 map，文件的修订日志。键为 ISO 8601 时间戳（`YYYY-MM-DDTHH:mm:ss±HH:mm`，作者本地偏移）；值为简短变更描述。最新优先。没值得记录的历史时省略。

### 适用场景

- `<project>/.x-cmd/story/` — 扩展 `issue:` —— 见 [usecase/story.md](usecase/story.md)。
- GitHub issue / PR 正文 — 扩展 `repo:`、`number:` —— 见 [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md)。
- GitHub `README.md` — 仅默认字段。

## 模块

yfm 模块是个 helper。三个命令：

- `x yfm ls [path]` — 列出 YFM block；默认当前目录
- `x yfm init [path]` — 在 path 下每个 markdown 文件中写入 x-cmd 默认 block
- `x yfm lint [path]` — 检查每个 YFM block 是合法 YAML 并遵循其声明的方言

## 读取外部 front matter

collector 摄取多种方言。默认借鉴的规范见 <https://agentskills.io/specification>。各方言：

- [Agent Skills](usecase/agentskills.md) — `metadata:` 为 string→string；顶层闭合
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` 已保留
- [Jekyll](usecase/jekyll.md) — 列表或 **空格** 分隔
- [Hugo](usecase/hugo.md) — 可用 TOML；taxonomy 由站点配置