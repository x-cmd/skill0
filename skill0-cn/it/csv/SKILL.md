---
name: csv
description: |
  CSV 数据处理 —— 查看、过滤、转换、合并表格数据。
  零门槛 —— 配合 x-cmd、Python、awk 使用。
  适用于 "csv"、"data"、"table"、"spreadsheet"、"conversion"。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

处理 CSV 数据：查看、过滤、转换、合并。适用于任何表格数据源。

## 快速上手

```bash
# 用 x-cmd
x csv tab 1,3,6 < data.csv           # 显示指定列
x csv awk '{print $1, $3}' < data.csv # 用 AWK 处理
x csv tojson < data.csv               # 转 JSON
x csv merge2 id file2.csv < file1.csv # 按 key 合并

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

- `x csv tab <cols>` — 显示选中列
- `x csv awk '{...}'` — AWK 风格处理
- `x csv tojson` — 转 JSON
- `x csv tojsonl` — 转 JSON Lines
- `x csv totsv` — 转 TSV
- `x csv merge2` — 按 key 合并两份 CSV
- `x csv header` — 操作表头
- `x csv app` — 交互式表格查看器

## 独立替代方案

- Python：`csv` 模块、`pandas`
- CLI：`mlr`（Miller）、`xsv`、`csvcut`、`csvgrep`
- AWK：`awk -F, '{print $1}'`

## 本 skill0 还在成长

从基础开始，将补充：
- 常用 CSV 模式
- Python/awk 配方
- 数据清洗技巧

## Related

- [tsv](../tsv/SKILL.md) — 兄弟的列格式工具（TSV）