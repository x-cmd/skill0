---
name: time
description: |
  การจับเวลาการทำงานของคำสั่ง — ความละเอียดระดับไมโครวินาที การวิเคราะห์สถิติ และการเปรียบเทียบ
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd หรือคำสั่ง time ของ shell
  ใช้เมื่อเจอคำว่า "timing", "benchmark", "performance", "profiling"

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

วัดเวลาการทำงานของคำสั่ง ตั้งแต่การจับเวลาครั้งเดียวความละเอียดระดับไมโครวินาที ไปจนถึงการวิเคราะห์สถิติจากหลายรอบ

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x time <command>                      # จับเวลาครั้งเดียวความละเอียดไมโครวินาที
x time stress -c 100 <command>        # สถิติจาก 100 รอบ
x time cmp 'cmd1' 'cmd2' 'cmd3'      # เปรียบเทียบคำสั่ง

# ไม่ใช้ x-cmd — ใช้คำสั่งที่มากับ shell
time <command>                        # จับเวลาพื้นฐาน
# ถ้าต้องการเบนช์มาร์ก ให้ใช้ลูป:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## มีอะไรให้ใช้บ้าง

- `x time <cmd>` — รันครั้งเดียว ความละเอียดระดับไมโครวินาที
- `x time getms <cmd>` — ความละเอียดระดับมิลลิวินาที
- `x time stress -c N <cmd>` — รัน N ครั้งพร้อมสถิติครบถ้วน
- `x time stress -b N <cmd>` — เลือกจำนวนรอบอัตโนมัติภายในงบเวลาที่กำหนด
- `x time cmp 'c1' 'c2'` — เปรียบเทียบหลายคำสั่ง

## รูปแบบผลลัพธ์

- `--csv` เป็น CSV สำหรับการวิเคราะห์ด้วยโปรแกรม
- `--tsv` คั่นด้วยแท็บ
- `--yml` เป็น YAML

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบการเบนช์มาร์ก
- คู่มือการตีความสถิติ
- รูปแบบที่ทำให้ประสิทธิภาพแย่ที่พบบ่อย

## ที่เกี่ยวข้อง