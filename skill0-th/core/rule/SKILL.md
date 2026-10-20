---
name: rule
description: การตรวจสอบการปฏิบัติตามกฎแบบอิงกฎ — หาปัญหา และรับประกันคุณภาพขั้นต่ำ ใช้คู่กับ `x rule` สำหรับขั้นตอนการทำงานบน shell ดู rule-vs-score.md ว่าเมื่อไรควรใช้ rule และเมื่อไรควรใช้ score
metadata:
  related: "score,naming,ontology-database,devloop"
---


# Rule

การตรวจสอบการปฏิบัติตามกฎแบบอิงกฎ หาปัญหา และรับประกันคุณภาพขั้นต่ำ

ดู [rule-vs-score.md](rule-vs-score.md) ว่าเมื่อไรควรใช้ rule และเมื่อไรควรใช้ score

## ที่เกี่ยวข้อง

- [score](../score/SKILL.md) — เพื่อนคู่ของการให้คะแนน (ดู rule-vs-score)
- [naming](../naming/SKILL.md) — ชื่อที่เป็นตัวเลือกจะถูกตรวจสอบความถูกต้องด้วย rule
- [ontology-database](../ontology-database/SKILL.md) — rule บังคับใช้ข้อกำหนดของ schema ให้กับ ondb
- [devloop](../devloop/SKILL.md) — rule.yml คือชิ้นงานการตรวจสอบของ devloop