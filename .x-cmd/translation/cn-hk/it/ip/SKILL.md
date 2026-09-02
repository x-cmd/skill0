---
source: lib/skill0/it/ip/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: ip
description: |
  IP 地址工具 —— 地理定位、子網掃描、端口發現。
  零門檻 —— 用 x-cmd 或 curl + 標準網絡工具即可。
  適用於 "ip"、"geolocation"、"subnet"、"port scan"、"network"。

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP 地址查詢、地理定位、子網發現與端口掃描。

## 快速上手

```bash
# 用 x-cmd
x ip                        # 列出所有本地 IP
x ip geolite 8.8.8.8        # 地理定位查詢
x ip info 192.168.1.0       # IP 分類
x ip map 192.168.1.0/24     # 發現活動主機
x ip tps localhost           # 端口掃描

# 不用 x-cmd —— 用 curl 做地理定位
curl -s "https://ipinfo.io/8.8.8.8/json"
# 用標準工具看本地 IP
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## 可用命令

- `x ip ls` — 列出所有本地 IP 地址
- `x ip geolite <ip>` — 通過 ipinfo.io 做地理定位
- `x ip info <ip>` — IP class / type 分類
- `x ip cidr <cidr>` — CIDR 範圍信息
- `x ip map <subnet>` — ICMP ping sweep
- `x ip tps <host>` — TCP 端口掃描

## 獨立替代方案

- 地理定位：`curl https://ipinfo.io/<IP>/json`
- 本地 IP：`ifconfig`、`ip addr`、`hostname -I`
- 端口掃描：`nc -zv`、`nmap`

## 本 skill0 還在成長

從基礎開始，將補充：
- 常用網絡模式
- ipinfo.io API 參考
- 子網計算公式

## Related