---
name: cve
description: |
  x cve で CVE レコードを引く — キャッシュ済み、API キー不要、日次 xz TSV。
  cve、vulnerability id、kev、epss、nvd、cvelist、security advisory のいずれかでロード。

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

年単位の xz 圧縮 TSV。当年と前年は自動更新（1 時間 TTL）、それ以前の年は 180 日間凍結されます。最初のオンライン日以降、`x cve` は無制限にオフライン動作します。

## `x cve` クイックスタート

```bash
x cve info CVE-2024-0001      # ID 検索（短縮形：x cve 2024-0001）
x cve year 2024               # 年単位のストリーム、パイプしやすい TSV
x cve detail CVE-2024-0001    # 完全な上流レコード（products, CWE, refs, ADP）
```

`x cve -h` で全フラグ・サブコマンド・短縮形を確認できます。

## データと関連ツール

日次 xz TSV を `github.com/x-cmd/cve/releases/download/data/` で公開（スキーマはリリースに記載）。キャッシュ済みレコードは薄い射影です。その一歩先を行く質問には：

- `x shodan cve CVE-X` — EPSS スコア、KEV メンバーシップ、exploit 記事、ベンダーアドバイザリ
- `x kev ls` — CISA KEV カタログ（既知の悪用リスト、全表）
- `x osv` — パッケージバージョン単位のクエリ（"自分のバージョンは脆弱？"）；`osv-*` と `cve-*` の ID を受け付け
- `x cve detail` — 生の `CVEProject/cvelistV5` JSON（正規の上流、必要時に取得）
