---
name: ip
description: |
  Utilitaires d'adresse IP — géolocalisation, scan de sous-réseau, découverte de ports.
  Zéro barrière — à utiliser avec x-cmd ou curl + outils réseau standard.
  À utiliser pour « ip », « geolocation », « subnet », « port scan », « network ».

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Recherche d'adresse IP, géolocalisation, découverte de sous-réseau, et scan de ports.

## Démarrage rapide

```bash
# Avec x-cmd
x ip                        # Lister toutes les IPs locales
x ip geolite 8.8.8.8        # Lookup de géolocalisation
x ip info 192.168.1.0       # Classification d'IP
x ip map 192.168.1.0/24     # Découvrir les hôtes actifs
x ip tps localhost           # Scan de ports

# Sans x-cmd — utilisez curl pour la géolocalisation
curl -s "https://ipinfo.io/8.8.8.8/json"
# Utilisez les outils standard pour les IPs locales
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Ce qui est disponible

- `x ip ls` — Lister toutes les adresses IP locales
- `x ip geolite <ip>` — Géolocalisation via ipinfo.io
- `x ip info <ip>` — Classification de classe/type d'IP
- `x ip cidr <cidr>` — Infos sur plage CIDR
- `x ip map <subnet>` — Ping sweep ICMP
- `x ip tps <host>` — Scan de ports TCP

## Alternatives standalone

- Géolocalisation : `curl https://ipinfo.io/<IP>/json`
- IPs locales : `ifconfig`, `ip addr`, `hostname -I`
- Scan de ports : `nc -zv`, `nmap`

## Ce skill0 grandit

Commence avec l'essentiel. Ajoutera :
- Motifs réseau courants
- Référence API pour ipinfo.io
- Formules de calcul de sous-réseau

## Related

