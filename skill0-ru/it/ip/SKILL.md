---
name: ip
description: |
  Утилиты для IP-адресов — геолокация, сканирование подсетей, обнаружение портов.
  Нулевой порог входа — используйте с x-cmd или curl и стандартными сетевыми инструментами.
  Применяйте для «ip», «geolocation», «subnet», «port scan», «network».

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Поиск по IP-адресам, геолокация, обнаружение подсетей и сканирование портов.

## Быстрый старт

```bash
# С x-cmd
x ip                        # Список всех локальных IP
x ip geolite 8.8.8.8        # Запрос геолокации
x ip info 192.168.1.0       # Классификация IP
x ip map 192.168.1.0/24     # Обнаружение активных хостов
x ip tps localhost           # Сканирование портов

# Без x-cmd — curl для геолокации
curl -s "https://ipinfo.io/8.8.8.8/json"
# Стандартные инструменты для локальных IP
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Что доступно

- `x ip ls` — Список всех локальных IP-адресов
- `x ip geolite <ip>` — Геолокация через ipinfo.io
- `x ip info <ip>` — Классификация IP по классу/типу
- `x ip cidr <cidr>` — Информация о диапазоне CIDR
- `x ip map <subnet>` — ICMP ping sweep
- `x ip tps <host>` — TCP-сканирование портов

## Автономные альтернативы

- Геолокация: `curl https://ipinfo.io/<IP>/json`
- Локальные IP: `ifconfig`, `ip addr`, `hostname -I`
- Сканирование портов: `nc -zv`, `nmap`

## Этот skill0 растёт

Начинаем с основ. Будет добавлено:
- Частые сетевые шаблоны
- Справка по API ipinfo.io
- Формулы расчёта подсетей

## Связанное

