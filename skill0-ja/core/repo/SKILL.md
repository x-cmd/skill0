---
name: repo
description: agent がクローンしたリポジトリの場所と worktree の配置に関する規約 + ツール。デフォルトの bare repo は `~/.x-repo/.bare/<provider>/<owner>/<name>.git`、linked working tree は `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` の下。`x repo ls` で発見する。worktree の管理は `x repo wt`。用途：「where to clone」「git clone path」「workspace layout」「shared repos between agents」「worktree path」。
metadata:
  related: "git"
---

# repo

## なぜ

すべての clone は `~/.x-repo/<provider>/<owner>/<name>` に集約される。すべての agent、人、CI で同じパス — 再クローンせずに共有できるよう、コンテナや agent サンドボックスにマウント可能。バックアップ対象は 1 つのルートだけ。`x repo ls` で発見できる。レイアウトは GitHub のパスを反映しているため、任意の worktree からの `../<sibling>` はその兄弟のデフォルト worktree に解決される — 兄弟を参照する設定やスクリプトは wt と agent を超えて均一の動作をする。

## パスレイアウト

- bare：`~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- デフォルト wt：`~/.x-repo/<provider>/<owner>/<name>`
- named wt：`~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname はこのワークスペースの任意の識別子：agent/worker 名、ブランチ名、tag、短い SHA、issue id、自由形式の文字列。wtname 中の `/` は `~` にエンコードされる。

デフォルトでは、リポジトリは linked worktree 付きの bare — `.bare/` の中の bare は worktree とは別のディレクトリなので、ある wt に `rm -rf` を実行しても bare に届かない。通常の `git clone` も受け入れられる（`x repo ls/which/update` はそれを認識する）が、幾何学的保護はない。この場合は慎重に：`rm -rf` を避け、`git worktree remove` を優先し、`.git/` を対象とするクリーンアップのヒューリスティックを避けてほしい。こうして作業途中で失われた成果物は元のリポジトリと再整列できない。

## Commands

```bash
x repo <id>                      # デフォルト wt に cd（無ければ自動クローン）
x repo wt <id> <wtname>          # 既存ブランチにアタッチ、または HEAD から新規作成
x repo wt ls <id>                # wt を一覧表示
x repo wt rm <id> <wtname>       # 丁寧に削除（これを使う、rm -rf ではなく）
x repo update <id>               # 上流の変更後にデフォルト wt を更新
x repo ls [--raw|--tsv]          # 何がクローン済みかを発見
x repo which <id>[@<wtname>]     # id を絶対パスに解決
```

## Don't

- named worktree に対して `rm -rf` を実行しないこと。bare の `worktrees/` レジストリに古いエントリが残る。`x repo wt rm` を使うこと。どうしても `rm -rf` する場合は、その後 `git -C <bare> worktree prune` を実行する。

## Related

- [doc/path-layout.md](doc/path-layout.md) — 完全なパス文法と worktree 命名
- [doc/workflow.md](doc/workflow.md) — 操作手順と「クリーンアップ非削除」原則
- [doc/design.md](doc/design.md) — なぜこのレイアウトなのか
