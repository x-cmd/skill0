---
name: ip
description: |
  Utilità per gli indirizzi IP — geolocalizzazione, scansione di sottoreti, scoperta delle porte.
  Zero barriere — usala con x-cmd oppure con curl e gli strumenti di rete standard.
  Usala per "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Ricerca di indirizzi IP, geolocalizzazione, scoperta di sottoreti e scansione delle porte.

## Guida rapida

```bash
# Con x-cmd
x ip                        # Elenca tutti gli IP locali
x ip geolite 8.8.8.8        # Ricerca di geolocalizzazione
x ip info 192.168.1.0       # Classificazione dell'IP
x ip map 192.168.1.0/24     # Scopri gli host attivi
x ip tps localhost           # Scansione delle porte

# Senza x-cmd — usa curl per la geolocalizzazione
curl -s "https://ipinfo.io/8.8.8.8/json"
# Usa gli strumenti standard per gli IP locali
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Cosa c'è a disposizione

- `x ip ls` — Elenca tutti gli indirizzi IP locali
- `x ip geolite <ip>` — Geolocalizzazione via ipinfo.io
- `x ip info <ip>` — Classificazione della classe/tipo di IP
- `x ip cidr <cidr>` — Informazioni sull'intervallo CIDR
- `x ip map <subnet>` — Scansione ping ICMP
- `x ip tps <host>` — Scansione delle porte TCP

## Alternative standalone

- Geolocalizzazione: `curl https://ipinfo.io/<IP>/json`
- IP locali: `ifconfig`, `ip addr`, `hostname -I`
- Scansione porte: `nc -zv`, `nmap`

## Questo skill0 cresce

Si parte dall'essenziale. Aggiungeremo:
- Schemi di rete comuni
- Riferimento API per ipinfo.io
- Formule per il calcolo delle sottoreti

## Related