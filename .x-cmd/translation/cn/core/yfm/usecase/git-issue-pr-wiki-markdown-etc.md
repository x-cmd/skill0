---
source: lib/skill0/core/yfm/usecase/git-issue-pr-wiki-markdown-etc.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Surfaces — 哪里用哪个 YFM

yfm skill 的逐 surface 映射。对于 x-cmd 写入或读取的每个 markdown surface，哪些字段适用。

## 速查

| Surface | 写 | 读 | 实用字段 |
|---|---|---|---|
| GitHub issue body | [§GitHub issue & PR bodies](#github-issue--pr-bodies) | 同 | `tags`, `description`, `repo`, `number` |
| GitHub PR body | [§GitHub issue & PR bodies](#github-issue--pr-bodies) | 同 | 同 issue |
| GitHub wiki page | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| GitHub `README.md` | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| `<project>/.x-cmd/story/*.md` | [story](story.md) | [story](story.md) | `tags`, `description`, `memo`, `issue` |
| `<skill>/SKILL.md` | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) + [skill0-writer](../../skill0-writer/SKILL.md) | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo`；按 skill0-writer 加 `metadata.related` |
| 本地 markdown 笔记 | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) 或无 YFM | [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) | `tags`, `description`, `memo` |
| Obsidian vault 文件 | （Obsidian 原生） | [obsidian](obsidian.md) | `tags`, `aliases`, `cssclasses` |
| Jekyll 站点文件 | （Jekyll 原生） | [jekyll](jekyll.md) | `title`, `date`, `tags`, `categories` |
| Hugo 站点文件 | （Hugo 原生） | [hugo](hugo.md) | `title`, `date`, `tags`, `keywords`, 站点 taxonomy |
| Agent Skill 文件 | [agentskills](agentskills.md) | [agentskills](agentskills.md) | `name`, `description`, `metadata.*` |

未列出的全部回退到 [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields)。3 个字段是下限而非上限 —— 但要加更多，得新增 usecase，永远不是私用字段。

## GitHub issue & PR bodies

继承 [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) 并加两个 issue 标识扩展。

```markdown
---
tags: [yfm, design]
description: yfm skill 是否应包含 metadata.related？
repo: x-bash/skill0
number: 142
memo:
  2026-07-31T14:30:00+08:00: 初始草稿。
---

# yfm 是否应包含 metadata.related？
...
```

- **`repo:`** — `owner/name`（如 `x-bash/skill0`）。当文档是独立的 issue 总结时必填；当文档本身就是 issue body 时可选（GitHub 已经知道）。
- **`number:`** — 整数 issue 编号。与 `repo:` 同样的可选性。同一对组合也适用于 PR body。

状态（open / closed / merged） **不** 是本 surface 的一部分 —— GitHub API 才是 system of record；在 YFM 中复述会漂移。`labels:`、`assignees:`、`created_at:`、`updated_at:` 同理。

在写描述 issue 或 PR 的 YFM block、或作为 x-cmd 工具所写 GitHub issue/PR 的 body 时，使用本节。对于不归你管的 issue，GitHub API 是 system of record。