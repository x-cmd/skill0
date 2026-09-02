---
name: ccal
description: |
  中国地区日历，含 调休、农历、节气、生肖、黄历吉凶、干支纪年。
  多种访问方式：`x ccal`、直接下载归档、或 tsv。

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 —— 即周末可能"借"出来凑成工作日休息，或当节假日落在周末时回补一个工作日 —— 是中国用户围绕官方工作日历安排计划时的关键特性。

## `x ccal` 快速上手

```bash
# 以 tsv 形式显示所有日期信息。TSV 列含义如下：
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态：休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# 以 tsv 形式显示所有日期信息
x ccal ls 2026-07
# 特定日期的 YAML
x ccal info 2026-05-31
# 获取数据目录。若为空，尝试 `x ccal update`
x ccal datadir
```

`x ccal -h` 查看更多信息。

注意：数据源为 https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

为节省空间，`x ccal` 通过 tar 命令直接浏览 tar.xz 而不解压。我们鼓励这种做法，但如果需要更自由的处理，你可以按需解压。