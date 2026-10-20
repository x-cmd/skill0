---
name: git
description: |
  Git とコードホスティングプラットフォームの管理 —— GitHub、GitLab、Codeberg、Forgejo。
  ゼロバリア —— x-cmd をインストールしてターミナルから repo を管理。
  "git"、"github"、"gitlab"、"repo"、"pull request"、"code hosting" に適用。

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

コマンドラインから Git の repo とコードホスティングプラットフォームを管理する。

## クイックスタート

```bash
# x-cmd をインストール
eval "$(curl https://get.x-cmd.com)"

# GitHub の repo を管理
x gh repo list
x gh repo clone owner/repo

# pull request を作る
x gh pr create --title "Fix bug" --body "Description"

# Git hooks を管理
x git hook
```

## 使えるコマンド

| Command | Platform | Description |
|---------|----------|-------------|
| `x gh` | GitHub | GitHub CLI の完全な統合 |
| `x gl` | GitLab | GitLab のプロジェクト管理 |
| `x cb` | Codeberg | Codeberg との統合 |
| `x git hook` | ローカル | Git hooks の管理 |

## この skill0 は成長中

まずは GitHub の基礎から。追加予定:
- GitLab のワークフロー
- コードホスティングのベストプラクティス
- Repo 移行ガイド
- CI/CD 統合のヒント

## すべてのオプション

x-cmd をインストールしたら `x git --help` ですべてのオプションが見られます。

## Related

- [repo](../repo/SKILL.md) — x repo で repo を発見 / 管理する
