---
name: ccal
description: |
  中國地區日曆，含 調休、農曆、節氣、生肖、黃曆吉凶、干支紀年。
  多種訪問方式：`x ccal`、直接下載歸檔、或 tsv。

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

調休 —— 即週末可能"借"出來湊成工作日休息，或當節假日落在週末時回補一個工作日 —— 是中國用户圍繞官方工作日曆安排計劃時的關鍵特性。

## `x ccal` 快速上手

```bash
# 以 tsv 形式顯示所有日期信息。TSV 列含義如下：
# Date   LunarDate   建除   WeekDay(周幾)   Jieqi(節氣)   Xiuxi(三個狀態：休，工，無-非調休導致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# 以 tsv 形式顯示所有日期信息
x ccal ls 2026-07
# 特定日期的 YAML
x ccal info 2026-05-31
# 獲取數據目錄。若為空，嘗試 `x ccal update`
x ccal datadir
```

`x ccal -h` 查看更多信息。

注意：數據源為 https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

為節省空間，`x ccal` 通過 tar 命令直接瀏覽 tar.xz 而不解壓。我們鼓勵這種做法，但如果需要更自由的處理，你可以按需解壓。