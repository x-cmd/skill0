---
name: cve
description: |
  ค้นหาข้อมูล CVE ผ่าน x cve — แคชไว้ ไม่ต้องใช้ API key จัดเก็บเป็น TSV บีบอัด xz รายวัน
  โหลดเมื่อเจอคำว่า cve, vulnerability id, kev, epss, nvd, cvelist หรือ security advisory

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

เป็น TSV บีบอัด xz แยกตามปี ปีปัจจุบันและปีก่อนหน้าจะรีเฟรชอัตโนมัติ (TTL 1 ชั่วโมง) ส่วนปีที่เก่ากว่าจะถูกตรึงไว้ 180 วัน หลังใช้งานออนไลน์ครั้งแรกแล้ว `x cve` ใช้งานแบบออฟไลน์ได้ไปเรื่อย ๆ

## เริ่มใช้งานด้วย `x cve`

```bash
x cve info CVE-2024-0001      # ค้นด้วย id (รูปย่อ: x cve 2024-0001)
x cve year 2024               # สตรีมแยกตามปี เป็น TSV ที่ต่อท่อได้
x cve detail CVE-2024-0001    # ข้อมูลต้นทางฉบับเต็ม (ผลิตภัณฑ์ CWE ลิงก์อ้างอิง ADP)
```

`x cve -h` ดูธงทั้งหมด คำสั่งย่อย และรูปแบบย่อได้

## ข้อมูลและเครื่องมือที่เกี่ยวข้อง

มีการเผยแพร่ TSV บีบอัด xz รายวันที่ `github.com/x-cmd/cve/releases/download/data/` (โครงสร้างข้อมูลมีอธิบายในรายการ release) ข้อมูลที่แคชไว้เป็นเพียงภาพฉายบางส่วน — สำหรับคำถามที่ต้องข้ามไปอีกชั้นหนึ่ง:

- `x shodan cve CVE-X` — คะแนน EPSS, การเป็นสมาชิก KEV, บทความเกี่ยวกับช่องโหว่ที่ถูกโจมตี, คำเตือนจากผู้ผลิต
- `x kev ls` — แคตตาล็อก KEV ของ CISA (รายการช่องโหว่ที่ถูกโจมตีจริงแล้ว แบบตารางเต็ม)
- `x osv` — ค้นระดับเวอร์ชันของแต่ละแพ็กเกจ ("เวอร์ชันของฉันเสี่ยงไหม") รับทั้ง id แบบ `osv-*` และ `cve-*`
- `x cve detail` — JSON ดิบจาก `CVEProject/cvelistV5` (แหล่งทางการต้นทาง ดึงเมื่อร้องขอ)