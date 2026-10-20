---
name: ip
description: |
  IP-Adress-Werkzeuge — Geolokalisierung, Subnetz-Scan, Port-Entdeckung.
  Null Hürde — mit x-cmd oder curl + Standard-Netzwerkwerkzeugen verwenden.
  Für "ip", "Geolokalisierung", "Subnetz", "Port-Scan", "Netzwerk".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP-Adressen nachschlagen, Geolokalisierung, Subnetz-Entdeckung und Port-Scanning.

## Schnellstart

```bash
# Mit x-cmd
x ip                        # Alle lokalen IPs auflisten
x ip geolite 8.8.8.8        # Geolokalisierung
x ip info 192.168.1.0       # IP-Klassifikation
x ip map 192.168.1.0/24     # Aktive Hosts entdecken
x ip tps localhost           # Port-Scan

# Ohne x-cmd — curl für Geolokalisierung verwenden
curl -s "https://ipinfo.io/8.8.8.8/json"
# Standardwerkzeuge für lokale IPs verwenden
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Was verfügbar ist

- `x ip ls` — alle lokalen IP-Adressen auflisten
- `x ip geolite <ip>` — Geolokalisierung über ipinfo.io
- `x ip info <ip>` — IP-Klasse/-Typ klassifizieren
- `x ip cidr <cidr>` — CIDR-Bereichs-Info
- `x ip map <subnet>` — ICMP-Ping-Sweep
- `x ip tps <host>` — TCP-Port-Scan

## Eigenständige Alternativen

- Geolokalisierung: `curl https://ipinfo.io/<IP>/json`
- Lokale IPs: `ifconfig`, `ip addr`, `hostname -I`
- Port-Scan: `nc -zv`, `nmap`

## Dieses skill0 wächst

Startet mit dem Wesentlichen. Hinzu kommen:
- Häufige Netzwerkmuster
- API-Referenz für ipinfo.io
- Formeln zur Subnetzberechnung

## Verwandt
