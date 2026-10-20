---
name: devloop
description: ゴール駆動の開発ループ — objective を定め、key-results 付きの rule を書き、目視で検証し、issue tracker に同期する。
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # or project-specific ruleset
x env use agent-browser                   # for visual verification
```

## ワークフロー

```
goal → rule.yml → code → verify → issue
```

### 1. goal を定める → rule.yml を書く

コードを書く前に、そのタスク用の rule.yml を作る:

```yaml
goal: "Fix English version showing Chinese tags in Features section"
keyresults:
  - kr-1: "English mode Features tags are all English"
  - kr-2: "Chinese mode Features tags remain Chinese"
  - kr-3: "Build passes with no regressions"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - When language=en, all details[] items must be English
    - No Chinese characters in any tag badge in English mode
```

rule のフィールド: `id`、`name`、`apply`、`level`、`desc`、`tldr`。`x rule -h` を参照。

すべての開発タスクで必須の 2 つのフィールド、`goal` と `keyresults` を **MUST**  含めること。

### 2. 実行 → 目視検証（フロントエンド）

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... make changes ...
agent-browser --session <proj> screenshot /tmp/after.png
```

変更前後のスクリーンショットを **MUST** 撮る。意図と突き合わせて確認する:
1. AI の vision チェック: after.png は goal に合っているか?
2. 合わなければ → 反復して再度スクリーンショットを撮る
3. アップロード前に **プライバシーデータ（token、メールアドレス、個人情報）をすべて除去する**

### 3. x rule で検証する

```
x rule scan <files>     # 高速（約 1 分）、inner loop 用
x rule check <files>    # 綿密（約 10 分）
x rule audit <files>    # 完全レポート（約 30 分）
```

### 4. issue tracker に同期する

[issue/SKILL.md](../issue/SKILL.md) を参照。最低ラインとして goal、key-results、rule.yml、変更前後のスクリーンショットを issue に投稿する。

## Agent ツール

- `x rule scan` — 反復中のクイックチェック
- `x rule check` — commit 前の完全なコンプライアンス
- `agent-browser screenshot` — 変更前後の視覚的な証拠
- `gh issue create/comment` — goal + rule.yml を tracker に同期

## Related

- [rule](../rule/SKILL.md) — rule.yml は検証の骨格
- [score](../score/SKILL.md) — KR のスコアリングは score フレームワークを使う
- [install](../install/SKILL.md) — 開発環境をセットアップする
- [agent-browser](../../it/agent-browser/SKILL.md) — 変更前後の目視検証
- [issue](../issue/SKILL.md) — goal + KR + スクリーンショットを issue tracker に同期する
- [repo](../repo/SKILL.md) — repo 内で作業 pull/push する
- [prompt](../prompt/SKILL.md) — prompt 規約が devloop のタスクを駆動することが多い