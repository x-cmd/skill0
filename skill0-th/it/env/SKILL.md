---
name: env
description: |
  ติดตั้งและจัดการแพ็กเกจซอฟต์แวร์ รันไทม์ของภาษา และเครื่องมือ CLI ได้ทันที
  ไม่มีอุปสรรค ติดตั้ง x-cmd แล้วใช้เครื่องมือใด ๆ ได้ในไม่กี่วินาที ไม่ต้องใช้ sudo
  ใช้เมื่อเจอคำว่า "install", "package", "python", "node", "jq", "runtime", "tool"

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

ติดตั้งซอฟต์แวร์ใด ๆ ได้ทันที ไม่ต้องใช้ sudo ไม่ทำให้ระบบรก

## เริ่มใช้งาน

```bash
# ติดตั้ง x-cmd
eval "$(curl https://get.x-cmd.com)"

# ติดตั้ง Python
x env use python

# ติดตั้ง Node.js
x env use node

# ติดตั้งเครื่องมือ CLI
x env use jq
x env use fzf

# ลองใช้ก่อนโดยไม่ต้องติดตั้งถาวร
x env try python3 script.py
```

## มีอะไรให้ใช้บ้าง

แพ็กเกจกว่า 600 รายการ รวม:

- ภาษา — python, node, go, bun, java, rust
- เครื่องมือ CLI — jq, yq, fzf, himalaya
- เครื่องมือพัฒนา — claude-code, code-server

## ฟีเจอร์สำคัญ

- **ไม่ต้องใช้ sudo** — ติดตั้งลงในไดเรกทอรีผู้ใช้
- **จัดการเวอร์ชัน** — ติดตั้งและสลับเวอร์ชันได้
- **ลองก่อนติดตั้ง** — ใช้ `x env try` สำหรับการใช้งานชั่วคราว
- **ทำความสะอาด** — `x env clean` ลบแพ็กเกจที่ไม่ได้ใช้

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบการติดตั้งที่พบบ่อย
- เคล็ดลับการล็อกเวอร์ชัน
- คู่มือตั้งค่าโปรเจกต์หลายภาษา

## ได้ประสบการณ์เต็มรูปแบบ

หลังติดตั้ง x-cmd แล้ว ใช้ `x env --help` เพื่อดูตัวเลือกทั้งหมด

## ที่เกี่ยวข้อง

- [install](../install/SKILL.md) — `x env use` เป็นหนึ่งในช่องทางของ install
- [x-cmd](../x-cmd/SKILL.md) — จุดเข้าหลักของ env