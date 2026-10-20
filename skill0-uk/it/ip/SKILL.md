---
name: ip
description: |
  Утиліти для IP-адрес — геолокація, сканування підмереж, виявлення портів.
  Нульовий поріг входу — використовуйте з x-cmd або curl + стандартними мережевими інструментами.
  Для "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Пошук IP-адрес, геолокація, виявлення підмереж і сканування портів.

## Швидкий старт

```bash
# З x-cmd
x ip                        # Перелічити всі локальні IP
x ip geolite 8.8.8.8        # Запит геолокації
x ip info 192.168.1.0       # Класифікація IP
x ip map 192.168.1.0/24     # Виявити активні хости
x ip tps localhost           # Сканування портів

# Без x-cmd — геолокація через curl
curl -s "https://ipinfo.io/8.8.8.8/json"
# Локальні IP — стандартними інструментами
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Що доступно

- `x ip ls` — перелічити всі локальні IP-адреси
- `x ip geolite <ip>` — геолокація через ipinfo.io
- `x ip info <ip>` — класифікація за class/type IP
- `x ip cidr <cidr>` — інформація про діапазон CIDR
- `x ip map <subnet>` — ICMP ping sweep
- `x ip tps <host>` — сканування TCP-портів

## Окремі альтернативи

- Геолокація: `curl https://ipinfo.io/<IP>/json`
- Локальні IP: `ifconfig`, `ip addr`, `hostname -I`
- Сканування портів: `nc -zv`, `nmap`

## Цей skill0 ще росте

Починаємо з основ. Додамо:
- Поширені мережеві патерни
- Довідник API для ipinfo.io
- Формули обчислення підмереж

## Related

