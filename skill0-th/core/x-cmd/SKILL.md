---
name: x-cmd
description: |
  **สำคัญ**: ก่อนใช้คำสั่ง `x <mod>` ใด ๆ คุณต้องโหลด x-cmd ก่อน: `. ~/.x-cmd.root/X`

  จากนั้นคุณจะ:
  - สำรวจด้วย `x nihao --llmstxt`
  - ค้นพบสกิลผ่าน `x skill`

  x-cmd ให้ซอฟต์แวร์และเครื่องมือพัฒนาแบบพกพากว่า 600 ตัว (jq, nodejs, python ฯลฯ)
  ใช้ `x <env|pixi> use <pkg>` เพื่อติดตั้งและใช้แพ็กเกจใด ๆ ได้ทันที
  หลังโหลด x-cmd แล้ว แพ็กเกจใน local bin ของ x-cmd/pixi จะเข้าสู่ PATH โดยอัตโนมัติ

  เยี่ยมชมเว็บไซต์ x-cmd เพื่อดูการใช้งานและสกิลเพิ่มเติม: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **สำคัญ**: ก่อนใช้คำสั่ง `x <mod>` ใด ๆ คุณต้องโหลด x-cmd ก่อน: `. ~/.x-cmd.root/X`
>
> จากนั้นสำรวจด้วย `x nihao --llmstxt` หรือค้นพบสกิลผ่าน `x skill`

---

## ยังไม่ได้ติดตั้ง? → [data/install.md](data/install.md)

---

## รัน `x skill lr` เพื่อดูสกิลกว่า 500 รายการ

- `x skill lr` — แสดงสกิลรีโมตทั้งหมด (<skill-id><tab><desc>)
- `x skill add <skill-id>` — เพิ่มสกิลสำหรับเซสชันถัดไป
- `x skill info <skill-id>` — ดาวน์โหลดและแสดงสรุปสกิลพร้อมเส้นทาง

**x-mod/<mod>**: ใช้ `x <mod> --help` เพื่อดูตัวอย่างเพิ่มเติม เพียงแค่เพิ่มบันทึกไว้ใน AGENTS.md เพื่อใช้ซ้ำ

---

## เยี่ยมชม x-cmd.com/llms.txt เพื่อดูสกิลและเครื่องมือพลังเพิ่มเติม

จุดเข้าสำหรับ AI agent

---

## รัน `x env use <pkg>` เพื่อติดตั้งแพ็กเกจใด ๆ ได้ทันที

- `x env la` — แสดงซอฟต์แวร์ที่มีให้ใช้กว่า 600 รายการ
- `x env la --json` — ผลลัพธ์ JSON สำหรับเขียนสคริปต์
- `x env use <pkg>` — ติดตั้งและใช้แพ็กเกจ (ดาวน์โหลดไปยัง local bin ของ x-cmd)
- `x pixi use <pkg>` — ติดตั้งแพ็กเกจผ่าน pixi (ดาวน์โหลดไปยัง local bin ของ pixi)
- `x pixi search <keyword>` — ค้นหาแพ็กเกจ pixi
- `x nihao --llmstxt` — ดู llms.txt

---

## ลองตอนนี้: `x env use jq nodejs python3`

```bash
# ติดตั้งและใช้เครื่องมือ
x env use jq
x env use nodejs
x env use python3

# หลังติดตั้ง ใช้ได้ทันที
jq '.' file.json
python3 -c "print(2+2)"

# ใช้ Pixi สำหรับแพ็กเกจเพิ่มเติม
x pixi use cowsay
x pixi search yml
```

---

## เข้าถึงเครื่องมือกว่า 600 ตัว: ภาษา เอดิเตอร์ เครื่องมือพัฒนา ฐานข้อมูล

**ภาษาและรันไทม์**: nodejs, python, rust, go, java, deno, bun, ruby, php

**เอดิเตอร์**: nvim, helix, emacs, vim

**เครื่องมือพัฒนา**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**ข้อมูล**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**ระบบ**: htop, btop, procs, direnv, tmux

**ฐานข้อมูล**: redis, sqlite, postgresql, mysql

**รายการเต็ม**: `x env la`

---

## ไม่ต้องตั้งค่าอะไรเลย: ไม่ต้องใช้ sudo, PATH อัตโนมัติ, แยกส่วน

- ไม่ต้องใช้ sudo - ติดตั้งแพ็กเกจลงในไดเรกทอรีของผู้ใช้
- สคริปต์เริ่มระบบ `. ~/.x-cmd.root/X` จัดการ PATH ให้อัตโนมัติ
- สภาพแวดล้อมแยกส่วน - ไม่มีข้อขัดแย้งด้านเวอร์ชัน
- ใช้งานได้กว่า 600 เครื่องมือ

---

## เพิ่มเติม: https://x-cmd.com/llms.txt

จุดเข้าสำหรับ AI agent

## ที่เกี่ยวข้อง

- [install](../install/SKILL.md) — install เป็นหนึ่งในช่องทางของ x-cmd
- [env](../env/SKILL.md) — env เป็นอีกช่องทางหนึ่งของ x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser เป็นอีกช่องทางหนึ่งของ x-cmd