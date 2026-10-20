---
name: ip
description: |
  Nástroje pro IP adresy — geolokace, skenování podsítí, objevování portů.
  Bez jakýchkoli překážek — použijte s x-cmd nebo curl + standardními síťovými nástroji.
  Použijte pro "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Vyhledávání IP adres, geolokace, objevování podsítí a skenování portů.

## Rýchlý start

```bash
# S x-cmd
x ip                        # Vypíše všechny místní IP
x ip geolite 8.8.8.8        # Dotaz na geolokaci
x ip info 192.168.1.0       # Klasifikace IP
x ip map 192.168.1.0/24     # Objeví aktivní hosty
x ip tps localhost           # Sken portů

# Bez x-cmd — použijte curl pro geolokaci
curl -s "https://ipinfo.io/8.8.8.8/json"
# Pro místní IP použijte standardní nástroje
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Co je k dispozici

- `x ip ls` — Vypíše všechny místní IP adresy
- `x ip geolite <ip>` — Geolokace přes ipinfo.io
- `x ip info <ip>` — Klasifikace třídy/typu IP
- `x ip cidr <cidr>` — Informace o rozsahu CIDR
- `x ip map <subnet>` — ICMP ping sweep
- `x ip tps <host>` — Sken TCP portů

## Samostatné alternativy

- Geolokace: `curl https://ipinfo.io/<IP>/json`
- Místní IP: `ifconfig`, `ip addr`, `hostname -I`
- Sken portů: `nc -zv`, `nmap`

## Tento skill0 poroste

Začínáme základními věcmi. Bude přidáno:
- Běžné síťové vzory
- Referenční příručka API pro ipinfo.io
- Vzorce pro výpočet podsítí

## Související
