---
name: knowledge
description: |
  ค้นหา Hacker News, Wikipedia, DuckDuckGo เอกสาร RFC และ Stack Exchange จากบรรทัดคำสั่ง
  ไม่มีอุปสรรค ติดตั้ง x-cmd แล้วเริ่มค้นหาได้ทันที
  ใช้เมื่อเจอคำว่า "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow"

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

ค้นหาแหล่งความรู้บนอินเทอร์เน็ตจากบรรทัดคำสั่ง

## เริ่มใช้งาน

```bash
# ติดตั้ง x-cmd
eval "$(curl https://get.x-cmd.com)"

# โพสต์ยอดนิยมบน Hacker News
x hn top

# ค้นหาบน Wikipedia
x wkp "artificial intelligence"

# ค้นหาบน DuckDuckGo
x ddgo "rust programming language"

# เอกสาร RFC
x rfc 2616

# ค้นหาบน Stack Exchange
x se "how to exit vim"
```

## มีอะไรให้ใช้บ้าง

| คำสั่ง | แหล่งข้อมูล | ตัวอย่าง |
|---------|--------|---------|
| `x hn top` | Hacker News | 10 โพสต์ที่กำลังมาแรง |
| `x hn new` | Hacker News | การส่งล่าสุด |
| `x wkp <query>` | Wikipedia | ค้นหาบทความ |
| `x ddgo <query>` | DuckDuckGo | ค้นหาเว็บ |
| `x rfc <number>` | เอกสาร RFC | อ่านข้อกำหนด RFC |
| `x se <query>` | Stack Exchange | ค้นหาคำถาม-คำตอบ |

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- แหล่งข้อมูลเพิ่มเติม (Project Gutenberg, arxiv)
- รูปแบบการค้นหาขั้นสูง
- เคล็ดลับการกรองและจัดรูปแบบผลลัพธ์

## ได้ประสบการณ์เต็มรูปแบบ

หลังติดตั้ง x-cmd แล้ว ใช้ `x knowledge --help` เพื่อดูตัวเลือกทั้งหมด

## ที่เกี่ยวข้อง