---
source: lib/skill0/it/time/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: time
description: |
  命令執行計時 —— 微秒精度、統計分析、對比。
  零門檻 —— 配合 x-cmd 或 shell 內建 time 命令使用。
  適用於 "timing"、"benchmark"、"performance"、"profiling"。

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

測量命令執行時間。從單次微秒計時到多輪統計分析。

## 快速上手

```bash
# 用 x-cmd
x time <command>                      # 單次微秒計時
x time stress -c 100 <command>        # 100 次統計
x time cmp 'cmd1' 'cmd2' 'cmd3'      # 對比命令

# 不用 x-cmd —— 用 shell 內建
time <command>                        # 基礎計時
# 基準測試用循環：
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## 可用命令

- `x time <cmd>` — 單次運行，微秒精度
- `x time getms <cmd>` — 毫秒精度
- `x time stress -c N <cmd>` — N 次運行完整統計
- `x time stress -b N <cmd>` — 在預算內自動決定運行次數
- `x time cmp 'c1' 'c2'` — 對比多個命令

## 輸出格式

- `--csv` 程序化分析的 CSV
- `--tsv` Tab 分隔
- `--yml` YAML

## 本 skill0 還在成長

從基礎開始，將補充：
- 基準測試模式
- 統計解讀指南
- 常見性能反模式

## Related