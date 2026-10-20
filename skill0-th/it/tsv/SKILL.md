---
name: tsv
description: |
  การประมวลผลข้อมูล TSV — ดู กรอง และแปลงข้อมูลที่คั่นด้วยแท็บ
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd, awk หรือ Python
  ใช้เมื่อเจอคำว่า "tsv", "tab-separated", "data", "conversion"

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

ประมวลผลข้อมูล TSV (Tab-Separated Values): ดู กรอง และแปลงระหว่างรูปแบบต่าง ๆ

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x tsv < data.tsv                   # แสดงข้อมูล TSV
x tsv --csv < data.tsv             # แปลงเป็น CSV
x tsv awk '{print $1, $3}' < data.tsv  # ประมวลผลด้วย AWK

# ไม่ใช้ x-cmd — AWK รองรับ TSV โดยตรง
awk -F'\t' '{print $1, $3}' data.tsv
# แปลง TSV เป็น CSV
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# กรองแถว
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## มีอะไรให้ใช้บ้าง

- `x tsv` — แสดงข้อมูล TSV
- `x tsv --csv` — แปลงเป็น CSV
- `x tsv awk '{...}'` — ประมวลผลแบบ AWK

## ทางเลือกแบบใช้ลำพัง

- AWK: `awk -F'\t' '{...}'` — รองรับ TSV โดยตรง
- Python: โมดูล `csv` ที่ใช้ `delimiter='\t'`
- Miller: `mlr --tsv cat data.tsv`

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบ TSV ที่พบบ่อย
- สูตรสำเร็จสำหรับแปลง TSV↔CSV
- เคล็ดลับการจัดการคอลัมน์

## ที่เกี่ยวข้อง

- [csv](../csv/SKILL.md) — เครื่องมือรูปแบบคอลัมน์คู่กัน (CSV)
- [ontology-database](../ontology-database/SKILL.md) — บันทึกของ ondb เป็น TSV