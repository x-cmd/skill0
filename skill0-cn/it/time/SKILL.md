---
name: time
description: |
  命令执行计时 —— 微秒精度、统计分析、对比。
  零门槛 —— 配合 x-cmd 或 shell 内建 time 命令使用。
  适用于 "timing"、"benchmark"、"performance"、"profiling"。

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

测量命令执行时间。从单次微秒计时到多轮统计分析。

## 快速上手

```bash
# 用 x-cmd
x time <command>                      # 单次微秒计时
x time stress -c 100 <command>        # 100 次统计
x time cmp 'cmd1' 'cmd2' 'cmd3'      # 对比命令

# 不用 x-cmd —— 用 shell 内建
time <command>                        # 基础计时
# 基准测试用循环：
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## 可用命令

- `x time <cmd>` — 单次运行，微秒精度
- `x time getms <cmd>` — 毫秒精度
- `x time stress -c N <cmd>` — N 次运行完整统计
- `x time stress -b N <cmd>` — 在预算内自动决定运行次数
- `x time cmp 'c1' 'c2'` — 对比多个命令

## 输出格式

- `--csv` 程序化分析的 CSV
- `--tsv` Tab 分隔
- `--yml` YAML

## 本 skill0 还在成长

从基础开始，将补充：
- 基准测试模式
- 统计解读指南
- 常见性能反模式

## Related