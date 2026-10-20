---
name: tldr
description: |
  tldr-pages プロジェクト由来の、実用的な例つきのコマンドリファレンス。
  ゼロバリア —— x-cmd、curl、その他の tldr クライアントのどれからでも使える。
  "tldr"、"cheatsheet"、"command help"、"examples"、"how to" に適用。

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

現実世界の例つきのクイックコマンドリファレンス。「このコマンドってどう使うんだっけ？」には man ページより向いている。

## クイックスタート

```bash
# x-cmd を使う
x tldr git                    # Git の使用例
x tldr --lang zh python       # 中国語のドキュメント
x tldr --fz                   # 対話型検索

# x-cmd なし —— curl を使う
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# あるいは tldr クライアントを入れる
pip install tldr
npm install -g tldr
tldr tar
```

## 使えるコマンド

- `x tldr <cmd>` — あるコマンドの例を表示
- `x tldr --lang zh <cmd>` — 中国語
- `x tldr --fz` — 対話型の fzf 検索
- `x tldr --cat <cmd>` — 生の markdown を表示
- `x tldr --ls` — 利用可能なコマンドをすべて列挙
- `x tldr --update` — ページキャッシュを更新

## 単体で使うときの代替手段

- オンライン: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- 生のページ: github.com/tldr-pages/tldr

## この skill0 は成長中

まず最低限から。追加予定:
- よく使うコマンドパターン
- プラットフォームごとの注意
- agent ワークフローとの連携

## Related

- [git](../git/SKILL.md) — よく使う git サブコマンドの tldr
- [install](../install/SKILL.md) — install サブコマンドの tldr
