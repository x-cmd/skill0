# Obsidian

文档：<https://help.obsidian.md/Editing+and+formatting/Properties>

## 典型示例

```markdown
---
tags:
  - recipe
  - cooking
  - inbox/to-read
aliases:
  - Pasta recipe
cssclasses:
  - soft-embed
---

正文中的行内 #dinner 也算 tag。
```

## 标签提取

- **key** — `tags`（顶层）
- **type** — **必须是列表**。规范："YFM 中的 tag 应始终以列表形式。"
- **body** — 行内 `#tag` 也算，不止 YFM。

字符集：字母、数字、`_`、`-`、`/`、常见 Unicode（含 emoji）。

- **不含空格**。多词：`camelCase` / `PascalCase` / `snake_case` / `kebab-case`。
- 必须至少含一个非数字字符（`#1984` 无效，`#y1984` 有效）。
- **大小写不敏感**：`#tag` 与 `#TAG` 是同一个 tag。归一化为小写。
- 逗号不在字符集中，所以逗号 join 字符串在技术上是无歧义的 —— 但 Obsidian 自身不产生这种形式。

## 嵌套 tag 是层级

`/` 创造层级：`inbox/to-read`。搜索 `tag:inbox` 会匹配 `#inbox` 及其所有子项。

这是方言中真实的父子关系；collector 应展开为层级边，而不是把字符串拍平。

## 与 Agent Skills 冲突

Obsidian 不支持嵌套属性。Agent Skills 强制扩展字段位于 `metadata:` 下。两者不能在同一文件中同时满足：`metadata.tags` 在 Obsidian 中读不出，顶层 `tags:` 在 Agent Skills 中不合规。collector 按 source 分发，不试图调和。

## 保留属性

`tags`、`aliases`、`cssclasses` —— 三个默认属性，语义由 Obsidian 保留，不要挪作他用。

`aliases` 对本体有用：同一 entity 的 alias 集合。注意它 **不** 等同于 Hugo 的 `aliases`（重定向路径）。

## 其他约束

- 属性值 **不渲染 markdown**（故意如此）。
- 一个属性名在整个 vault 中类型一致 —— 类型是 vault 级而非文件级。在 vault 范围内推断类型。