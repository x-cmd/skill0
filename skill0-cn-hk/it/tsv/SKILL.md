---
name: tsv
description: |
  TSV 數據處理 —— 查看、過濾、轉換 tab 分隔數據。
  零門檻 —— 配合 x-cmd、awk 或 Python 使用。
  適用於 "tsv"、"tab-separated"、"data"、"conversion"。

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

處理 TSV（Tab-Separated Values）數據：查看、過濾、格式轉換。

## 快速上手

```bash
# 用 x-cmd
x tsv < data.tsv                   # 顯示 TSV 數據
x tsv --csv < data.tsv             # 轉 CSV
x tsv awk '{print $1, $3}' < data.tsv  # 用 AWK 處理

# 不用 x-cmd —— AWK 原生支持 TSV
awk -F'\t' '{print $1, $3}' data.tsv
# TSV 轉 CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# 過濾行
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## 可用命令

- `x tsv` — 顯示 TSV 數據
- `x tsv --csv` — 轉 CSV
- `x tsv awk '{...}'` — AWK 風格處理

## 獨立替代方案

- AWK：`awk -F'\t' '{...}'` —— 原生 TSV 支持
- Python：`csv` 模塊加 `delimiter='\t'`
- Miller：`mlr --tsv cat data.tsv`

## 本 skill0 還在成長

從基礎開始，將補充：
- 常用 TSV 模式
- TSV↔CSV 轉換配方
- 列操作技巧

## Related

- [csv](../csv/SKILL.md) — 兄弟的列格式工具（CSV）
- [ontology-database](../ontology-database/SKILL.md) — ondb log 即 TSV