---
name: ccal
description: |
  ปฏิทินของจีนแผ่นดินใหญ่ พร้อม 调休, 农历, 节气, 生肖, 黄历吉凶 和干支纪年
  มีหลายวิธีเข้าถึง: `x ccal`, ดาวน์โหลดไฟล์เก็บถาวรโดยตรง หรือรูปแบบ tsv

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — กฎที่วันหยุดสุดสัปดาห์จะถูกยืมมาสร้างวันหยุดในวันทำงาน หรือวันทำงานถูกคืนให้ เมื่อวันหยุดตรงกับวันหยุดสุดสัปดาห์ — คือฟีเจอร์หลักสำหรับผู้ใช้ชาวจีนที่วางแผนตามปฏิทินทำงานทางการ

## เริ่มใช้งาน quickly ด้วย `x ccal`

```bash
# แสดงข้อมูลทุกวันในรูปแบบ tsv โครงสร้างคอลัมน์ TSV คือ:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(สามสถานะ:休 工 无-วันหยุดหรือวันทำงานที่ไม่ได้เกิดจากการสลับวัน)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# แสดงข้อมูลทุกวันในรูปแบบ tsv
x ccal ls 2026-07
# วันที่เจาะจงในรูปแบบ YAML
x ccal info 2026-05-31
# ดูไดเรกทอรีข้อมูล ถ้าว่างให้ลอง `x ccal update`
x ccal datadir
```

ใช้ `x ccal -h` เพื่อดูข้อมูลเพิ่มเติม

ข้อควรทราบ: แหล่งข้อมูลคือ https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

เพื่อประหยัดพื้นที่ `x ccal` ใช้คำสั่ง tar เพื่อนำทางภายใน tar.xz โดยไม่ต้องแตกออกมา เราส่งเสริมวิธีนี้ แต่ถ้าต้องการจัดการได้อย่างอิสระมากขึ้น ก็แตกออกมาตามต้องการได้