---
name: tsv
description: |
  TSV データ処理 —— タブ区切りデータの表示、フィルタ、変換。
  ゼロバリア —— x-cmd、awk、Python のいずれからでも使える。
  "tsv"、"tab-separated"、"data"、"conversion" に適用。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

TSV（Tab-Separated Values）データの処理：表示、フィルタ、フォーマット間の変換。

## クイックスタート

```bash
# x-cmd を使う
x tsv < data.tsv                   # TSV データを表示
x tsv --csv < data.tsv             # CSV に変換
x tsv awk '{print $1, $3}' < data.tsv  # AWK で処理

# x-cmd なし —— AWK は TSV をネイティブに扱える
awk -F'\t' '{print $1, $3}' data.tsv
# TSV を CSV に変換
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# 行をフィルタ
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## 使えるコマンド

- `x tsv` — TSV データを表示
- `x tsv --csv` — CSV に変換
- `x tsv awk '{...}'` — AWK スタイルの処理

## 単体で使うときの代替手段

- AWK: `awk -F'\t' '{...}'` —— TSV をネイティブ対応
- Python: `delimiter='\t'` を指定した `csv` モジュール
- Miller: `mlr --tsv cat data.tsv`

## この skill0 は成長中

まず最低限から。追加予定:
- よく使う TSV パターン
- TSV↔CSV 変換のレシピ
- 列操作のヒント

## Related

- [csv](../csv/SKILL.md) — 姉妹の列形式ツール（CSV）
- [ontology-database](../ontology-database/SKILL.md) — ondb のログは TSV 形式
