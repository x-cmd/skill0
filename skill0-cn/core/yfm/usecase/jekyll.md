---
source: lib/skill0/core/yfm/usecase/jekyll.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Jekyll

文档：<https://jekyllrb.com/docs/front-matter/>

## 典型示例

```markdown
---
layout: post
title: "Welcome to Jekyll"
date: 2026-07-31 10:00:00 +0800
categories: jekyll update
tags: [intro, meta]
---
```

两种形式在同一文件中共存：`categories` 是 **空格分隔字符串**，`tags` 是列表。这种共存就是陷阱。

## 标签提取

- **key** — `tags` 与 `categories`（顶层，两者）
- **type** — 列表 *或* 字符串
- **separator** — 字符串形式下用 **空格**，非逗号

规范：tags/categories"可以指定为 YAML 列表或空格分隔字符串"。

提取器必须先看 YAML 解析类型：列表 → 遍历项；字符串 → 按空格切。按逗号切会把 Jekyll 的 `categories: jekyll update` 当成单个 tag `"jekyll update"`。Obsidian 又因 tag 不能含空格而直接拒收，错值会传到下游归一化。分隔符方向与 Agent Skills 相反，正是共享 split 流程不能两边通吃的原因。

## categories 不是 tags

`categories` 参与 URL 路径生成；`tags` 不参与。语义上：categories 是分层的，tags 是扁平的关键词。

collector 应把两者作为不同集合保留，不要合并为一个 tag bag。

## 其他

- 单数 key `category` / `tag` 同样被识别，等价于复数形式 —— 扫全部 4 个。
- 顶层自定义字段可在模板中访问 → 剩余字段直接成为 ontology 属性。