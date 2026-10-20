---
name: ip
description: |
  IP アドレスのユーティリティ —— ジオロケーション、サブネットスキャン、ポート探索。
  ゼロバリア —— x-cmd か curl + 標準のネットワークツールで使う。
  "ip"、"geolocation"、"subnet"、"port scan"、"network" に適用。

metadata:
  version: "0.1.0"
  category: "networking"
  tags: "ip,geolocation,network,subnet,port-scan,cidr"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# ip — skill0

IP アドレスの検索、ジオロケーション、サブネット探索、ポートスキャン。

## クイックスタート

```bash
# x-cmd を使う
x ip                        # ローカルの IP をすべて表示
x ip geolite 8.8.8.8        # ジオロケーション検索
x ip info 192.168.1.0       # IP の分類
x ip map 192.168.1.0/24     # 稼働中のホストを探索
x ip tps localhost           # ポートスキャン

# x-cmd なし —— ジオロケーションは curl で
curl -s "https://ipinfo.io/8.8.8.8/json"
# ローカル IP は標準ツールで
ifconfig | grep "inet "     # macOS
ip addr show                # Linux
```

## 使えるコマンド

- `x ip ls` — ローカルの IP アドレスをすべて表示
- `x ip geolite <ip>` — ipinfo.io 経由のジオロケーション
- `x ip info <ip>` — IP のクラス / タイプ分類
- `x ip cidr <cidr>` — CIDR 範囲の情報
- `x ip map <subnet>` — ICMP ping スィープ
- `x ip tps <host>` — TCP ポートスキャン

## 単体で使うときの代替手段

- ジオロケーション: `curl https://ipinfo.io/<IP>/json`
- ローカル IP: `ifconfig`、`ip addr`、`hostname -I`
- ポートスキャン: `nc -zv`、`nmap`

## この skill0 は成長中

まず最低限から。追加予定:
- よく使うネットワークパターン
- ipinfo.io の API リファレンス
- サブネット計算の公式

## Related

