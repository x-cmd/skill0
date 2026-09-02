---
source: lib/skill0/core/yfm/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: yfm
description: |
  任意 markdown 文章的 YAML front matter（YFM）。x-cmd 的默認有三個：`tags`、`description`、`memo`。默認借鑑 Agent Skills frontmatter 形態 —— 見 <https://agentskills.io/specification>。yfm 模塊是個 helper：`x yfm ls / init / lint`。

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## 採用 YFM

任何可能被 agent、索引或本體 pipeline 掃描的 markdown，都用 YFM。**若已有方言在用，跟着它走**（Agent Skills、Obsidian、Jekyll、Hugo 等）—— x-cmd 默認僅在沒有其他方言管轄時生效。

## x-cmd 默認：三個字段

```yaml
---
tags: [design, front-matter]
description: 一句話摘要，讀者用它決定是否打開本文件。
memo:
  2026-07-31T14:30:00+08:00: 砍掉 aliases；第三個字段重命名為 memo。
---

# 標題

正文...
```

- **`tags`** — 頂層 slug 列表 `[a-z0-9-]`。消費者：本體索引的 collector。
- **`description`** — 頂層字符串。一句話。不是 Agent Skills 的 `description:`（那是 SKILL.md 專屬要求，由 `skill0-writer` 管轄）。
- **`memo:`** — 頂層 map，文件的修訂日誌。鍵為 ISO 8601 時間戳（`YYYY-MM-DDTHH:mm:ss±HH:mm`，作者本地偏移）；值為簡短變更描述。最新優先。沒值得記錄的歷史時省略。

### 適用場景

- `<project>/.x-cmd/story/` — 擴展 `issue:` —— 見 [usecase/story.md](usecase/story.md)。
- GitHub issue / PR 正文 — 擴展 `repo:`、`number:` —— 見 [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md)。
- GitHub `README.md` — 僅默認字段。

## 模塊

yfm 模塊是個 helper。三個命令：

- `x yfm ls [path]` — 列出 YFM block；默認當前目錄
- `x yfm init [path]` — 在 path 下每個 markdown 文件中寫入 x-cmd 默認 block
- `x yfm lint [path]` — 檢查每個 YFM block 是合法 YAML 並遵循其聲明的方言

## 讀取外部 front matter

collector 攝取多種方言。默認借鑑的規範見 <https://agentskills.io/specification>。各方言：

- [Agent Skills](usecase/agentskills.md) — `metadata:` 為 string→string；頂層閉合
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` 已保留
- [Jekyll](usecase/jekyll.md) — 列表或 **空格** 分隔
- [Hugo](usecase/hugo.md) — 可用 TOML；taxonomy 由站點配置