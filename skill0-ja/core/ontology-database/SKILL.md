---
name: ontology-database
description: TSV の追記専用ログによる型付き知識グラフ — entity CRUD、有向関係、スキーマ検証、マルチホップ推論。CLI は `x ondb`、プロトコルは AWK/Python/JS/SQLite から読める。
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

型付き知識グラフ: すべてが **entity**（id + type + properties）であり、**有向関係**（from → rel → to）でつながっている。すべての変更は TSV の行を追記する — 上書きはしない。TSV ログがそのままデータベースである。

## TSV ログ形式（プロトコル）

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # create entity
set     <id>  <epoch_ms>  key  val                             # update property
rm      <id>  <epoch_ms>                                       # delete entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # create relation
unlink  <from>  <rel>  <to>  <epoch_ms>                        # remove relation
# tab-separated; escape: \t → tab, \n → newline, \\ → backslash
# properties are alternating key/val pairs (each is a separate tab field)
```

どの言語でもこれを読める。AWK はストリーム、Python は dict、SQLite はマテリアライズ。**ログが source of truth。**

## CLI の使い方

```
x ondb add --type Person --name Alice                            # auto UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # entity detail
x ondb set --id t1 status=done                                  # update prop
x ondb rm --id t1                                               # delete

x ondb link --from proj_001 --rel has_task --to t1              # create relation
x ondb link --from t1 --rel blocks --to t2                      # with link props: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # outgoing relations
x ondb linked --id t1 --direction incoming                      # incoming (who links TO)
x ondb related --id proj_001 --rel has_task --json              # full entity on other side

x ondb ls --type Task                                           # list by type
x ondb query --type Task --where status=open --json             # filter by props
```

`linked` = 関係のメタデータ。`related` = 相手側の完全な entity。データディレクトリには `--dir <path>` / `-d <path>` を使う（→ `path/ondb.tsv`）。

## スキーマと検証

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # checks required, enum, dangling refs, cardinality, cycles
```

ディレクティブ: `type:Name:{required|forbidden|enum|datetime|ref}:...`、`relation:Rel:{from_types|to_types|cardinality|acyclic}:...`。検証は書き込みとは分離されている。

## アーキテクチャ原則

- **ログが source** — TSV ログが権威であり、SQLite はマテリアライズドビュー
- **追記専用** — `set`、`rm`、`unlink` は行を追記する。既存の行を変更しない
- **複数インスタンス** — サブドメインごとに 1 つの ondb（デフォルト）。マージはドメイツ跨りの連鎖があるときだけ
- **Type = Concept** — 同じ type 名は常に同じ概念を指す
- **オンデマンドで検証** — 書き込み時のスキーマチェックはしない。バッチ変更の後に `validate` を実行

## バックエンド

| バックエンド | 使う場面 | |
|---|---|---|
| **AWK**（デフォルト） | 2 千エンティティ未満 | 依存ゼロ、ストリーミング |
| Python | 中規模 | 豊かなデータ構造 |
| JS/Bun | Web アプリ | JSON ネイティブ |
| SQLite | 5 千エンティティ超 | TSV ログから自動生成 |

## ディレクトリ構造

```
<datadir>/ONDB.DESC.txt    # Required. Identifies ondb instance
<datadir>/ondb.tsv         # Append-only log
<datadir>/schema.tsv       # Optional. Constraints
<datadir>/ondb.db          # Optional. SQLite materialized view
```

## さらに詳しくは

- `x ondb --help` — CLI リファレンス
- `x ondb libpath {awk,py,js}` — カスタムクエリのためのライブラリパス
- [ondb SKILL.md](../../../ondb/SKILL.md) — 完全なドキュメント（シナリオ、連携、カスタムクエリ、SQLite WAL 設定）

## Related

- [yfm](../yfm/SKILL.md) — yfm の `metadata:` が推奨される取り込み面
- [rule](../rule/SKILL.md) — スキーマ検証のルールは rule フレームワークにある