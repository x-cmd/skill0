---
name: wikipedia
description: |
  ค้นหาและอ่านวิกิพีเดียย์ผ่าน x wkp — ใช้ MediaWiki API ไม่ต้องมี API key
  ติดตั้งเป็นศูนย์ รวมการค้นหา การดึงข้อความ การแนะนำคำ และเส้นทางผ่าน DDG ไว้ในโมดูลเดียว
  โหลดเมื่อเจอคำว่า wiki, wikipedia, encyclopedia lookup หรือการสรุปเนื้อหาบทความ

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

ผลลัพธ์คือข้อความดิบ (~ย่อหน้าแรก + infobox) คำสั่งย่อยจะกำหนดรูปแบบ — `hop` สำหรับค้นหาแล้วสรุป, `extract` สำหรับชื่อหน้าที่รู้แล้ว, `search` สำหรับหาตัวเลือก, `suggest` สำหรับคำที่พิมพ์ผิด เว็บไซต์เริ่มต้นคือวิกิพีเดียย์ภาษาอังกฤษ ใช้ `--lang` / `--api-url` เพื่อสลับไปยัง wiki อื่น

## เริ่มใช้งานด้วย `x wkp`

```bash
x wkp hop Python                      # ค้นหาและดึงผลลัพธ์แรกในคำสั่งเดียว
x wkp extract OpenAI                  # สรุปของหน้าที่รู้ชื่อแล้ว
x wkp search "Linux kernel"           # แสดงตัวเลือกเมื่อยังไม่แน่ใจเรื่องชื่อหน้า
x wkp suggest pythen                  # คำที่พิมพ์ผิด: เตือนคำแนะนำแก้ก่อนค้นหา
```

`x wkp -h` ดูธงและคำสั่งย่อยทั้งหมด

## ข้อมูลและเครื่องมือที่เกี่ยวข้อง

ต้นทาง: `https://en.wikipedia.org/w/api.php` — MediaWiki action API โครงการพี่น้อง (Wikidata, Wiktionary, Commons) เข้าถึงได้ในทำนองเดียวกัน เพียงชี้ `--api-url` ไปยัง subdomain ที่ต้องการ

สำหรับคำถามที่ต้องข้ามไปอีกชั้นเมื่อไปกว่าสรุป wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — โมดูล `x wkp` เดิม แต่เดินเส้นทางผ่านดัชนีวิกิพีเดียย์ของ DuckDuckGo (จัดการคำค้นที่กำกวมหรือเป็นภาษาพูดได้ดีกว่าการค้นด้วยชื่อหน้า)
- `x ddgo <query>` — ค้นหาเว็บทั่วไป มีประโยชน์เมื่อวิกิพีเดียย์ไม่มีบทความ แต่หัวข้อนั้นมีอยู่บนเว็บสาธารณะ
- ดูสกิล [knowledge](../knowledge/SKILL.md) สำหรับชุดเครื่องมือวิจัยที่กว้างกว่าอย่าง `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — ถอยไปใช้เบราว์เซอร์เมื่อคุณต้องการหน้าที่เรนเดอร์จริงจริง (infobox, ตาราง, รูปภาพ)