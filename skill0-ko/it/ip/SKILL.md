---
name: ip
description: |
  IP 주소 유틸리티 — 지오로케이션, 서브넷 스캔, 포트 발견.
  진입 장벽 없음 — x-cmd 또는 curl + 표준 네트워킹 도구로 사용.
  "ip", "geolocation", "subnet", "port scan", "network"에 활용.

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP 주소 조회, 지오로케이션, 서브넷 발견, 포트 스캔.

## 빠른 시작

```bash
# x-cmd 사용
x ip                        # 모든 로컬 IP 나열
x ip geolite 8.8.8.8        # 지오로케이션 조회
x ip info 192.168.1.0       # IP 분류
x ip map 192.168.1.0/24     # 활성 호스트 발견
x ip tps localhost           # 포트 스캔

# x-cmd 없이 — 지오로케이션은 curl 사용
curl -s "https://ipinfo.io/8.8.8.8/json"
# 로컬 IP는 표준 도구 사용
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## 사용 가능 명령

- `x ip ls` — 모든 로컬 IP 주소 나열
- `x ip geolite <ip>` — ipinfo.io로 지오로케이션
- `x ip info <ip>` — IP class/type 분류
- `x ip cidr <cidr>` — CIDR 범위 정보
- `x ip map <subnet>` — ICMP ping 스윕
- `x ip tps <host>` — TCP 포트 스캔

## 단독 대안

- 지오로케이션: `curl https://ipinfo.io/<IP>/json`
- 로컬 IP: `ifconfig`, `ip addr`, `hostname -I`
- 포트 스캔: `nc -zv`, `nmap`

## 이 skill0는 성장 중

핵심부터 시작합니다. 앞으로 추가될 내용:
- 자주 쓰는 네트워킹 패턴
- ipinfo.io API 레퍼런스
- 서브넷 계산 공식

## Related

