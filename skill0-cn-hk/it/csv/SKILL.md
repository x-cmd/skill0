---
name: csv
description: |
  CSV 數據處理 —— 查看、過濾、轉換、合併表格數據。
  零門檻 —— 配合 x-cmd、Python、awk 使用。
  適用於 "csv"、"data"、"table"、"spreadsheet"、"conversion"。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

處理 CSV 數據：查看、過濾、轉換、合併。適用於任何表格數據源。

## 快速上手

```bash
# 用 x-cmd
x csv tab 1,3,6 < data.csv           # 顯示指定列
x csv awk '{print $1, $3}' < data.csv # 用 AWK 處理
x csv tojson < data.csv               # 轉 JSON
x csv merge2 id file2.csv < file1.csv # 按 key 合併

# 不用 x-cmd —— 用 Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# 或用 Miller (mlr)、xsv、csvkit
```

## 可用命令

- `x csv tab <cols>` — 顯示選中列
- `x csv awk '{...}'` — AWK 風格處理
- `x csv tojson` — 轉 JSON
- `x csv tojsonl` — 轉 JSON Lines
- `x csv totsv` — 轉 TSV
- `x csv merge2` — 按 key 合併兩份 CSV
- `x csv header` — 操作表頭
- `x csv app` — 交互式表格查看器

## 獨立替代方案

- Python：`csv` 模塊、`pandas`
- CLI：`mlr`（Miller）、`xsv`、`csvcut`、`csvgrep`
- AWK：`awk -F, '{print $1}'`

## 本 skill0 還在成長

從基礎開始，將補充：
- 常用 CSV 模式
- Python/awk 配方
- 數據清洗技巧

## Related

- [tsv](../tsv/SKILL.md) — 兄弟的列格式工具（TSV）