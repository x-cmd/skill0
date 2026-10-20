---
name: ip
description: |
  Tiện ích địa chỉ IP — định vị địa lý, quét subnet, dò cổng.
  Không rào cản — dùng với x-cmd hoặc curl + các công cụ mạng tiêu chuẩn.
  Dùng cho "ip", "geolocation", "subnet", "port scan", "network".

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

Tra cứu địa chỉ IP, định vị địa lý, khám phá subnet và quét cổng.

## Bắt đầu nhanh

```bash
# Với x-cmd
x ip                        # Liệt kê toàn bộ IP cục bộ
x ip geolite 8.8.8.8        # Tra cứu địa lý
x ip info 192.168.1.0       # Phân loại IP
x ip map 192.168.1.0/24     # Tìm các host đang hoạt động
x ip tps localhost           # Quét cổng

# Không dùng x-cmd — dùng curl để định vị địa lý
curl -s "https://ipinfo.io/8.8.8.8/json"
# Dùng công cụ tiêu chuẩn để lấy IP cục bộ
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## Có sẵn những gì

- `x ip ls` — Liệt kê toàn bộ địa chỉ IP cục bộ
- `x ip geolite <ip>` — Định vị địa lý qua ipinfo.io
- `x ip info <ip>` — Phân loại lớp/loại IP
- `x ip cidr <cidr>` — Thông tin dải CIDR
- `x ip map <subnet>` — Quét ICMP ping
- `x ip tps <host>` — Quét cổng TCP

## Lựa chọn thay thế độc lập

- Định vị địa lý: `curl https://ipinfo.io/<IP>/json`
- IP cục bộ: `ifconfig`, `ip addr`, `hostname -I`
- Quét cổng: `nc -zv`, `nmap`

## skill0 này sẽ tiếp tục phát triển

Bắt đầu với những thứ cơ bản nhất. Sẽ bổ sung thêm:
- Các mẫu thao tác mạng phổ biến
- Tài liệu API của ipinfo.io
- Công thức tính subnet

## Liên quan