---
name: ip
description: |
  IP 地址工具 —— 地理定位、子网扫描、端口发现。
  零门槛 —— 用 x-cmd 或 curl + 标准网络工具即可。
  适用于 "ip"、"geolocation"、"subnet"、"port scan"、"network"。

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP 地址查询、地理定位、子网发现与端口扫描。

## 快速上手

```bash
# 用 x-cmd
x ip                        # 列出所有本地 IP
x ip geolite 8.8.8.8        # 地理定位查询
x ip info 192.168.1.0       # IP 分类
x ip map 192.168.1.0/24     # 发现活动主机
x ip tps localhost           # 端口扫描

# 不用 x-cmd —— 用 curl 做地理定位
curl -s "https://ipinfo.io/8.8.8.8/json"
# 用标准工具看本地 IP
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## 可用命令

- `x ip ls` — 列出所有本地 IP 地址
- `x ip geolite <ip>` — 通过 ipinfo.io 做地理定位
- `x ip info <ip>` — IP class / type 分类
- `x ip cidr <cidr>` — CIDR 范围信息
- `x ip map <subnet>` — ICMP ping sweep
- `x ip tps <host>` — TCP 端口扫描

## 独立替代方案

- 地理定位：`curl https://ipinfo.io/<IP>/json`
- 本地 IP：`ifconfig`、`ip addr`、`hostname -I`
- 端口扫描：`nc -zv`、`nmap`

## 本 skill0 还在成长

从基础开始，将补充：
- 常用网络模式
- ipinfo.io API 参考
- 子网计算公式

## Related