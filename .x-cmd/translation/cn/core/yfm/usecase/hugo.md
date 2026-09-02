---
source: lib/skill0/core/yfm/usecase/hugo.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Hugo

文档：<https://gohugo.io/content-management/front-matter/>

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

分隔符是 `+++`，内容是 TOML —— 不是 YAML。这是本方言的第一个陷阱。

## 标签提取

- **key** — `tags`、`categories`、`keywords`，外加 **站点配置的 taxonomy**
- **type** — `[]string` 数组

**key 名不固定。** taxonomy 由站点 `[taxonomies]` 配置定义，可以叫任何东西 —— `series`、`authors` 等。仅从文件无法枚举 tag key；collector 必须读 `hugo.toml` / `config.yaml` 的 `[taxonomies]`。Hugo 的 collector 只能做 **已知 key + 配置补全**；假设 `tags` 穷尽是错的。

## 三种 front matter 格式

同一项目可能混用：YAML 用 `---`，TOML 用 `+++`，JSON 用 `{}`。不能只看 `---` 来判断。

## `keywords` 是双用途

`keywords` 依站点配置要么渲染到 HTML `<meta>`，要么充当 taxonomy 分类。视为弱 tag —— 不要给与 `tags` 同等权重。

## 其他

- `aliases`：`[]string`，重定向路径。**不是 alias 语义**（别与 Obsidian 的 `aliases` 混淆）。
- `weight`：int，排序权重。
- `draft`：bool，草稿标志 → 映射到 ontology 的 `status`。