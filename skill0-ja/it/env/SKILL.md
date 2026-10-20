---
name: env
description: |
  ソフトウェアパッケージ、言語ランタイム、CLI ツールを即座にインストール・管理。
  ゼロバリア —— x-cmd を入れるだけで数秒で任意のツールが使える。sudo は不要。
  "install"、"package"、"python"、"node"、"jq"、"runtime"、"tool" に適用。

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

任意のソフトウェアを即座にインストール。sudo 不要。システムも汚さない。

## クイックスタート

```bash
# x-cmd をインストール
eval "$(curl https://get.x-cmd.com)"

# Python をインストール
x env use python

# Node.js をインストール
x env use node

# CLI ツールをインストール
x env use jq
x env use fzf

# 永続インストールせずに試す
x env try python3 script.py
```

## 使えるもの

600+ パッケージ、たとえば:

- 言語 —— python, node, go, bun, java, rust
- CLI ツール —— jq, yq, fzf, himalaya
- 開発ツール —— claude-code, code-server

## 主な特徴

- **sudo 不要** —— ユーザーディレクトリにインストール
- **バージョン管理** —— インストールしてバージョンを切り替え
- **試してから入れる** —— `x env try` で一時的に使う
- **後片付け** —— `x env clean` で未使用パッケージを削除

## この skill0 は成長中

まず最低限から。追加予定:
- よく使うインストールパターン
- バージョン固定のヒント
- 複数言語プロジェクトのセットアップガイド

## すべてのオプション

x-cmd をインストールしたら `x env --help` ですべてのオプションが見られます。

## Related

- [install](../install/SKILL.md) — x env use は install のチャネルのひとつ
- [x-cmd](../x-cmd/SKILL.md) — env の傘（umbrella）エントリーポイント
