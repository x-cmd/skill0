---
name: tsv
description: |
  Xử lý dữ liệu TSV — xem, lọc, chuyển đổi dữ liệu phân tách bằng tab.
  Không rào cản — dùng với x-cmd, awk hoặc Python.
  Dùng cho "tsv", "tab-separated", "data", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

Xử lý dữ liệu TSV (Tab-Separated Values): xem, lọc, chuyển đổi giữa các định dạng.

## Bắt đầu nhanh

```bash
# Với x-cmd
x tsv < data.tsv                   # Hiển thị dữ liệu TSV
x tsv --csv < data.tsv             # Chuyển sang CSV
x tsv awk '{print $1, $3}' < data.tsv  # Xử lý bằng AWK

# Không dùng x-cmd — AWK xử lý TSV sẵn có
awk -F'\t' '{print $1, $3}' data.tsv
# Chuyển TSV sang CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# Lọc các dòng
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## Có sẵn những gì

- `x tsv` — Hiển thị dữ liệu TSV
- `x tsv --csv` — Chuyển sang CSV
- `x tsv awk '{...}'` — Xử lý theo phong cách AWK

## Các lựa chọn chạy độc lập

- AWK: `awk -F'\t' '{...}'` — hỗ trợ TSV sẵn có
- Python: module `csv` với `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## skill0 này sẽ tiếp tục lớn lên

Bắt đầu từ phần cốt lõi. Sẽ bổ sung:
- Các mẫu TSV thường gặp
- Công thức chuyển đổi TSV↔CSV
- Mẹo thao tác trên cột

## Related

- [csv](../csv/SKILL.md) — công cụ định dạng cột tương đồng (CSV)
- [ontology-database](../ontology-database/SKILL.md) — nhật ký ondb ở dạng TSV
