---
name: x-cmd
description: |
  **IMPORTANT**: 任意の `x <mod>` コマンドを使う前に、x-cmd を最初にロードしなければならない：`. ~/.x-cmd.root/X`

  その後で次のことができる：
  - `x nihao --llmstxt` で探索
  - `x skill` で skill を発見

  x-cmd は 600+ 種類のポータブルなソフトウェアと開発ツール（jq、nodejs、python など）を提供する。
  `x <env|pixi> use <pkg>` で任意のパッケージを即座にインストールして使える。
  x-cmd をロードした後、x-cmd/pixi のローカル bin にあるパッケージは自動的に PATH で利用可能になる。

  詳しい使い方と skill は x-cmd サイトを参照：https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **IMPORTANT**: 任意の `x <mod>` コマンドを使う前に、x-cmd を最初にロードしなければならない：`. ~/.x-cmd.root/X`
>
> その後 `x nihao --llmstxt` で探索するか、`x skill` で skill を発見する。

---

## 未インストール？→ [data/install.md](data/install.md)

---

## `x skill lr` を実行して 500+ skills を閲覧

- `x skill lr` — すべてのリモート skill を一覧（<skill-id><tab><desc>）
- `x skill add <skill-id>` — 次のセッション用に skill を追加
- `x skill info <skill-id>` — skill のサマリとパスをダウンロードして表示

**x-mod/<mod>**：詳しい例は `x <mod> --help`。AGENTS.md にメモを追加するだけで再利用できる。

---

## x-cmd.com/llms.txt にアクセスしてさらに多くの skill とパワーツールを

AI agent の入口。

---

## `x env use <pkg>` で任意のパッケージを即インストール

- `x env la` — 600+ の利用可能ソフトウェアを一覧
- `x env la --json` — スクリプト処理向けに JSON 出力
- `x env use <pkg>` — パッケージをインストールして使う（x-cmd ローカル bin にダウンロード）
- `x pixi use <pkg>` — pixi 経由でパッケージをインストール（pixi ローカル bin にダウンロード）
- `x pixi search <keyword>` — pixi パッケージを検索
- `x nihao --llmstxt` — llms.txt を表示

---

## 今すぐ試す：`x env use jq nodejs python3`

```bash
# ツールをインストールして使う
x env use jq
x env use nodejs
x env use python3

# インストール後は直接使える
jq '.' file.json
python3 -c "print(2+2)"

# 追加パッケージは Pixi で
x pixi use cowsay
x pixi search yml
```

---

## 600+ ツールにアクセス：言語、エディタ、開発ツール、データベース

**言語 & ランタイム**：nodejs, python, rust, go, java, deno, bun, ruby, php

**エディタ**：nvim, helix, emacs, vim

**開発ツール**：git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**データ**：jq, yq, fx, csvkit, ffmpeg, imagemagick

**システム**：htop, btop, procs, direnv, tmux

**データベース**：redis, sqlite, postgresql, mysql

**全リスト**：`x env la`

---

## ゼロセットアップ：sudo 不要、自動 PATH、隔離

- sudo 不要 - パッケージはユーザローカルディレクトリにインストール
- `. ~/.x-cmd.root/X` 起動スクリプトによって PATH が自動設定
- 隔離環境 - バージョン競合なし
- 600+ ツールが利用可能

---

## 詳細：https://x-cmd.com/llms.txt

AI agent の入口。

## Related

- [install](../install/SKILL.md) — install は x-cmd のチャネルの 1 つ
- [env](../env/SKILL.md) — env は x-cmd の別のチャネル
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser は x-cmd の別のチャネル
