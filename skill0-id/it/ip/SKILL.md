---
name: ip
description: |
  Utilitas alamat IP — geolokasi, pemindaian subnet, penemuan port.
  Tanpa hambatan — pakai dengan x-cmd atau curl + tool jaringan standar.
  Gunakan untuk "ip", "geolokasi", "subnet", "pindai port", "jaringan".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Pencarian alamat IP, geolokasi, penemuan subnet, dan pemindaian port.

## Mulai Cepat

```bash
# Dengan x-cmd
x ip                        # Tampilkan semua IP lokal
x ip geolite 8.8.8.8        # Pencarian geolokasi
x ip info 192.168.1.0       # Klasifikasi IP
x ip map 192.168.1.0/24     # Temukan host aktif
x ip tps localhost           # Pindai port

# Tanpa x-cmd — pakai curl untuk geolokasi
curl -s "https://ipinfo.io/8.8.8.8/json"
# Pakai tool standar untuk IP lokal
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Yang Tersedia

- `x ip ls` — Tampilkan semua alamat IP lokal
- `x ip geolite <ip>` — Geolokasi via ipinfo.io
- `x ip info <ip>` — Klasifikasi kelas/tipe IP
- `x ip cidr <cidr>` — Informasi rentang CIDR
- `x ip map <subnet>` — Sapuan ping ICMP
- `x ip tps <host>` — Pindai port TCP

## Alternatif Mandiri

- Geolokasi: `curl https://ipinfo.io/<IP>/json`
- IP lokal: `ifconfig`, `ip addr`, `hostname -I`
- Pindai port: `nc -zv`, `nmap`

## skill0 Ini Berkembang

Mulai dari yang paling dasar. Akan ditambahkan:
- Pola jaringan yang umum
- Referensi API untuk ipinfo.io
- Rumus perhitungan subnet

## Terkait