---
name: repo
description: ข้อตกลงและเครื่องมือว่า repo ที่ agent โคลนไว้อยู่ที่ไหน และ worktree ของมันจัดวางอย่างไร ค่าเริ่มต้นคือ bare repo ที่ `~/.x-repo/.bare/<provider>/<owner>/<name>.git` พร้อม working tree ที่ลิงก์ไว้ใต้ `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` ค้นพบได้ด้วย `x repo ls` จัดการ worktree ด้วย `x repo wt` ใช้เมื่อถามว่า "โคลนไว้ที่ไหน" "เส้นทาง git clone" "โครงสร้าง workspace" "repo ที่แชร์กันระหว่าง agent" "เส้นทาง worktree"
metadata:
  related: "git"
---

# repo

## ทำไมต้องเป็นแบบนี้

ทุก clone มาชนที่ `~/.x-repo/<provider>/<owner>/<name>` เส้นทางเดียวกันสำหรับทุก agent ทุกคน และ CI — เมานต์เข้า container หรือ sandbox ของ agent ได้ จึงแชร์กันได้โดยไม่ต้องโคลนใหม่ มีรากเดียวให้สำรองข้อมูล ค้นพบได้ด้วย `x repo ls` โครงสร้างเลียนแบบเส้นทางของ github ดังนั้น `../<sibling>` จาก worktree ใดก็ตามจะชี้ไปที่ worktree ค่าเริ่มต้นของ sibling นั้นได้ — คอนฟิกและสคริปต์ที่อ้างถึง sibling จึงทำงานได้เหมือนกันทั้งใน wt และข้าม agent

## โครงสร้างเส้นทาง

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- worktree ค่าเริ่มต้น: `~/.x-repo/<provider>/<owner>/<name>`
- worktree ที่ออกแบบไว้: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname คือตัวระบุใด ๆ ของ workspace นี้ เช่น ชื่อ agent/worker ชื่อ branch แท็ก SHA สั้น ๆ id ของ issue หรือข้อความอิสระ ๆ ตัว `/` ใน wtname จะถูกเข้ารหัสเป็น `~`

โดยค่าเริ่มต้น repo จะเป็นแบบ bare พร้อม worktree ที่ลิงก์ไว้ — ตัว bare อยู่ใน `.bare/` ซึ่งแยกออกจาก worktree เป็นคนละไดเรกทอรี การ `rm -rf` worktree ตัวหนึ่งจึงไม่ไปถึงมัน การใช้ `git clone` ธรรมดาก็ยอมรับได้ (`x repo ls/which/update` จะเห็นมัน) แต่จะไม่มีการป้องกันเชิงเรขาคณิต กรณีนี้ต้องระวังเป็นพิเศษ: อย่า `rm -rf` ให้ใช้ `git worktree remove` แทน และเลี่ยงการกวาดที่ยิงไปที่ `.git/` เพราะงานที่ทำค้างอยู่ในช่วงนั้นจะกู้คืนความสัมพันธ์กับ repo เดิมไม่ได้

## คำสั่ง

```bash
x repo <id>                      # cd ไปที่ worktree ค่าเริ่มต้น (โคลนให้อัตโนมัติถ้ายังไม่มี)
x repo wt <id> <wtname>          # ผูกกับ branch ที่มีอยู่ หรือสร้างใหม่จาก HEAD
x repo wt ls <id>                # แสดงรายการ worktree
x repo wt rm <id> <wtname>       # ลบอย่างปลอดภัย (ใช้อันนี้ ไม่ใช่ rm -rf)
x repo update <id>               # รีเฟรช worktree ค่าเริ่มต้นหลังอัปสตรีม
x repo ls [--raw|--tsv]          # ดูว่ามีอะไร clone ไว้บ้าง
x repo which <id>[@<wtname>]     # แปลง id เป็นเส้นทางสัมบูรณ์
```

## อย่า

- อย่า `rm -rf` worktree ที่ออกแบบไว้ มันจะทิ้งรายการค้างไว้ในรีจิสทรี `worktrees/` ของ bare ให้ใช้ `x repo wt rm` แทน ถ้าจำเป็นต้องทำเอง ให้รัน `git -C <bare> worktree prune` ต่อทีหลัง

## ที่เกี่ยวข้อง

- [doc/path-layout.md](doc/path-layout.md) — ไวยากรณ์เส้นทางแบบเต็มและการตั้งชื่อ worktree
- [doc/workflow.md](doc/workflow.md) — ขั้นตอนการทำงานและหลักการ "เก็บทิ้งแบบไม่ลบ"
- [doc/design.md](doc/design.md) — เหตุผลที่โครงสร้างนี้ถูกวางแบบมาแบบนี้