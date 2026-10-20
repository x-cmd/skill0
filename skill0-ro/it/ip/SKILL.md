---
name: ip
description: |
  Utilitare pentru adrese IP — geolocalizare, scanare de subrețea, descoperirea porturilor.
  Fără bariere — folosește cu x-cmd sau curl + uneltele standard de rețea.
  Folosește pentru "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Căutare de adrese IP, geolocalizare, descoperire de subrețele și scanare de porturi.

## Quick Start

```bash
# With x-cmd
x ip                        # List all local IPs
x ip geolite 8.8.8.8        # Geolocation lookup
x ip info 192.168.1.0       # IP classification
x ip map 192.168.1.0/24     # Discover active hosts
x ip tps localhost           # Port scan

# Without x-cmd — use curl for geolocation
curl -s "https://ipinfo.io/8.8.8.8/json"
# Use standard tools for local IPs
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Ce e disponibil

- `x ip ls` — Listează toate adresele IP locale
- `x ip geolite <ip>` — Geolocalizare prin ipinfo.io
- `x ip info <ip>` — Clasificarea clasei/tipului IP
- `x ip cidr <cidr>` — Informații despre intervalul CIDR
- `x ip map <subnet>` — Sweep de ping ICMP
- `x ip tps <host>` — Scanare de porturi TCP

## Alternative standalone

- Geolocalizare: `curl https://ipinfo.io/<IP>/json`
- IP-uri locale: `ifconfig`, `ip addr`, `hostname -I`
- Scanare de porturi: `nc -zv`, `nmap`

## Acest skill0 crește

Pornim de la esențial. Vom adăuga:
- Tipare uzuale de rețea
- Referință API pentru ipinfo.io
- Formule de calcul pentru subrețele

## Related