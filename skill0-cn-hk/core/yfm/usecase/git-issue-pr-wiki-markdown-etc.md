---
source: lib/skill0/core/yfm/usecase/git-issue-pr-wiki-markdown-etc.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Surfaces — 哪裏用哪個 YFM

yfm skill 的逐 surface 映射。對於 x-cmd 寫入或讀取的每個 markdown surface，哪些字段適用。

## 速查

| Surface | 寫 | 讀 | 實用字段 |
|---|---|---|---|
| GitHub issue body | [§GitHub issue & PR bodies](#github-issue--pr-bodies) | 同 | `tags`, `description`, `repo`, `number` |
| GitHub PR body | [§GitHub issue & PR bodies](#github-issue--pr-bodies) | 同 | 同 issue |
| GitHub wiki page | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| GitHub `README.md` | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| `<project>/.x-cmd/story/*.md` | [story](story.md) | [story](story.md) | `tags`, `description`, `memo`, `issue` |
| `<skill>/SKILL.md` | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) + [skill0-writer](../../skill0-writer/SKILL.md) | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo`；按 skill0-writer 加 `metadata.related` |
| 本地 markdown 筆記 | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) 或無 YFM | [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| Obsidian vault 文件 | （Obsidian 原生） | [obsidian](obsidian.md) | `tags`, `aliases`, `cssclasses` |
| Jekyll 站點文件 | （Jekyll 原生） | [jekyll](jekyll.md) | `title`, `date`, `tags`, `categories` |
| Hugo 站點文件 | （Hugo 原生） | [hugo](hugo.md) | `title`, `date`, `tags`, `keywords`, 站點 taxonomy |
| Agent Skill 文件 | [agentskills](agentskills.md) | [agentskills](agentskills.md) | `name`, `description`, `metadata.*` |

未列出的全部回退到 [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields)。3 個字段是下限而非上限 —— 但要加更多，得新增 usecase，永遠不是私用字段。

## GitHub issue & PR bodies

繼承 [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) 並加兩個 issue 標識擴展。

```markdown
---
tags: [yfm, design]
description: yfm skill 是否應包含 metadata.related？
repo: x-bash/skill0
number: 142
memo:
  2026-07-31T14:30:00+08:00: 初始草稿。
---

# yfm 是否應包含 metadata.related？
...
```

- **`repo:`** — `owner/name`（如 `x-bash/skill0`）。當文檔是獨立的 issue 總結時必填；當文檔本身就是 issue body 時可選（GitHub 已經知道）。
- **`number:`** — 整數 issue 編號。與 `repo:` 同樣的可選性。同一對組合也適用於 PR body。

狀態（open / closed / merged） **不** 是本 surface 的一部分 —— GitHub API 才是 system of record；在 YFM 中複述會漂移。`labels:`、`assignees:`、`created_at:`、`updated_at:` 同理。

在寫描述 issue 或 PR 的 YFM block、或作為 x-cmd 工具所寫 GitHub issue/PR 的 body 時，使用本節。對於不歸你管的 issue，GitHub API 是 system of record。