---
source: lib/skill0/core/yfm/usecase/story.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# story

`<project>/.x-cmd/story/` 設計故事的 YFM 約定。繼承 [x-cmd 默認](../SKILL.md#the-x-cmd-default-three-fields) 並加 `issue:`。

## 典型示例

```markdown
---
tags: [yfm, design]
description: yfm skill 如何按時間順序收斂到三個字段。
issue: 142
memo:
  2026-07-31T14:30:00+08:00: 收緊字段列表；砍掉 aliases，加上 memo。
  2026-07-31T10:00:00+08:00: 初始草稿。
---

# 標題

正文...
```

## `issue:`

關聯 issue 的引用。單個數字或列表：

```yaml
issue: 142
issue: [142, 158]
```

collector 把它映射為一條 ontology 關係，把 story entity 鏈接到 issue entity。沒有關聯 issue 時省略該字段 —— 不要寫 `issue: null` 或 `issue: 0`。

## `memo:` 鍵的日期格式

ISO 8601，精確到秒，數字偏移 —— 例：`2026-07-31T14:30:00+08:00`。