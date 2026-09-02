---
source: lib/skill0/core/yfm/usecase/hugo.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Hugo

文檔：<https://gohugo.io/content-management/front-matter/>

## 典型示例

```markdown
+++
title = 'Front matter'
date = 2024-02-02T04:14:54-08:00
draft = false
weight = 10
tags = ['red', 'blue']
keywords = ['front matter', 'metadata']
+++
```

分隔符是 `+++`，內容是 TOML —— 不是 YAML。這是本方言的第一個陷阱。

## 標籤提取

- **key** — `tags`、`categories`、`keywords`，外加 **站點配置的 taxonomy**
- **type** — `[]string` 數組

**key 名不固定。** taxonomy 由站點 `[taxonomies]` 配置定義，可以叫任何東西 —— `series`、`authors` 等。僅從文件無法枚舉 tag key；collector 必須讀 `hugo.toml` / `config.yaml` 的 `[taxonomies]`。Hugo 的 collector 只能做 **已知 key + 配置補全**；假設 `tags` 窮盡是錯的。

## 三種 front matter 格式

同一項目可能混用：YAML 用 `---`，TOML 用 `+++`，JSON 用 `{}`。不能只看 `---` 來判斷。

## `keywords` 是雙用途

`keywords` 依站點配置要麼渲染到 HTML `<meta>`，要麼充當 taxonomy 分類。視為弱 tag —— 不要給與 `tags` 同等權重。

## 其他

- `aliases`：`[]string`，重定向路徑。**不是 alias 語義**（別與 Obsidian 的 `aliases` 混淆）。
- `weight`：int，排序權重。
- `draft`：bool，草稿標誌 → 映射到 ontology 的 `status`。