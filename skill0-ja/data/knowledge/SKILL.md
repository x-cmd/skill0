---
name: knowledge
description: |
  コマンドラインから Hacker News、Wikipedia、DuckDuckGo、RFC ドキュメント、Stack Exchange を検索。
  ゼロ障壁 — x-cmd をインストールすればすぐ検索可能。
  "search"、"hn"、"hacker news"、"wikipedia"、"ddgo"、"duckduckgo"、"rfc"、"stack overflow" で使用。

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

コマンドラインからインターネットの知識ソースを検索。

## クイックスタート

```bash
# x-cmd をインストール
eval "$(curl https://get.x-cmd.com)"

# Hacker News 人気投稿
x hn top

# Wikipedia 検索
x wkp "artificial intelligence"

# DuckDuckGo 検索
x ddgo "rust programming language"

# RFC ドキュメント
x rfc 2616

# Stack Exchange 検索
x se "how to exit vim"
```

## 利用可能なコマンド

| Command | Source | Example |
|---------|--------|---------|
| `x hn top` | Hacker News | トレンド Top 10 投稿 |
| `x hn new` | Hacker News | 最新投稿 |
| `x wkp <query>` | Wikipedia | 記事を検索 |
| `x ddgo <query>` | DuckDuckGo | Web 検索 |
| `x rfc <number>` | RFC docs | RFC 仕様を読む |
| `x se <query>` | Stack Exchange | Q&A を検索 |

## この skill0 は成長中

基本から始めます。今後追加予定：
- より多くのソース（Project Gutenberg, arxiv）
- 上級検索パターン
- 結果のフィルタリングと整形Tips

## 全機能を体験

x-cmd をインストール後、`x knowledge --help` で全オプションを確認できます。

## Related
