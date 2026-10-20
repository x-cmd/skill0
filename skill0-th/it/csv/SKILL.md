---
name: csv
description: |
  การประมวลผลข้อมูล CSV — ดู กรอง แปลง และรวมข้อมูลตาราง
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd, Python หรือ awk
  ใช้เมื่อเจอคำว่า "csv", "data", "table", "spreadsheet", "conversion"

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

ประมวลผลข้อมูล CSV: ดู กรอง แปลง และรวม ใช้ได้กับแหล่งข้อมูลตารางใด ๆ

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x csv tab 1,3,6 < data.csv           # แสดงคอลัมน์ที่ระบุ
x csv awk '{print $1, $3}' < data.csv # ประมวลผลด้วย AWK
x csv tojson < data.csv               # แปลงเป็น JSON
x csv merge2 id file2.csv < file1.csv # รวมตามคีย์

# ไม่ใช้ x-cmd — ใช้ Python
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# หรือใช้ Miller (mlr), xsv, csvkit
```

## มีอะไรให้ใช้บ้าง

- `x csv tab <cols>` — แสดงเฉพาะคอลัมน์ที่เลือก
- `x csv awk '{...}'` — ประมวลผลแบบ AWK
- `x csv tojson` — แปลงเป็น JSON
- `x csv tojsonl` — แปลงเป็น JSON Lines
- `x csv totsv` — แปลงเป็น TSV
- `x csv merge2` — รวม CSV สองไฟล์ตามคีย์
- `x csv header` — จัดการส่วนหัวตาราง
- `x csv app` — ตัวดูตารางแบบโต้ตอบ

## ทางเลือกแบบใช้ลำพัง

- Python: โมดูล `csv`, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบ CSV ที่พบบ่อย
- สูตรสำเร็จสำหรับ Python/awk
- เคล็ดลับการทำความสะอาดข้อมูล

## ที่เกี่ยวข้อง

- [tsv](../tsv/SKILL.md) — เครื่องมือรูปแบบคอลัมน์คู่กัน (TSV)