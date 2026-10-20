---
name: ip
description: |
  Utilidades de direcciones IP — geolocalización, barrido de subredes, descubrimiento de puertos.
  Sin barreras — úsalo con x-cmd o curl + herramientas de red estándar.
  Úsalo para "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Consulta de direcciones IP, geolocalización, descubrimiento de subredes y barrido de puertos.

## Inicio rápido

```bash
# Con x-cmd
x ip                        # Listar todas las IP locales
x ip geolite 8.8.8.8        # Consulta de geolocalización
x ip info 192.168.1.0       # Clasificación de la IP
x ip map 192.168.1.0/24     # Descubrir hosts activos
x ip tps localhost           # Barrido de puertos

# Sin x-cmd — usa curl para la geolocalización
curl -s "https://ipinfo.io/8.8.8.8/json"
# Usa herramientas estándar para las IP locales
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Qué hay disponible

- `x ip ls` — Listar todas las direcciones IP locales
- `x ip geolite <ip>` — Geolocalización vía ipinfo.io
- `x ip info <ip>` — Clasificación de clase/tipo de IP
- `x ip cidr <cidr>` — Información de rango CIDR
- `x ip map <subnet>` — Barrido de ping ICMP
- `x ip tps <host>` — Barrido de puertos TCP

## Alternativas autónomas

- Geolocalización: `curl https://ipinfo.io/<IP>/json`
- IP locales: `ifconfig`, `ip addr`, `hostname -I`
- Barrido de puertos: `nc -zv`, `nmap`

## Esta skill0 crece

Empezando por lo esencial. Se añadirá:
- Patrones comunes de red
- Referencia de la API de ipinfo.io
- Fórmulas de cálculo de subredes

## Relacionadas

