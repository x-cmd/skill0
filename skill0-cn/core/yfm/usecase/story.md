---
source: lib/skill0/core/yfm/usecase/story.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# story

`<project>/.x-cmd/story/` 设计故事的 YFM 约定。继承 [x-cmd 默认](../SKILL.md#the-x-cmd-default-three-fields) 并加 `issue:`。

## 典型示例

```markdown
---
tags: [yfm, design]
description: yfm skill 如何按时间顺序收敛到三个字段。
issue: 142
memo:
  2026-07-31T14:30:00+08:00: 收紧字段列表；砍掉 aliases，加上 memo。
  2026-07-31T10:00:00+08:00: 初始草稿。
---

# 标题

正文...
```

## `issue:`

关联 issue 的引用。单个数字或列表：

```yaml
issue: 142
issue: [142, 158]
```

collector 把它映射为一条 ontology 关系，把 story entity 链接到 issue entity。没有关联 issue 时省略该字段 —— 不要写 `issue: null` 或 `issue: 0`。

## `memo:` 键的日期格式

ISO 8601，精确到秒，数字偏移 —— 例：`2026-07-31T14:30:00+08:00`。