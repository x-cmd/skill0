---
name: ip
description: |
  เครื่องมือที่อยู่ IP — ตำแหน่งทางภูมิศาสตร์ การสแกนซับเน็ต และการค้นหาพอร์ต
  ไม่มีอุปสรรค ใช้ได้ทั้งกับ x-cmd หรือ curl + เครื่องมือเครือข่ายมาตรฐาน
  ใช้เมื่อเจอคำว่า "ip", "geolocation", "subnet", "port scan", "network"

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

ค้นหาที่อยู่ IP ตำแหน่งทางภูมิศาสตร์ ค้นพบซับเน็ต และสแกนพอร์ต

## เริ่มใช้งาน

```bash
# ใช้ร่วมกับ x-cmd
x ip                        # แสดง IP ในเครื่องทั้งหมด
x ip geolite 8.8.8.8        # ค้นหาตำแหน่งทางภูมิศาสตร์
x ip info 192.168.1.0       # จำแนกประเภทที่อยู่ IP
x ip map 192.168.1.0/24     # ค้นพบเครื่องที่เปิดอยู่
x ip tps localhost           # สแกนพอร์ต

# ไม่ใช้ x-cmd — ใช้ curl หาตำแหน่งทางภูมิศาสตร์
curl -s "https://ipinfo.io/8.8.8.8/json"
# ใช้เครื่องมือมาตรฐานหา IP ในเครื่อง
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## มีอะไรให้ใช้บ้าง

- `x ip ls` — แสดงที่อยู่ IP ในเครื่องทั้งหมด
- `x ip geolite <ip>` — ตำแหน่งทางภูมิศาสตร์ผ่าน ipinfo.io
- `x ip info <ip>` — จำแนกคลาส/ประเภทของที่อยู่ IP
- `x ip cidr <cidr>` — ข้อมูลช่วง CIDR
- `x ip map <subnet>` — สแกนแบบ ICMP ping sweep
- `x ip tps <host>` — สแกนพอร์ต TCP

## ทางเลือกแบบใช้ลำพัง

- ตำแหน่งทางภูมิศาสตร์: `curl https://ipinfo.io/<IP>/json`
- IP ในเครื่อง: `ifconfig`, `ip addr`, `hostname -I`
- สแกนพอร์ต: `nc -zv`, `nmap`

## skill0 นี้จะเติบโตขึ้น

เริ่มจากสิ่งจำเป็นเท่านั้น จะเพิ่ม:
- รูปแบบเครือข่ายที่พบบ่อย
- คู่มือ API ของ ipinfo.io
- สูตรคำนวณซับเน็ต

## ที่เกี่ยวข้อง