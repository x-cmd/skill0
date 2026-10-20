---
name: ontology-database
description: กราฟความรู้แบบมีชนิดข้อมูลผ่านบันทึก TSV แบบเติมต่อท้าย — CRUD ของเอนทิตี ความสัมพันธ์กำหนดทิศ การตรวจสอบ schema และการให้เหตุผลแบบหลายก้าว ใช้ผ่าน `x ondb` โปรโตคอลอ่านได้ด้วย AWK/Python/JS/SQLite
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

กราฟความรู้แบบมีชนิดข้อมูล: ทุกอย่างคือ **เอนทิตี** (id + type + properties) ที่เชื่อมกันด้วย **ความสัมพันธ์กำหนดทิศ** (from → rel → to) การแก้ไขทุกครั้งจะเติมบรรทัด TSQ ต่อท้าย — ไม่เขียนทับ บันทึก TSV นั้นแหละคือฐานข้อมูล

## รูปแบบบันทึก TSV (โปรโตคอล)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # สร้างเอนทิตี
set     <id>  <epoch_ms>  key  val                             # อัปเดตคุณสมบัติ
rm      <id>  <epoch_ms>                                       # ลบเอนทิตี
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # สร้างความสัมพันธ์
unlink  <from>  <rel>  <to>  <epoch_ms>                        # ลบความสัมพันธ์
# คั่นด้วยแท็บ การหลีกเลี่ยง: \t → แท็บ, \n → ขึ้นบรรทัดใหม่, \\ → แบ็กสแลช
# properties คือคู่ key/val สลับกัน (แต่ละค่าเป็นฟิลด์แท็บหนึ่งช่อง)
```

ภาษาใดก็อ่านได้ AWK อ่านแบบสตรีม Python ใช้ dict SQLite สร้างเป็นตาราง **บันทึกคือแหล่งความจริง**

## การใช้งานผ่าน CLI

```
x ondb add --type Person --name Alice                            # UUID อัตโนมัติ
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # รายละเอียดเอนทิตี
x ondb set --id t1 status=done                                  # อัปเดตคุณสมบัติ
x ondb rm --id t1                                               # ลบ

x ondb link --from proj_001 --rel has_task --to t1              # สร้างความสัมพันธ์
x ondb link --from t1 --rel blocks --to t2                      # ใส่คุณสมบัติลิงก์: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # ความสัมพันธ์ขาออก
x ondb linked --id t1 --direction incoming                      # ความสัมพันธ์ขาเข้า (ใครลิงก์มาหา)
x ondb related --id proj_001 --rel has_task --json              # เอนทิตีเต็มของอีกฝั่ง

x ondb ls --type Task                                           # แสดงรายการตามชนิด
x ondb query --type Task --where status=open --json             # กรองตามคุณสมบัติ
```

`linked` = ข้อมูลเมตาของความสัมพันธ์ `related` = เอนทิตีเต็มของอีกฝั่ง ใช้ `--dir <path>` / `-d <path>` ระบุไดเรกทอรีข้อมูล (→ `path/ondb.tsv`)

## Schema และการตรวจสอบ

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # ตรวจ required enum ลิงก์ขาด จำนวนความสัมพันธ์ และวงจร
```

ไดเรกทีฟ: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...` การตรวจสอบแยกออกจากการเขียน

## หลักการเชิงสถาปัตยกรรม

- **บันทึกคือแหล่งข้อมูล** — บันทึก TSV เป็นสิ่งที่เชื่อถือได้ SQLite เป็นเพียง materialized view
- **เติมต่อท้ายเท่านั้น** — `set`, `rm`, `unlink` เติมบรรทัดใหม่ ไม่แก้บรรทัดเดิม
- **หลายอินสแตนซ์** — หนึ่ง ondb ต่อหนึ่ง subdomain (ค่าเริ่มต้น) ผสานกันเฉพาะเมื่อต้องเชื่อมข้ามโดเมน
- **ชนิด = แนวคิด** — ชื่อชนิดเดียวกันต้องหมายถึงแนวคิดเดียวกันเสมอ
- **ตรวจสอบเมื่อต้องการ** — ไม่ตรวจ schema ตอนเขียน ให้รัน `validate` หลังแก้กลุ่ม

## แบ็กเอนด์

| แบ็กเอนด์ | เมื่อไร | |
|---|---|---|
| **AWK** (ค่าเริ่มต้น) | < 2k เอนทิตี | ไม่ต้องมี dependency อ่านแบบสตรีม |
| Python | ขนาดกลาง | โครงสร้างข้อมูลแบบสมบูรณ์ |
| JS/Bun | เว็บแอป | JSON โดยกำเนิด |
| SQLite | > 5k เอนทิตี | สร้างอัตโนมัติจากบันทึก TSV |

## โครงสร้างไดเรกทอรี

```
<datadir>/ONDB.DESC.txt    # จำเป็น ระบุตัวตนของอินสแตนซ์ ondb
<datadir>/ondb.tsv         # บันทึกแบบเติมต่อท้าย
<datadir>/schema.tsv       # ไม่บังคับ ข้อกำหนด
<datadir>/ondb.db          # ไม่บังคับ materialized view ของ SQLite
```

## ข้อมูลเพิ่มเติม

- `x ondb --help` — คู่มือ CLI
- `x ondb libpath {awk,py,js}` — เส้นทางไลบรารีสำหรับเขียนคิวรีเอง
- [ondb SKILL.md](../../../ondb/SKILL.md) — เอกสารฉบับเต็ม (สถานการณ์ใช้งาน การผสานรวม คิวรีเอง การตั้งค่า SQLite WAL)

## ที่เกี่ยวข้อง

- [yfm](../yfm/SKILL.md) — `metadata:` ของ yfm คือพื้นที่รับข้อมูลที่แนะนำ
- [rule](../rule/SKILL.md) — กฎการตรวจสอบ schema อยู่ในกรอบของ rule