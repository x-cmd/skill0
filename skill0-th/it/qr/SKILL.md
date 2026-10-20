---
name: qr
description: |
  การสร้างคิวอาร์โค้ด — แสดงบนเทอร์มินัล ส่งออกเป็น PNG และเข้ารหัสด้วย shell เปล่า ๆ
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd, Python qrcode หรือไลบรารี QR ใด ๆ
  ใช้เมื่อเจอคำว่า "qr", "qrcode", "barcode", "encode"

metadata:
  version: "0.1.0"
  category: "encoding"
  tags: "qr,qrcode,barcode,encode,terminal"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# qr — skill0

สร้างคิวอาร์โค้ดจากข้อความหรือ URL ได้ทั้งแบบแสดงบนเทอร์มินัล ส่งออกเป็น PNG หรือเข้ารหัสด้วย shell เปล่า ๆ

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x qr "Hello World"                   # คิวอาร์โค้ดบนเทอร์มินัล
x qr "https://example.com"           # แปลง URL เป็นคิวอาร์โค้ด

# ไม่ใช้ x-cmd — ใช้ Python
pip install qrcode
python3 -c "import qrcode; qrcode.make('Hello').save('qr.png')"

# หรือใช้ API ออนไลน์
curl -s "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=Hello" -o qr.png
```

## มีอะไรให้ใช้บ้าง

- เทอร์มินัล — แสดงคิวอาร์โค้ดในเทอร์มินัล
- PNG — สร้างไฟล์ PNG
- shell เปล่า — เข้ารหัสด้วย AWK (ไม่ต้องมี dependency)

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- อัลกอริทึมการเข้ารหัสคิวอาร์
- ระดับการแก้ไขข้อผิดพลาด
- รูปแบบคิวอาร์สำหรับ WiFi

## ที่เกี่ยวข้อง