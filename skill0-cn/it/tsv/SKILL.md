---
name: tsv
description: |
  TSV 数据处理 —— 查看、过滤、转换 tab 分隔数据。
  零门槛 —— 配合 x-cmd、awk 或 Python 使用。
  适用于 "tsv"、"tab-separated"、"data"、"conversion"。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

处理 TSV（Tab-Separated Values）数据：查看、过滤、格式转换。

## 快速上手

```bash
# 用 x-cmd
x tsv < data.tsv                   # 显示 TSV 数据
x tsv --csv < data.tsv             # 转 CSV
x tsv awk '{print $1, $3}' < data.tsv  # 用 AWK 处理

# 不用 x-cmd —— AWK 原生支持 TSV
awk -F'\t' '{print $1, $3}' data.tsv
# TSV 转 CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# 过滤行
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## 可用命令

- `x tsv` — 显示 TSV 数据
- `x tsv --csv` — 转 CSV
- `x tsv awk '{...}'` — AWK 风格处理

## 独立替代方案

- AWK：`awk -F'\t' '{...}'` —— 原生 TSV 支持
- Python：`csv` 模块加 `delimiter='\t'`
- Miller：`mlr --tsv cat data.tsv`

## 本 skill0 还在成长

从基础开始，将补充：
- 常用 TSV 模式
- TSV↔CSV 转换配方
- 列操作技巧

## Related

- [csv](../csv/SKILL.md) — 兄弟的列格式工具（CSV）
- [ontology-database](../ontology-database/SKILL.md) — ondb log 即 TSV