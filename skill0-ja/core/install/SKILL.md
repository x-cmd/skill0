---
name: install
description: |
  システムが許すCualquier方法でソフトウェアをインストールする。推奨は `x install` — すべての
  メソッドを一覧して最適なものを選ぶ単一の入口。加えて `x eget`/`x env use`/`x pixi` チャネルと、
  ミラー切り替えに対応したシステムパッケージマネージャ。これらの x-cmd チャネルはすべて $HOME に
  インストールする — sudo 不要、環境汚しなし。
  「install」「apt」「brew」「eget」「pixi」「package manager」「mirror」で使う。
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

システムが許すどんな方法でもソフトウェアをインストールできる。**すべての x-cmd チャネル（`x eget`、`x env use`、`x pixi`）は `$HOME` にインストールする — sudo 不要、システム汚しなし。** OS に触れるのはシステムパッケージマネージャ（`x apt`、`x brew`、…）だけで、それらは sudo を必要とする場合がある。

## チャネルを選ぶ

- `x install` — **推奨。** 単一の入口 — そのツールのすべてのメソッドを一覧し、最適なものを選ぶ
- `x eget` — 上流リポジトリ（GitHub / Codeberg releases）から直接、最新バイナリを
- `x env use` — x-cmd がホストするランタイムとツール（`x pkg use` のラッパ）
- `x pixi` — conda / pixi-ecosystem のパッケージ
- `x apt/brew/dnf/pacman` — システムパッケージマネージャ（sudo が必要な場合あり）

## 前提条件

x-cmd は上記のすべてのチャネルを提供している:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — 推奨の入口

どのツールにも複数のインストール経路がある。`x install` が最適なものを自動選択する。以下の形式はすべて非対話的（agent / CI 安全）:
```bash
x install bun                            # install — auto-picks the best method
x install --printinfo ripgrep            # list every install method first (read-only)
x install --withtool brew jq             # force a manager; or prefix form: brew/jq
x install --sys bun                      # system package manager only
x install --printcmd bun vim             # preview the command, don't run
x install --env                          # platform / arch / distro probe
x install --available-tool --installed   # which package managers exist here
```

### 何がインストール可能かを調べる

`x install --ls` はインデックスされたすべてのツールを TSV で出力する — grep / awk でオフライン処理できる:
```bash
x install --ls --tsv | head -1                  # header
x install --ls --tsv | grep -i json             # search by keyword
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # filter by language
x install --search http                         # aggregate search across registries
```
TSV の列: `name category lang source desc_cn desc_en binlist rule other`。

## ミラーを変える（ダウンロード高速化）

遅いシステムパッケージマネージャを、より速い / ローカルのミラーにリダイレクトする。それぞれに `mirror ls`（選択肢の一覧）と `mirror set <code>`（適用、非対話的）がある:
```bash
x brew mirror ls          # list: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # apply Tsinghua mirror
x apt mirror set tuna     # same shape on Debian / Ubuntu (also dnf, pacman)
```
対象のパッケージマネージャがインストールされていることが必要。

## さらに詳しくは

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — install の前段にある総括エントリ
- [agent-browser](../../it/agent-browser/SKILL.md) — バイナリが存在しないとき install は agent-browser へ案内する
- [env](../env/SKILL.md) — install と env は x-channel アーキテクチャを共有する