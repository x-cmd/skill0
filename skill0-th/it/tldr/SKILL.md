---
name: tldr
description: |
  คู่มือคำสั่งแบบย่อพร้อมตัวอย่างใช้งานจริงจากโปรเจกต์ tldr-pages
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd, curl หรือ tldr client ใด ๆ
  ใช้เมื่อเจอคำว่า "tldr", "cheatsheet", "command help", "examples", "how to"

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

คู่มือคำสั่งแบบย่อพร้อมตัวอย่างจากโลกจริง เหมาะกว่า man page มากสำหรับคำถามว่า "ใช้คำสั่งนี้ยังไง"

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x tldr git                    # ตัวอย่างการใช้งาน git
x tldr --lang zh python       # เอกสารภาษาจีน
x tldr --fz                   # ค้นหาแบบโต้ตอบ

# ไม่ใช้ x-cmd — ใช้ curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# หรือติดตั้ง tldr client
pip install tldr
npm install -g tldr
tldr tar
```

## มีอะไรให้ใช้บ้าง

- `x tldr <cmd>` — แสดงตัวอย่างของคำสั่ง
- `x tldr --lang zh <cmd>` — ภาษาจีน
- `x tldr --fz` — ค้นหาแบบโต้ตอบด้วย fzf
- `x tldr --cat <cmd>` — แสดง markdown ดิบ
- `x tldr --ls` — แสดงคำสั่งที่ใช้ได้ทั้งหมด
- `x tldr --update` — อัปเดตแคชหน้าเอกสาร

## ทางเลือกแบบใช้ลำพัง

- ออนไลน์: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- หน้าเอกสารดิบ: github.com/tldr-pages/tldr

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบคำสั่งที่พบบ่อย
- หมายเหตุเฉพาะแต่ละแพลตฟอร์ม
- การเชื่อมโยงกับเวิร์กโฟลว์ของ agent

## ที่เกี่ยวข้อง

- [git](../git/SKILL.md) — tldr ของคำสั่งย่อย git ที่ใช้บ่อย
- [install](../install/SKILL.md) — tldr ของคำสั่งย่อย install