# Obsidian

文檔：<https://help.obsidian.md/Editing+and+formatting/Properties>

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

正文中的行內 #dinner 也算 tag。
```

## 標籤提取

- **key** — `tags`（頂層）
- **type** — **必須是列表**。規範："YFM 中的 tag 應始終以列表形式。"
- **body** — 行內 `#tag` 也算，不止 YFM。

字符集：字母、數字、`_`、`-`、`/`、常見 Unicode（含 emoji）。

- **不含空格**。多詞：`camelCase` / `PascalCase` / `snake_case` / `kebab-case`。
- 必須至少含一個非數字字符（`#1984` 無效，`#y1984` 有效）。
- **大小寫不敏感**：`#tag` 與 `#TAG` 是同一個 tag。歸一化為小寫。
- 逗號不在字符集中，所以逗號 join 字符串在技術上是無歧義的 —— 但 Obsidian 自身不產生這種形式。

## 嵌套 tag 是層級

`/` 創造層級：`inbox/to-read`。搜尋 `tag:inbox` 會匹配 `#inbox` 及其所有子項。

這是方言中真實的父子關係；collector 應展開為層級邊，而不是把字符串拍平。

## 與 Agent Skills 衝突

Obsidian 不支持嵌套屬性。Agent Skills 強制擴展字段位於 `metadata:` 下。兩者不能在同一文件中同時滿足：`metadata.tags` 在 Obsidian 中讀不出，頂層 `tags:` 在 Agent Skills 中不合規。collector 按 source 分發，不試圖調和。

## 保留屬性

`tags`、`aliases`、`cssclasses` —— 三個默認屬性，語義由 Obsidian 保留，不要挪作他用。

`aliases` 對本體有用：同一 entity 的 alias 集合。注意它 **不** 等同於 Hugo 的 `aliases`（重定向路徑）。

## 其他約束

- 屬性值 **不渲染 markdown**（故意如此）。
- 一個屬性名在整個 vault 中類型一致 —— 類型是 vault 級而非文件級。在 vault 範圍內推斷類型。