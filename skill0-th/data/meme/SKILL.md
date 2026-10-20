---
name: meme
description: |
  สร้างภาพมีมโดยการซ้อนข้อความลงบนเทมเพลต
  ไม่มีอุปสรรค ใช้ Python + Pillow ได้ ไม่ต้องมีเฟรมเวิร์กใด ๆ
  เทมเพลตจะถูกดึงจาก data repo ชื่อ awesome-meme เมื่อต้องใช้
  ใช้เมื่อเจอคำว่า "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro"

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

สร้างภาพมีม มีเทมเพลตกว่า 30 แบบ ไม่มีอุปสรรค

AI agent อ่านไฟล์นี้แล้วก็รู้วิธีสร้างมีม ไม่ต้องใช้ x-cmd

## เริ่มใช้งาน

```bash
# ติดตั้ง dependency
pip install pillow pyyaml

# สร้างมีม (ดาวน์โหลดเทมเพลตจาก GitHub ให้อัตโนมัติ)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## ตัวอย่างเพิ่มเติม

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## ตัวเลือก

| ตัวเลือก | ค่าที่ใช้ได้ | ค่าเริ่มต้น | คำอธิบาย |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | โมเดลการเรนเดอร์ |
| `--layout` | chest-label, above-head, bottom-label | (ค่าเริ่มต้นของสเปก) | ตำแหน่งวางข้อความแบบสำเร็จรูป |
| `--output` | เส้นทางไฟล์ | meme_output.jpg | เส้นทางไฟล์ผลลัพธ์ |

## การเลือกฟอนต์

- ภาษาอังกฤษ / ละติน — Impact (ค่าเริ่มต้น)
- จีน / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- ผสมกัน — ตรวจจับแยกกันในแต่ละช่องโดยอัตโนมัติ

Impact ไม่มีอักขระ CJK — ข้อความภาษาจีนจะมองไม่เห็น ตัวเรนเดอร์จะตรวจจับ CJK แล้วถอยไปใช้ฟอนต์ของระบบแทน บน Linux: `apt install fonts-noto-cjk`

## shell เปล่า (ไม่ใช้ Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## อัปเกรดด้วย x-cmd

ถ้าคุณติดตั้ง x-cmd ไว้แล้ว:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

ได้ผลเหมือนกัน แต่เชื่อมต่อกับระบบนิเวศของ x-cmd ได้สะอาดกว่า

## แหล่งข้อมูล

เทมเพลตอยู่ใน [awesome-meme](https://github.com/edwinjhlee/awesome-meme) ตัวเรนเดอร์จะดึงสเปกและรูปภาพจาก GitHub เมื่อต้องการ

## เอกสาร

- [references/INSTALL.md](references/INSTALL.md) — dependency (Pillow, ImageMagick, ฟอนต์)
- [references/PILLOW.md](references/PILLOW.md) — รายละเอียดของโมเดล Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — รายละเอียดของโมเดล ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — แนวทางการใช้งานสำหรับ AI agent

## ที่เกี่ยวข้อง

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser สามารถเรนเดอร์และส่งออกภาพมีมได้