---
name: csv
description: |
  Xử lý dữ liệu CSV — xem, lọc, chuyển đổi, gộp dữ liệu dạng bảng.
  Không rào cản — dùng với x-cmd, Python, hoặc awk.
  Dùng cho "csv", "data", "table", "spreadsheet", "conversion".

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

Xử lý dữ liệu CSV: xem, lọc, chuyển đổi, gộp. Hoạt động với mọi nguồn dữ liệu dạng bảng.

## Bắt đầu nhanh

```bash
# Với x-cmd
x csv tab 1,3,6 < data.csv           # Hiển thị các cột cụ thể
x csv awk '{print $1, $3}' < data.csv # Xử lý bằng AWK
x csv tojson < data.csv               # Chuyển sang JSON
x csv merge2 id file2.csv < file1.csv # Gộp theo khóa

# Không dùng x-cmd — dùng Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# Hoặc dùng Miller (mlr), xsv, csvkit
```

## Có sẵn những gì

- `x csv tab <cols>` — Hiển thị các cột đã chọn
- `x csv awk '{...}'` — Xử lý theo kiểu AWK
- `x csv tojson` — Chuyển sang JSON
- `x csv tojsonl` — Chuyển sang JSON Lines
- `x csv totsv` — Chuyển sang TSV
- `x csv merge2` — Gộp hai file CSV theo khóa
- `x csv header` — Thao tác trên phần header
- `x csv app` — Trình xem bảng tương tác

## Lựa chọn thay thế độc lập

- Python: module `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## skill0 này sẽ tiếp tục phát triển

Bắt đầu với những thứ cơ bản nhất. Sẽ bổ sung thêm:
- Các mẫu thao tác CSV phổ biến
- Công thức Python/awk
- Mẹo làm sạch dữ liệu

## Liên quan

- [tsv](../tsv/SKILL.md) — công cụ định dạng theo cột tương đồng (TSV)