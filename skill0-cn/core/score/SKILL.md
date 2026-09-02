---
name: score
description: |
  为 AI agent 设计的加权维度打分框架 —— "Don't guess. Score." 核心理念：先理解需求、先草稿再迭代，agent 是分析师。通过 `x score compute` 输出排序后的 TSV。
metadata:
  related: "rule,naming"
---


# Score
"Don't guess. Score."
为 AI agent 设计的加权维度打分框架。
## How to use
**先理解，再打分。** 定义维度之前先问足够多的问题。维度错了 → 分数再准也没用。
**先草稿再迭代。** 当需求不完全清晰时，做一个尽力而为的标准、打分、给出结果。用户对具体排名会反馈 —— "这个 factor 应该更高"、"你漏了 X"。那是信号。精化再重打分。一次迭代胜过十轮瞎猜。
**agent 是分析师。** compute 之后，读 TSV。解释 X 为什么赢 Y。突出惊喜。建议调整。排名开启对话，不是结束对话。
## Core flow
```
① 理解需求  → ② 定义 score.yml  → ③ 打分 score.tsv  → ④ x score compute  → ⑤ 报告 & 迭代
```
Output：`target, total, rank, block, reason, <dim> (X%), evidence`。Total 0–100，降序。rank=1 最佳。
## Example — 帮助用户决定宣传标语
1. 与用户讨论，确定评估维度与判据。写 `slogan.score.yml`。
2. AI 给每条标语按维度打分（0–10，带证据）→ `slogan.score.tsv`。Total 与 rank 留空。
3. `x score compute slogan.score.yml slogan.score.tsv` → 填 total + rank。
4. 读结果，与用户讨论。调整分数或加候选，重复。
5. 或：`x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
更多示例：[EXAMPLE.md](EXAMPLE.md)。
## Two-file model
- `*.score.yml` — 可复用标准：维度、factor、描述
- `**.score.tsv` — 目标 + 分数 + 证据；第 1 列 = 目标名
`x score compute <yml> <tsv>` 与 `python compute.py` 等价。
## Application scenarios
1. **给 agent 一个决策工作流。** score.yml 把 agent 锚定在结构化流程 —— agent 跟随标准，而不是上一条消息的情绪。
2. **决策基于规则。** 维度 × factor × 证据 → 加权总分 → 排名。每个分数都锚定事实。推理透明。
3. **按需求调优。** 换维度、调 factor、加硬过滤（`block` 列）。同一模板，不同用户。
4. **随需求澄清而演进。** 草稿 → 打分 → 反馈 → 精化 → 更锋利。
5. **任何 skill 的标准文件 + 归档结果。** score.yml = 决策标准。score.tsv = 决策记录。两者可归档、可审查、可分享。
---
## Formula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — 整数 1–10。基线 = 2。1=次要，4=2×，6=3×，8=4×，10=5×。自动归一化。
- **score** — 每个维度 0–10，证据锚定。
- **total** — 加权总分 0–100。
维度表头显示权重 %：`factor ÷ Σ(factor) × 100`。
## Output columns
| Column | Source | Description |
|--------|--------|-------------|
| `target` | input | 候选名 |
| `total` | computed | 加权分数（0–100） |
| `rank` | computed | 1 = 最佳。`X` 表示被 block |
| `block` | input | 硬过滤 —— 非空 = 失格，压到底部，rank=X |
| `reason` | input/output | 可选：AI 关于分数细微处的备注 |
| `<dim> (X%)` | computed | 每维度分数，表头显示权重 % |
| `evidence` | input | 每个分数背后的事实 |
## Scale
- 9–10 — Excellent — 完全满足判据
- 7–8 — Good — 满足判据，有小差距
- 5–6 — Adequate — 方向对，有明显缺口
- 3–4 — Weak — 显著缺口
- 1–2 — Fail — 几乎没满足
- 0 — N/A — 不适用
## Rules
1. **证据锚定** —— 每个分数都必须有证据。是事实，不是感觉。
2. **用满全区间** —— 5 是中点，不是默认。0 与 10 罕见但可能。
3. **factor 是相对放大器** —— factor 2 = factor 1 影响力的 2 倍。自动归一化。
4. **目标唯一且非空** —— 第 1 列每行必须有目标名。无重复、无空。
5. **agent 读、报、决** —— compute 之后，解释结果。按需重打分或重赋权。
## Files
- `SKILL.cn.md` — 中文版
- `compute.py` — 校验 + 计算 total + rank
- `template/*.score.yml` — 35+ 模板。`x score ls` 列出，`x score init -t <name>` 复制
- `EXAMPLE.md` — 更多用法示例
- `rule-vs-score.md` — 何时用 rule vs score
- `score-template-writer.md` — 如何写打分模板

## Related

- [rule](../rule/SKILL.md) — 配对的合规伴侣
- [naming](../naming/SKILL.md) — 候选名在此打分