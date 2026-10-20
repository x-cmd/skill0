---
name: time
description: |
  コマンド実行の計測 —— マイクロ秒精度、統計分析、比較。
  ゼロバリア —— x-cmd か shell 内蔵の time コマンドで使う。
  "timing"、"benchmark"、"performance"、"profiling" に適用。

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

コマンドの実行時間を測る。単発のマイクロ秒計測から、複数回実行の統計分析まで。

## クイックスタート

```bash
# x-cmd を使う
x time <command>                      # 単発のマイクロ秒計測
x time stress -c 100 <command>        # 100 回実行の統計
x time cmp 'cmd1' 'cmd2' 'cmd3'      # コマンドを比較

# x-cmd なし —— shell 内蔵を使う
time <command>                        # 基本的な計測
# ベンチマークはループで行う:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## 使えるコマンド

- `x time <cmd>` — 単発実行、マイクロ秒精度
- `x time getms <cmd>` — ミリ秒精度
- `x time stress -c N <cmd>` — N 回実行して完全な統計を取る
- `x time stress -b N <cmd>` — 所定予算内で実行回数を自動決定
- `x time cmp 'c1' 'c2'` — 複数のコマンドを比較

## 出力フォーマット

- `--csv` プログラム解析用の CSV
- `--tsv` タブ区切り
- `--yml` YAML

## この skill0 は成長中

まず最低限から。追加予定:
- ベンチマークのパターン
- 統計の読み方のガイド
- よくある性能のアンチパターン

## Related

