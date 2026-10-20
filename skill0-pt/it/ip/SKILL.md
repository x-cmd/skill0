---
name: ip
description: |
  Utilitários de endereço IP — geolocalização, varredura de subrede, descoberta de portas.
  Zero barreira — use com x-cmd ou com curl + ferramentas de rede padrão.
  Use para "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Consulta de endereços IP, geolocalização, descoberta de subredes e varredura de portas.

## Início rápido

```bash
# Com x-cmd
x ip                        # Lista todos os IPs locais
x ip geolite 8.8.8.8        # Consulta de geolocalização
x ip info 192.168.1.0       # Classificação do IP
x ip map 192.168.1.0/24     # Descobre hosts ativos
x ip tps localhost           # Varredura de portas

# Sem x-cmd — use curl para geolocalização
curl -s "https://ipinfo.io/8.8.8.8/json"
# Use ferramentas padrão para os IPs locais
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## O que está disponível

- `x ip ls` — Lista todos os endereços IP locais
- `x ip geolite <ip>` — Geolocalização via ipinfo.io
- `x ip info <ip>` — Classificação de classe/tipo do IP
- `x ip cidr <cidr>` — Informações de faixa CIDR
- `x ip map <subnet>` — Varredura de ping ICMP
- `x ip tps <host>` — Varredura de portas TCP

## Alternativas avulsas

- Geolocalização: `curl https://ipinfo.io/<IP>/json`
- IPs locais: `ifconfig`, `ip addr`, `hostname -I`
- Varredura de portas: `nc -zv`, `nmap`

## Este skill0 cresce

Começando pelo essencial. Vamos adicionar:
- Padrões comuns de rede
- Referência da API do ipinfo.io
- Fórmulas de cálculo de subrede

## Relacionados