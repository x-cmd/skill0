---
name: csv
description: |
  CSV データ処理 —— 表示、フィルタ、変換、表形式データのマージ。
  ゼロバリア —— x-cmd、Python、awk のいずれからでも使える。
  "csv"、"data"、"table"、"spreadsheet"、"conversion" に適用。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

CSV データを処理する：表示、フィルタ、変換、マージ。あらゆる表形式データソースに使える。

## クイックスタート

```bash
# x-cmd を使う
x csv tab 1,3,6 < data.csv           # 特定の列を表示
x csv awk '{print $1, $3}' < data.csv # AWK で処理
x csv tojson < data.csv               # JSON に変換
x csv merge2 id file2.csv < file1.csv # key でマージ

# x-cmd なし —— Python を使う
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# あるいは Miller (mlr)、xsv、csvkit を使う
```

## 使えるコマンド

- `x csv tab <cols>` — 選んだ列を表示
- `x csv awk '{...}'` — AWK スタイルの処理
- `x csv tojson` — JSON に変換
- `x csv tojsonl` — JSON Lines に変換
- `x csv totsv` — TSV に変換
- `x csv merge2` — key で 2 つの CSV をマージ
- `x csv header` — ヘッダーを操作
- `x csv app` — 対話型のテーブルビューア

## 単体で使うときの代替手段

- Python: `csv` モジュール、`pandas`
- CLI: `mlr`（Miller）、`xsv`、`csvcut`、`csvgrep`
- AWK: `awk -F, '{print $1}'`

## この skill0 は成長中

まず最低限から。追加予定:
- よく使う CSV パターン
- Python / awk のレシピ
- データクリーニングのヒント

## Related

- [tsv](../tsv/SKILL.md) — 姉妹の列形式ツール（TSV）
