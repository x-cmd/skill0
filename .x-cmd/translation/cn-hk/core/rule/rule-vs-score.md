---
source: lib/skill0/core/rule/rule-vs-score.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Rule vs Score

為不同問題設計的兩個互補框架。

| | Rule | Score |
|---|---|---|
| **目的** | 找出問題 —— 保證最低質量 | 評估質量 —— 選出最優選項 |
| **類比** | 質量門 / 檢查清單 | 排名 / 排行榜 |
| **輸出** | 每條 rule 的 pass / fail | 加權總分 + 排名 |
| **典型對象** | 單個對象（一個文件、一個 repo、一個系統） | 多個候選（3+ 個待比較替代） |
| **之後動作** | 修復違規 | 做決策 |
| **回答的問題** | "這夠好了嗎？" | "哪個最好？" |
| **硬過濾** | Rule `level: error` = 必須通過 | TSV `block` 列 = 失格，排名 X |

## 打分如何工作

**Score**：按 factor 加權，100 分制。

```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```

每個維度有一個 0–10 分與一個 factor（1–10，基線=2）。維度表頭顯示權重 %。factor 起放大作用 —— factor=8 的維度權重是 factor=2 的 4 倍。公式自動歸一化。

**Rule**：按 rule 計數。無加權、無聚合。

一個對象對照 N 條 rule → N 個獨立結果。每條 rule 自己給出 0–100 分 —— 100 = 通過，低於 100 = 違規。你不取平均。若 10 條中有 3 條失敗，你有 3 個問題要修。

```
pass_count = 分數 = 100 的 rule 數
fail_count = 分數 < 100 的 rule 數
```

## 典型場景

### Rule 場景 —— "這裏有問題嗎？"

| 域 | rule 示例 | 檢查內容 |
|--------|-------------|----------------|
| 代碼質量 | `no-console-log` | 生產代碼不得有 `console.log` |
| 文檔 | `doc-orphan-010` | 每個 .md 必須從某 SKILL.md 引用過來 |
| 配置安全 | `no-hardcoded-secrets` | 提交的文件中不得有 API key 或密碼 |
| 結構 | `rule-struct-010` | 每條 rule.yml 必須有 `desc` 字段 |
| 命名 | `file-naming-convention` | 文件必須遵循命名模式 |
| Git 衞生 | `no-merge-commit-to-main` | main 分支只接受 squash/rebase |

問題永遠是："這個對象違反 rule 嗎？"答案永遠是："是（分數 < 100，這裏是違規）" 或 "否（分數 = 100）"。

### Score 場景 —— "我該選哪個？"

| 域 | template 示例 | 選擇的對比項 |
|--------|-----------------|------------------------------|
| 技術 | `tech-stack` | 新服務的 Python vs Go vs Rust |
| 生活 | `house` | 上週末看的 3 套公寓 |
| 職業 | `job` | 手頭的 2 個 offer |
| 消費 | `car` | SUV vs 轎車 vs 電動車 |
| 植物 | `plant-cat` | 對貓安全的 12 種植物 |
| 寵物 | `pet-office` | 辦公室養什麼寵物 |
| 禮物 | `gift` | 給女朋友生日買什麼 |
| 旅行 | `travel` | 下個假期去哪裏 |

問題永遠是："在這些候選中，哪個最好？"答案永遠是帶分數的排序 —— 用户可能不同意並想調整 factor。

### 組合場景 —— 先 rule 再 score

一些決策同時需要兩者：

1. **Rule** 淘汰不可行候選（"這植物有毒 → 出局"）
2. **Score** 給倖存者排名（"在安全的植物裏，最容易養又最好看的是？"）

其他示例：
- 求職：rule 過濾掉不辦簽證 sponsorship 的公司 → score 按薪資、成長、文化排名
- 公寓：rule 過濾掉超預算 / 不讓養寵的樓 → score 按通勤、空間、社區排名
- 庫選型：rule 過濾掉無人維護的庫 → score 按 API 設計、性能、社區排名

## 但邊界是軟的

- rule 可檢查多個文件。score 也可評估單個候選。
- 區分在於 **意圖**，不是對象數量。
- 問題是"這過嗎？" → rule。
- 問題是"這有多好，與替代比？" → score。

## 用哪個

**用 rule 當：**
- 你有清晰的 pass/fail 判據（字段必須存在，值必須在範圍內）
- 你要在整個代碼庫強制標準
- 違規是可操作的 —— 你知道要修什麼
- 例："每條 .rule.yml 必須有 `desc` 字段"

**用 score 當：**
- 你在比較候選項並需要決策
- 判據是偏好，不是絕對（權衡）
- 答案取決於用户優先級（factor 調優）
- 例："這個項目用哪個框架？"

**兩個都用：**
- 先，rule 過濾掉不可行候選（硬門）
- 然後，score 給倖存者排名（加權比較）
- 例：rule 擋住有毒植物 → score 在安全植物中按養護難度與美觀排名

## 另見

- [SKILL.md](SKILL.md) — 基於規則的合規檢查（本 skill）
- [../score/SKILL.md](../score/SKILL.md) — 加權維度打分框架