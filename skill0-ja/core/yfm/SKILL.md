---
name: yfm
description: |
  任意の markdown 記事のための YAML front matter（YFM）。x-cmd のデフォルトはトップレベル 3 フィールド：`tags`、`description`、`memo`。デフォルトは Agent Skills の frontmatter 形式を借りる — <https://agentskills.io/specification> を参照。yfm モジュールはヘルパー：`x yfm ls / init / lint`。
metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## YFM を採用する

エージェント、インデックス、オントロジーパイプラインがスキャンする可能性のある markdown には YFM を使う。**既に使われている方言があればそれに従う**（Agent Skills、Obsidian、Jekyll、Hugo など）— x-cmd デフォルトは、他のどの方言も適用されないときにのみ適用される。

## x-cmd デフォルト：3 フィールド

```yaml
---
tags: [design, front-matter]
description: One-sentence summary a reader uses to decide whether to open this file.
memo:
  2026-07-31T14:30:00+08:00: Cut aliases; renamed third field to memo.
---

# Title

Body...
```

- **`tags`** — トップレベルのスラグリスト `[a-z0-9-]`。消費者：オントロジーインデックスの収集者。
- **`description`** — トップレベルの文字列。一文。Agent Skills の `description:` ではない（あれは SKILL.md 専用の要件で、`skill0-writer` が管轄する）。
- **`memo:`** — トップレベルのマップ、ファイルの変更履歴。キーは ISO 8601 タイムスタンプ（`YYYY-MM-DDTHH:mm:ss±HH:mm`、著者のローカルオフセット）；値は短い変更記述。新しい順。記録する価値のある履歴がなければ省略する。

### 適用範囲

- `<project>/.x-cmd/story/` — `issue:` で拡張 — [usecase/story.md](usecase/story.md) を参照。
- GitHub issue / PR 本文 — `repo:`、`number:` で拡張 — [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md) を参照。
- GitHub `README.md` — デフォルトフィールドのみ。

## モジュール

yfm モジュールはヘルパー。3 つのコマンド：

- `x yfm ls [path]` — YFM ブロックを一覧；デフォルトはカレントディレクトリ
- `x yfm init [path]` — path 配下の各 markdown ファイルに x-cmd デフォルトブロックを書き込む
- `x yfm lint [path]` — 各 YFM ブロックが有効な YAML で、宣言された方言に従っているかをチェック

## 外部 front matter を読む

収集者は多数の方言を取り込む。デフォルトが借用している仕様は <https://agentskills.io/specification> を参照。方言別：

- [Agent Skills](usecase/agentskills.md) — `metadata:` は string→string；トップレベルは閉じている
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` は予約
- [Jekyll](usecase/jekyll.md) — リストまたは **スペース** 区切り
- [Hugo](usecase/hugo.md) — TOML の可能性あり；タクソノミーはサイト設定
