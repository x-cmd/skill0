---
name: knowledge
description: |
  从命令行搜索 Hacker News、Wikipedia、DuckDuckGo、RFC 文档、Stack Exchange。
  零门槛 —— 安装 x-cmd 即可搜索。
  适用于 "search"、"hn"、"hacker news"、"wikipedia"、"ddgo"、"duckduckgo"、"rfc"、"stack overflow"。

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

从命令行搜索互联网知识源。

## 快速上手

```bash
# 安装 x-cmd
eval "$(curl https://get.x-cmd.com)"

# Hacker News 热门
x hn top

# Wikipedia 搜索
x wkp "artificial intelligence"

# DuckDuckGo 搜索
x ddgo "rust programming language"

# RFC 文档
x rfc 2616

# Stack Exchange 搜索
x se "how to exit vim"
```

## 可用命令

| Command | Source | Example |
|---------|--------|---------|
| `x hn top` | Hacker News | 热门 Top 10 |
| `x hn new` | Hacker News | 最新提交 |
| `x wkp <query>` | Wikipedia | 搜索条目 |
| `x ddgo <query>` | DuckDuckGo | Web 搜索 |
| `x rfc <number>` | RFC docs | 阅读 RFC 规范 |
| `x se <query>` | Stack Exchange | 搜索问答 |

## 本 skill0 还在成长

从基础开始，将补充：
- 更多来源（Project Gutenberg, arxiv）
- 高级搜索模式
- 结果过滤与格式化技巧

## 完整体验

安装 x-cmd 后，`x knowledge --help` 查看全部选项。

## Related