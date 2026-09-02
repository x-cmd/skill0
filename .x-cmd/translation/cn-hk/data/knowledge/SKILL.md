---
source: lib/skill0/data/knowledge/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: knowledge
description: |
  從命令行搜尋 Hacker News、Wikipedia、DuckDuckGo、RFC 文檔、Stack Exchange。
  零門檻 —— 安裝 x-cmd 即可搜尋。
  適用於 "search"、"hn"、"hacker news"、"wikipedia"、"ddgo"、"duckduckgo"、"rfc"、"stack overflow"。

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

從命令行搜尋互聯網知識源。

## 快速上手

```bash
# 安裝 x-cmd
eval "$(curl https://get.x-cmd.com)"

# Hacker News 熱門
x hn top

# Wikipedia 搜尋
x wkp "artificial intelligence"

# DuckDuckGo 搜尋
x ddgo "rust programming language"

# RFC 文檔
x rfc 2616

# Stack Exchange 搜尋
x se "how to exit vim"
```

## 可用命令

| Command | Source | Example |
|---------|--------|---------|
| `x hn top` | Hacker News | 熱門 Top 10 |
| `x hn new` | Hacker News | 最新提交 |
| `x wkp <query>` | Wikipedia | 搜尋條目 |
| `x ddgo <query>` | DuckDuckGo | Web 搜尋 |
| `x rfc <number>` | RFC docs | 閲讀 RFC 規範 |
| `x se <query>` | Stack Exchange | 搜尋問答 |

## 本 skill0 還在成長

從基礎開始，將補充：
- 更多來源（Project Gutenberg, arxiv）
- 高級搜尋模式
- 結果過濾與格式化技巧

## 完整體驗

安裝 x-cmd 後，`x knowledge --help` 查看全部選項。

## Related