---
name: wikipedia
description: |
  x wkp で Wikipedia を検索・閲覧 — MediaWiki API、API キー不要、ゼロインストール。
  query・extract・suggest・DDG ルートを1つのモジュールで。
  wiki、wikipedia、encyclopedia lookup、article summary でロード。

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

出力はプレーンテキストの抜粋（最初の段落 + 情報ボックス程度）。サブコマンド動詞で形が決まります — `hop` は「検索してすぐ要約」、`extract` は既知のタイトル用、`search` は候補一覧、`suggest` は did-you-mean。デフォルトは英語 Wikipedia。`--lang` / `--api-url` で他の wiki に切り替え可能。

## `x wkp` クイックスタート

```bash
x wkp hop Python                      # 検索 + 最初の結果の要約をワンショットで
x wkp extract OpenAI                  # 既知ページの要約
x wkp search "Linux kernel"           # タイトルが不確かなときは候補を列挙
x wkp suggest pythen                  # did-you-mean：検索前の候補提示
```

`x wkp -h` で全フラグとサブコマンドを確認できます。

## データと関連ツール

上流：`https://en.wikipedia.org/w/api.php` — MediaWiki action API。姉妹プロジェクト（Wikidata、Wiktionary、Commons）も同様。`--api-url` を対応するサブドメインに向けます。

wikitext の要約の一歩先を行く質問には：
- `x wkp : <query>` / `x wkp ddgo <query>` — 同じ `x wkp` モジュールを DuckDuckGo の Wikipedia インデックス経由でルーティング（曖昧な口語的クエリをタイトル検索より上手く扱う）
- `x ddgo <query>` — 汎用 Web 検索。Wikipedia に記事はないがトピックが公 web に存在するときに有用
- より広範な `x hn` / `x rfc` / `x se` 研究ツールキットは [knowledge](../knowledge/SKILL.md) skill を参照
- `x wkp open <page>` — レンダリングされたページ本体（情報ボックス、表、画像）が本当に必要ならブラウザにフォールバック
