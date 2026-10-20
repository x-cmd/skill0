---
name: yfm
description: |
  YAML front matter (YFM) สำหรับบทความ markdown ทุกชิ้น ค่าเริ่มต้นของ x-cmd คือฟิลด์ระดับบนสุดสามฟิลด์ ได้แก่ `tags`, `description`, `memo` ค่าเริ่มต้นนี้ยืมโครงร่างมาจาก frontmatter ของ Agent Skills — ดู <https://agentskills.io/specification> โมดูล yfm เป็นตัวช่วย: `x yfm ls / init / lint`

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## ใช้ YFM

ใช้ YFM กับ markdown ทุกชิ้นที่ agent, ดัชนี หรือสายงาน ontology อาจนำไปสแกน **ถ้ามีสำเนียงแบบใดแบบหนึ่งอยู่แล้ว ให้ทำตามสำเนียงนั้น** (Agent Skills, Obsidian, Jekyll, Hugo ฯลฯ) — ค่าเริ่มต้นของ x-cmd มีผลเฉพาะเมื่อไม่มีสำเนียงอื่นกำกับอยู่

## ค่าเริ่มต้นของ x-cmd: สามฟิลด์

```yaml
---
tags: [design, front-matter]
description: ประโยคสรุปหนึ่งบรรทัดที่ผู้อ่านใช้ตัดสินว่าจะเปิดไฟล์นี้หรือไม่
memo:
  2026-07-31T14:30:00+08:00: ตัด alias ออก เปลี่ยนชื่อฟิลด์ที่สามเป็น memo
---

# ชื่อเรื่อง

เนื้อหา...
```

- **`tags`** — รายการ slug ระดับบนสุด `[a-z0-9-]` ผู้ใช้งานคือ collector สำหรับการทำดัชนี ontology
- **`description`** — สตริงระดับบนสุด หนึ่งประโยค ไม่ใช่ `description:` ของ Agent Skills (อันนั้นเป็นข้อกำหนดเฉพาะ SKILL.md อยู่ภายใต้ `skill0-writer`)
- **`memo:`** — แผนที่ระดับบนสุด คือบันทึกการแก้ไขของไฟล์ คีย์คือ timestamp ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm` ตามเขตเวลาของผู้เขียน) ค่าคือคำอธิบายการเปลี่ยนแปลงแบบสั้น เรียงจากใหม่ไปเก่า ถ้าไม่มีประวัติที่ควรบันทึกก็ละไว้ได้

### ขอบเขตที่เกี่ยวข้อง

- `<project>/.x-cmd/story/` — ขยายด้วย `issue:` — ดู [usecase/story.md](usecase/story.md)
- เนื้อหา GitHub issue / PR — ขยายด้วย `repo:`, `number:` — ดู [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md)
- GitHub `README.md` — ใช้เฉพาะฟิลด์ค่าเริ่มต้น

## โมดูล

โมดูล yfm เป็นเครื่องช่วย มีสามคำสั่ง:

- `x yfm ls [path]` — แสดงรายการบล็อก YFM ค่าเริ่มต้นคือไดเรกทอรีปัจจุบัน
- `x yfm init [path]` — เขียนบล็อกแบบค่าเริ่มต้นของ x-cmd ลงในไฟล์ markdown ทุกไฟล์ใต้พาธนั้น
- `x yfm lint [path]` — ตรวจว่าบล็อก YFM แต่ละอันเป็น YAML ที่ถูกต้อง และตรงกับสำเนียงที่มันอ้างอิง

## การอ่าน front matter ต่างสำเนียง

collector รับเข้าหลายสำเนียง สำหรับข้อกำหนดที่ค่าเริ่มต้นยืมมา ดู <https://agentskills.io/specification> แยกตามสำเนียง:

- [Agent Skills](usecase/agentskills.md) — `metadata:` เป็น string→string ระดับบนสุดปิดสนิท
- [Obsidian](usecase/obsidian.md) — สงวนชื่อ `tags` / `aliases` / `cssclasses`
- [Jekyll](usecase/jekyll.md) — เป็นรายการ หรือคั่นด้วย**ช่องว่าง**
- [Hugo](usecase/hugo.md) — เป็น TOML ได้ ใช้ taxonomy ที่ตั้งค่าไว้ในเว็บไซต์