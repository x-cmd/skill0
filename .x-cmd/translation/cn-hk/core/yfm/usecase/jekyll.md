---
source: lib/skill0/core/yfm/usecase/jekyll.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Jekyll

文檔：<https://jekyllrb.com/docs/front-matter/>

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

兩種形式在同一文件中共存：`categories` 是 **空格分隔字符串**，`tags` 是列表。這種共存就是陷阱。

## 標籤提取

- **key** — `tags` 與 `categories`（頂層，兩者）
- **type** — 列表 *或* 字符串
- **separator** — 字符串形式下用 **空格**，非逗號

規範：tags/categories"可以指定為 YAML 列表或空格分隔字符串"。

提取器必須先看 YAML 解析類型：列表 → 遍歷項；字符串 → 按空格切。按逗號切會把 Jekyll 的 `categories: jekyll update` 當成單個 tag `"jekyll update"`。Obsidian 又因 tag 不能含空格而直接拒收，錯值會傳到下游歸一化。分隔符方向與 Agent Skills 相反，正是共享 split 流程不能兩邊通吃的原因。

## categories 不是 tags

`categories` 參與 URL 路徑生成；`tags` 不參與。語義上：categories 是分層的，tags 是扁平的關鍵詞。

collector 應把兩者作為不同集合保留，不要合併為一個 tag bag。

## 其他

- 單數 key `category` / `tag` 同樣被識別，等價於複數形式 —— 掃全部 4 個。
- 頂層自定義字段可在模板中訪問 → 剩餘字段直接成為 ontology 屬性。