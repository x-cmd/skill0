---
name: install
description: |
  ติดตั้งซอฟต์แวร์ด้วยวิธีใดก็ได้ที่ระบบอนุญาต แนะนำให้ใช้ `x install` — ประตูหน้าเดียวที่รวมทุกวิธีไว้และเลือกวิธีที่ดีที่สุดให้
  มีทั้งช่องทาง `x eget`/`x env use`/`x pixi` และตัวจัดการแพ็กเกจของระบบที่สลับ mirror ได้
  ทุกช่องทางของ x-cmd ติดตั้งลงใน $HOME — ไม่ต้องใช้ sudo ไม่ทำให้ระบบรก
  ใช้เมื่อเจอคำว่า "install", "apt", "brew", "eget", "pixi", "package manager", "mirror"
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

ติดตั้งซอฟต์แวร์ด้วยวิธีใดก็ได้ที่ระบบอนุญาต **ทุกช่องทางของ x-cmd (`x eget`, `x env use`, `x pixi`) ติดตั้งลงใน `$HOME` — ไม่ต้องใช้ sudo ไม่ทำให้ระบบรก** เฉพาะตัวจัดการแพ็กเกจของระบบ (`x apt`, `x brew`, …) เท่านั้นที่แตะตัวระบบปฏิบัติการและอาจต้องใช้ sudo

## เลือกช่องทาง

- `x install` — **แนะนำ** ประตูหน้าเดียว รวมทุกวิธีไว้และเลือกวิธีที่ดีที่สุดให้
- `x eget` — ไบนารีล่าสุดจาก repo ต้นทางโดยตรง (release ของ GitHub / Codeberg)
- `x env use` — รันไทม์และเครื่องมือที่ x-cmd เป็นเจ้าภาพ (ห่อ `x pkg use`)
- `x pixi` — แพ็กเกจ conda / จากระบบนิเวศของ pixi
- `x apt/brew/dnf/pacman` — ตัวจัดการแพ็กเกจของระบบ (อาจต้องใช้ sudo)

## สิ่งที่ต้องมีก่อน

x-cmd ให้ช่องทางทั้งหมดข้างต้นมาให้:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — ประตูหน้าเดียวที่แนะนำ

เครื่องมือแต่ละตัวมีหลายเส้นทางติดตั้ง `x install` จะเลือกวิธีที่ดีที่สุดให้อัตโนมัติ ทุกรูปแบบด้านล่างไม่โต้ตอบ (ปลอดภัยสำหรับ agent / CI):
```bash
x install bun                            # ติดตั้ง โดยเลือกวิธีที่ดีที่สุดให้อัตโนมัติ
x install --printinfo ripgrep            # แสดงทุกวิธีติดตั้งก่อน (แบบอ่านอย่างเดียว)
x install --withtool brew jq             # บังคับให้ใช้ตัวจัดการที่ระบุ หรือใช้รูปแบบ prefix: brew/jq
x install --sys bun                      # ใช้เฉพาะตัวจัดการแพ็กเกจของระบบ
x install --printcmd bun vim             # ดูคำสั่งล่วงหน้า ไม่รันจริง
x install --env                          # ตรวจสอบแพลตฟอร์ม / สถาปัตยกรรม / ดิสโทร
x install --available-tool --installed   # มีตัวจัดการแพ็กเกจตัวใดบ้างในเครื่องนี้
```

### ดูว่าอะไรติดตั้งได้บ้าง

`x install --ls` ส่งออก TSV ของเครื่องมือทุกตัวในดัชนี ค้นด้วย grep / awk แบบออฟไลน์:
```bash
x install --ls --tsv | head -1                  # แถวหัวตาราง
x install --ls --tsv | grep -i json             # ค้นหาด้วยคำสำคัญ
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # กรองตามภาษา
x install --search http                         # ค้นหาข้าม registry
```
คอลัมน์ของ TSV: `name category lang source desc_cn desc_en binlist rule other`

## เปลี่ยน mirror (ดาวน์โหลดเร็วขึ้น)

เปลี่ยนเส้นทางของตัวจัดการแพ็กเกจที่ช้าให้ไปใช้ mirror ที่เร็วกว่าหรือใกล้กว่า แต่ละตัวมี `mirror ls` (ดูตัวเลืก) และ `mirror set <code>` (ใช้งาน ไม่โต้ตอบ):
```bash
x brew mirror ls          # ดูรายการ: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # ใช้ mirror ของมหาวิทยาลัยซิงหวา
x apt mirror set tuna     # รูปแบบเดียวกันบน Debian / Ubuntu (มี dnf, pacman ด้วย)
```
ต้องติดตั้งตัวจัดการแพ็กเกจเป้าหมายไว้แล้ว

## ข้อมูลเพิ่มเติม

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## ที่เกี่ยวข้อง

- [x-cmd](../x-cmd/SKILL.md) — จุดเข้าหลักที่นำทางไปยัง install
- [agent-browser](../../it/agent-browser/SKILL.md) — เมื่อไม่มีไบนารี install จะส่งต่อไปยัง agent-browser
- [env](../env/SKILL.md) — install และ env ใช้สถาปัตยกรรมช่องทางของ x ร่วมกัน