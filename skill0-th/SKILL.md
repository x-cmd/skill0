---
name: skill0
description: "ดัชนีหลักของ x-cmd skill0 sub-skills กำหนดขั้นตอนการทำงานของ agent แบบ OKR (เป้าหมาย → ผลลัพธ์ที่ผ่านการตรวจสอบตามกฎ → ลงมือทำ) การค้นพบสกิล และความชอบด้านเครื่องมือของ agent รูปแบบ: ยึดหลักการก่อน กระชับ แล้วส่งรายละเอียดไปยังแหล่งข้อมูลภายนอกที่เป็นทางการ"
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 เข้ารหัสหลักการ ไม่ใช่ข้อมูล

LLM ดูดกลื่นความรู้สามัญอย่างต่อเนื่อง หน้าที่ของ skill0 คือเข้ารหัสข้อตกลงและตัวชี้ไปยังแหล่งที่มา แล้วค่อย ๆ บางลงเมื่อ LLM ตามทัน ตรวจสอบผ่านข้อมูลจากผู้ผลิตรายแรก (`x rfc`, `x cve`, `x wkp`, `agent-browser`) และแนวปฏิบัติที่ดีที่สุดในปัจจุบัน (`x skill`, `x clawhub`) จากนั้นสร้างขึ้นใหม่ด้วยตรรกะเชิงรูปแบบ แทนที่จะจำจำ

## Sub-skills เรียงเป็นกราฟกำหนดทิศใน 4 หมวด

หมวดคือ `core/`, `data/`, `it/`, `life/` เส้นทางคือ `<bucket>/<slug>/SKILL.md` แคตตาล็อกที่เครื่องอ่านได้ (name + description) อยู่ที่ [index.tsv](index.tsv) เคยมีเอกสารฉบับหนึ่งอยู่ตรงนี้ในฐานะคู่มือปฏิสัมพันธ์สำหรับ manager/lifestyle ต่อมาถูกย้ายไปที่ [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) เพราะไม่ได้เป็นส่วนหนึ่งของกราฟ skill0

## เป้าหมาย → keyresults → x-rule คือขั้นตอน OKR

วัตถุประสงค์: ต้องการบรรลุอะไร
Key Results: จะตรวจสอบอย่างไร
การตรวจสอบ: `x rule check/audit`

## หลังตั้งโครงเสร็จ ให้ใช้เครื่องมือ x-cmd ในการลงมือทำ

- `x skill` — แคตตาล็อกสกิลของ x-cmd ที่คัดสรรมาและผ่านการตรวจโดยมนุษย์
- `x clawhub` — ศูนย์ลงทะเบียนสกิลทั่วโลก **ข้อควรระวัง**: อัปโหลดได้ฟรี ต้องรัน `x clawhub skill moderate <name>` เพื่อดูรายงานความปลอดภัยที่ระบบสร้างให้อัตโนมัติ
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — การจัดการโปรเจกต์ การจัดตารางเวลา agent เบื้องหลัง ontology และ wiki ใช้คำสั่ง `x [mod] --help`

## ทุก SKILL.md ต้องผ่าน skill0-writer

ดูข้อตกลงและแนวปฏิบัติได้ที่ [skill0-writer](core/skill0-writer/SKILL.md)