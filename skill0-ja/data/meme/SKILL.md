---
name: meme
description: |
  テンプレートに文字を載せてミーム画像を生成。
  ゼロ障壁 — Python + Pillow だけ、フレーム不要。
  テンプレートは awesome-meme データリポジトリからオンデマンド取得。
  "meme"、"meme generator"、"text overlay"、"distracted boyfriend"、"image macro" で使用。

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

ミーム画像を生成。30+ テンプレート。ゼロ障壁。

AI エージェントがこのファイルを読めばミームの作り方が分かります。x-cmd は不要。

## クイックスタート

```bash
# 依存をインストール
pip install pillow pyyaml

# ミームを生成（テンプレートを GitHub から自動ダウンロード）
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## 他の例

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## オプション

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | レンダリングバックエンド |
| `--layout` | chest-label, above-head, bottom-label | (spec default) | 文字配置プリセット |
| `--output` | file path | meme_output.jpg | 出力ファイルパス |

## フォント選択

- 英語 / Latin — Impact（デフォルト）
- 中国語 / CJK — PingFang（macOS）/ Noto Sans CJK（Linux）
- 混在 — 各スロットを独立に自動検出

Impact には CJK グリフがありません — 中国語は表示されません。レンダラーが CJK を自動検出し、システムフォントにフォールバックします。Linux：`apt install fonts-noto-cjk`。

## 純粋 Shell（Python なし）

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## x-cmd でアップグレード

x-cmd をインストール済みなら：

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

同じ結果で、x-cmd エコシステムとの統合がより綺麗です。

## データソース

テンプレートは [awesome-meme](https://github.com/edwinjhlee/awesome-meme) にあります。レンダラーは GitHub から spec と画像をオンデマンド取得します。

## ドキュメント

- [references/INSTALL.md](references/INSTALL.md) — 依存関係（Pillow、ImageMagick、フォント）
- [references/PILLOW.md](references/PILLOW.md) — Pillow バックエンドの詳細
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — ImageMagick バックエンドの詳細
- [references/GUIDELINES.md](references/GUIDELINES.md) — AI エージェント利用ガイドライン

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser はミーム画像をレンダリング / 出力できる
