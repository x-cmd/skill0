---
name: ip
description: |
  IP adresi araçları — coğrafi konum, alt ağ taraması, port keşfi.
  Sıfır engel — x-cmd ya da curl + standart ağ araçlarıyla kullan.
  "ip", "geolocation", "subnet", "port scan", "network" için kullan.

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP adresi araması, coğrafi konum, alt ağ keşfi ve port taraması.

## Hızlı Başlangıç

```bash
# x-cmd ile
x ip                        # Tüm yerel IP'leri listele
x ip geolite 8.8.8.8        # Coğrafi konum sorgusu
x ip info 192.168.1.0       # IP sınıflandırması
x ip map 192.168.1.0/24     # Etkin ana bilgisayarları keşfet
x ip tps localhost           # Port taraması

# x-cmd'siz — coğrafi konum için curl
curl -s "https://ipinfo.io/8.8.8.8/json"
# Yerel IP'ler için standart araçlar
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Neler Var

- `x ip ls` — Tüm yerel IP adreslerini listele
- `x ip geolite <ip>` — ipinfo.io üzerinden coğrafi konum
- `x ip info <ip>` — IP sınıfı/türü sınıflandırması
- `x ip cidr <cidr>` — CIDR aralık bilgisi
- `x ip map <alt ağ>` — ICMP ping taraması
- `x ip tps <host>` — TCP port taraması

## Bağımsız Alternatifler

- Coğrafi konum: `curl https://ipinfo.io/<IP>/json`
- Yerel IP'ler: `ifconfig`, `ip addr`, `hostname -I`
- Port taraması: `nc -zv`, `nmap`

## Bu skill0 büyüyor

Temel olanlarla başlıyor. Eklenecekler:
- Yaygın ağ kalıpları
- ipinfo.io API referansı
- Alt ağ hesaplama formülleri

## İlgili