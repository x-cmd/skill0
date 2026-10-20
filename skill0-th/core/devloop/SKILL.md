---
name: devloop
description: วงจรการพัฒนาแบบขับเคลื่อนด้วยเป้าหมาย — กำหนดวัตถุประสงค์ เขียนกฎพร้อมผลลัพธ์หลัก ตรวจสอบด้วยภาพ และซิงก์ไปยังตัวติดตาม issue
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## ตั้งค่า

```
x rule init :ror                          # หรือชุดกฎเฉพาะโปรเจกต์
x env use agent-browser                   # สำหรับการตรวจสอบด้วยภาพ
```

## เวิร์กโฟลว์

```
เป้าหมาย → rule.yml → โค้ด → ตรวจสอบ → issue
```

### 1. กำหนดเป้าหมาย → เขียน rule.yml

ก่อนเขียนโค้ด ให้สร้าง rule.yml สำหรับงานนี้:

```yaml
goal: "แก้ไขเวอร์ชันภาษาอังกฤษที่แสดงแท็กภาษาจีนในส่วน Features"
keyresults:
  - kr-1: "แท็กในส่วน Features ของโหมดภาษาอังกฤษเป็นภาษาอังกฤษทั้งหมด"
  - kr-2: "แท็กในส่วน Features ของโหมดภาษาจีนยังคงเป็นภาษาจีน"
  - kr-3: "การ build ผ่านโดยไม่มี regression"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - เมื่อ language=en ทุกรายการใน details[] ต้องเป็นภาษาอังกฤษ
    - ในโหมดภาษาอังกฤษ ป้ายแท็กใด ๆ ต้องไม่มีอักษรจีน
```

ฟิลด์ของ rule: `id`, `name`, `apply`, `level`, `desc`, `tldr` ดู `x rule -h`

**ต้อง** มี `goal` และ `keyresults` — สองฟิลด์บังคับของทุกงานพัฒนา

### 2. ลงมือทำ → ตรวจสอบด้วยภาพ (ส่วนหน้าเว็บ)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... แก้ไขโค้ด ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**ต้อง** จับภาพหน้าจอก่อนและหลัง เทียบกับสิ่งที่ตั้งใจ:
1. ตรวจด้วยการมองเห็นของ AI: after.png ตรงกับเป้าหมายไหม
2. ถ้าไม่ตรง → ทำซ้ำและจับภาพใหม่
3. **ลบข้อมูลส่วนตัวทั้งหมด** (token อีเมล ข้อมูลส่วนบุคคล) ก่อนอัปโหลด

### 3. ตรวจสอบด้วย x rule

```
x rule scan <ไฟล์>     # เร็ว (~1 นาที) เหมาะกับวงจรภายใน
x rule check <ไฟล์>    # ละเอียด (~10 นาที)
x rule audit <ไฟล์>    # รายงานเต็มรูปแบบ (~30 นาที)
```

### 4. ซิงก์ไปยังตัวติดตาม issue

ดู [issue/SKILL.md](../issue/SKILL.md) ขั้นต่ำคือ โพสต์เป้าหมาย ผลลัพธ์หลัก rule.yml และภาพก่อน-หลัง ลงใน issue

## เครื่องมือสำหรับ agent

- `x rule scan` — ตรวจสอบเร็วระหว่างทำงาน
- `x rule check` — ตรวจสอบเต็มรูปแบบก่อน commit
- `agent-browser screenshot` — หลักฐานภาพก่อน-หลัง
- `gh issue create/comment` — ซิงก์เป้าหมาย + rule.yml ไปยังตัวติดตาม

## ที่เกี่ยวข้อง

- [rule](../rule/SKILL.md) — rule.yml คือโครงร่างของการตรวจสอบ
- [score](../score/SKILL.md) — การให้คะแนน KR ใช้กรอบของ score
- [install](../install/SKILL.md) — ตั้งค่าสภาพแวดล้อมการพัฒนา
- [agent-browser](../../it/agent-browser/SKILL.md) — การตรวจสอบด้วยภาพก่อน-หลัง
- [issue](../issue/SKILL.md) — ซิงก์เป้าหมาย + KR + ภาพหน้าจอไปยังตัวติดตาม issue
- [repo](../repo/SKILL.md) — ดึงและส่งงานเข้า-ออกใน repo
- [prompt](../prompt/SKILL.md) — ข้อตกลงด้าน prompt มักเป็นตัวขับเคลื่อนงานของ devloop