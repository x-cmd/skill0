---
name: agent-browser
description: ระบบอัตโนมัติเบราว์เซอร์ผ่าน Chrome/Chromium CDP — เปิด ถ่ายภาพหน้าจอ คลิก จับภาพหน้าจอ เหมาะกับการทดสอบเว็บแอป เลย์เอาต์มือถือ และการโต้ตอบอัตโนมัติ โดยไม่ต้องใช้ Playwright/Puppeteer
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## การติดตั้ง

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # ไม่บังคับ ข้ามไปได้ถ้าใช้ Chrome ที่มีอยู่แล้ว
```

## เชื่อมต่อกับ Chrome ที่เปิดอยู่แล้ว

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## โปรไฟล์และหลายเซสชัน

ใช้ `--profile /tmp/ab-default` เพื่อยืนยันตัวตนครั้งเดียวแล้วใช้ร่วมกันข้ามเซสชัน
ทุกครั้งที่ใช้ `--user-data-dir` ค่าใหม่ Chrome จะขอยืนยันตัวตนใหม่ — ใช้ค่าเริ่มต้นซ้ำเพื่อเลี่ยง

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

ชื่อเซสชันเป็นแบบทั่วโลก — ใช้รูปแบบ `<project>-<device>` เพื่อเลี่ยงการชนกันระหว่าง agent
เซสชันต่าง ๆ ใช้ daemon ร่วมกัน แต่แยกขาดจากกันอย่างสมบูรณ์ (คุกกี้ แคช แท็บ)

## สกิลและคำสั่งที่ใช้บ่อย

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

ข้อมูลจะสะสมเพิ่มขึ้น — ดู [CLEANUP.md](CLEANUP.md) สำหรับการทำความสะอาดเป็นระยะ

## ที่เกี่ยวข้อง

- [install](../install/SKILL.md) — ติดตั้ง/เปิดใช้งานผ่านช่องทางของ x install
- [devloop](../devloop/SKILL.md) — ใช้ใน devloop เพื่อตรวจสอบภาพก่อน-หลัง
- [lovable](../../life/lovable/SKILL.md) — lovable ใช้ agent-browser ในการตรวจสอบเว็บ