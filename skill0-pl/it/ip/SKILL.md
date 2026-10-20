---
name: ip
description: |
  Narzędzia do adresów IP — geolokalizacja, skanowanie podsieci, wykrywanie portów.
  Bez barier — użyj z x-cmd albo curl + standardowymi narzędziami sieciowymi.
  Użyj dla "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Wyszukiwanie adresów IP, geolokalizacja, odkrywanie podsieci i skanowanie portów.

## Szybki start

```bash
# Z x-cmd
x ip                        # Wypisz wszystkie lokalne IP
x ip geolite 8.8.8.8        # Zapytanie o geolokalizację
x ip info 192.168.1.0       # Klasyfikacja IP
x ip map 192.168.1.0/24     # Odkryj aktywne hosty
x ip tps localhost           # Skan portów

# Bez x-cmd — użyj curl do geolokalizacji
curl -s "https://ipinfo.io/8.8.8.8/json"
# Użyj standardowych narzędzi do lokalnych IP
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Co jest dostępne

- `x ip ls` — wypisz wszystkie lokalne adresy IP
- `x ip geolite <ip>` — geolokalizacja przez ipinfo.io
- `x ip info <ip>` — klasyfikacja klasy/typu IP
- `x ip cidr <cidr>` — informacje o zakresie CIDR
- `x ip map <subnet>` — skan ICMP ping
- `x ip tps <host>` — skan portów TCP

## Alternatywy samodzielne

- Geolokalizacja: `curl https://ipinfo.io/<IP>/json`
- Lokalne IP: `ifconfig`, `ip addr`, `hostname -I`
- Skan portów: `nc -zv`, `nmap`

## Ta umiejętność skill0 rośnie

Zaczyna od podstaw. Planowane dodatki:
- Typowe wzorce sieciowe
- Referencja API ipinfo.io
- Wzory do obliczania podsieci

## Powiązane