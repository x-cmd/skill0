---
name: score
description: |
  為 AI agent 設計的加權維度打分框架 —— "Don't guess. Score." 核心理念：先理解需求、先草稿再迭代，agent 是分析師。通過 `x score compute` 輸出排序後的 TSV。
metadata:
  related: "rule,naming"
---


# Score
"Don't guess. Score."
為 AI agent 設計的加權維度打分框架。
## How to use
**先理解，再打分。** 定義維度之前先問足夠多的問題。維度錯了 → 分數再準也沒用。
**先草稿再迭代。** 當需求不完全清晰時，做一個盡力而為的標準、打分、給出結果。用户對具體排名會反饋 —— "這個 factor 應該更高"、"你漏了 X"。那是信號。精化再重打分。一次迭代勝過十輪瞎猜。
**agent 是分析師。** compute 之後，讀 TSV。解釋 X 為什麼贏 Y。突出驚喜。建議調整。排名開啓對話，不是結束對話。
## Core flow
```
① 理解需求  → ② 定義 score.yml  → ③ 打分 score.tsv  → ④ x score compute  → ⑤ 報告 & 迭代
```
Output：`target, total, rank, block, reason, <dim> (X%), evidence`。Total 0–100，降序。rank=1 最佳。
## Example — 幫助用户決定宣傳標語
1. 與用户討論，確定評估維度與判據。寫 `slogan.score.yml`。
2. AI 給每條標語按維度打分（0–10，帶證據）→ `slogan.score.tsv`。Total 與 rank 留空。
3. `x score compute slogan.score.yml slogan.score.tsv` → 填 total + rank。
4. 讀結果，與用户討論。調整分數或加候選，重複。
5. 或：`x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
更多示例：[EXAMPLE.md](EXAMPLE.md)。
## Two-file model
- `*.score.yml` — 可複用標準：維度、factor、描述
- `**.score.tsv` — 目標 + 分數 + 證據；第 1 列 = 目標名
`x score compute <yml> <tsv>` 與 `python compute.py` 等價。
## Application scenarios
1. **給 agent 一個決策工作流。** score.yml 把 agent 錨定在結構化流程 —— agent 跟隨標準，而不是上一條消息的情緒。
2. **決策基於規則。** 維度 × factor × 證據 → 加權總分 → 排名。每個分數都錨定事實。推理透明。
3. **按需求調優。** 換維度、調 factor、加硬過濾（`block` 列）。同一模板，不同用户。
4. **隨需求澄清而演進。** 草稿 → 打分 → 反饋 → 精化 → 更鋒利。
5. **任何 skill 的標準文件 + 歸檔結果。** score.yml = 決策標準。score.tsv = 決策記錄。兩者可歸檔、可審查、可分享。
---
## Formula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — 整數 1–10。基線 = 2。1=次要，4=2×，6=3×，8=4×，10=5×。自動歸一化。
- **score** — 每個維度 0–10，證據錨定。
- **total** — 加權總分 0–100。
維度表頭顯示權重 %：`factor ÷ Σ(factor) × 100`。
## Output columns
| Column | Source | Description |
|--------|--------|-------------|
| `target` | input | 候選名 |
| `total` | computed | 加權分數（0–100） |
| `rank` | computed | 1 = 最佳。`X` 表示被 block |
| `block` | input | 硬過濾 —— 非空 = 失格，壓到底部，rank=X |
| `reason` | input/output | 可選：AI 關於分數細微處的備註 |
| `<dim> (X%)` | computed | 每維度分數，表頭顯示權重 % |
| `evidence` | input | 每個分數背後的事實 |
## Scale
- 9–10 — Excellent — 完全滿足判據
- 7–8 — Good — 滿足判據，有小差距
- 5–6 — Adequate — 方向對，有明顯缺口
- 3–4 — Weak — 顯著缺口
- 1–2 — Fail — 幾乎沒滿足
- 0 — N/A — 不適用
## Rules
1. **證據錨定** —— 每個分數都必須有證據。是事實，不是感覺。
2. **用滿全區間** —— 5 是中點，不是默認。0 與 10 罕見但可能。
3. **factor 是相對放大器** —— factor 2 = factor 1 影響力的 2 倍。自動歸一化。
4. **目標唯一且非空** —— 第 1 列每行必須有目標名。無重複、無空。
5. **agent 讀、報、決** —— compute 之後，解釋結果。按需重打分或重賦權。
## Files
- `SKILL.cn.md` — 中文版
- `compute.py` — 校驗 + 計算 total + rank
- `template/*.score.yml` — 35+ 模板。`x score ls` 列出，`x score init -t <name>` 複製
- `EXAMPLE.md` — 更多用法示例
- `rule-vs-score.md` — 何時用 rule vs score
- `score-template-writer.md` — 如何寫打分模板

## Related

- [rule](../rule/SKILL.md) — 配對的合規伴侶
- [naming](../naming/SKILL.md) — 候選名在此打分