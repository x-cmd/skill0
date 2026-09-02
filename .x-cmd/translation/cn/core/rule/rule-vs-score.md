---
source: lib/skill0/core/rule/rule-vs-score.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Rule vs Score

为不同问题设计的两个互补框架。

| | Rule | Score |
|---|---|---|
| **目的** | 找出问题 —— 保证最低质量 | 评估质量 —— 选出最优选项 |
| **类比** | 质量门 / 检查清单 | 排名 / 排行榜 |
| **输出** | 每条 rule 的 pass / fail | 加权总分 + 排名 |
| **典型对象** | 单个对象（一个文件、一个 repo、一个系统） | 多个候选（3+ 个待比较替代） |
| **之后动作** | 修复违规 | 做决策 |
| **回答的问题** | "这够好了吗？" | "哪个最好？" |
| **硬过滤** | Rule `level: error` = 必须通过 | TSV `block` 列 = 失格，排名 X |

## 打分如何工作

**Score**：按 factor 加权，100 分制。

```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```

每个维度有一个 0–10 分与一个 factor（1–10，基线=2）。维度表头显示权重 %。factor 起放大作用 —— factor=8 的维度权重是 factor=2 的 4 倍。公式自动归一化。

**Rule**：按 rule 计数。无加权、无聚合。

一个对象对照 N 条 rule → N 个独立结果。每条 rule 自己给出 0–100 分 —— 100 = 通过，低于 100 = 违规。你不取平均。若 10 条中有 3 条失败，你有 3 个问题要修。

```
pass_count = 分数 = 100 的 rule 数
fail_count = 分数 < 100 的 rule 数
```

## 典型场景

### Rule 场景 —— "这里有问题吗？"

| 域 | rule 示例 | 检查内容 |
|--------|-------------|----------------|
| 代码质量 | `no-console-log` | 生产代码不得有 `console.log` |
| 文档 | `doc-orphan-010` | 每个 .md 必须从某 SKILL.md 引用过来 |
| 配置安全 | `no-hardcoded-secrets` | 提交的文件中不得有 API key 或密码 |
| 结构 | `rule-struct-010` | 每条 rule.yml 必须有 `desc` 字段 |
| 命名 | `file-naming-convention` | 文件必须遵循命名模式 |
| Git 卫生 | `no-merge-commit-to-main` | main 分支只接受 squash/rebase |

问题永远是："这个对象违反 rule 吗？"答案永远是："是（分数 < 100，这里是违规）" 或 "否（分数 = 100）"。

### Score 场景 —— "我该选哪个？"

| 域 | template 示例 | 选择的对比项 |
|--------|-----------------|------------------------------|
| 技术 | `tech-stack` | 新服务的 Python vs Go vs Rust |
| 生活 | `house` | 上周末看的 3 套公寓 |
| 职业 | `job` | 手头的 2 个 offer |
| 消费 | `car` | SUV vs 轿车 vs 电动车 |
| 植物 | `plant-cat` | 对猫安全的 12 种植物 |
| 宠物 | `pet-office` | 办公室养什么宠物 |
| 礼物 | `gift` | 给女朋友生日买什么 |
| 旅行 | `travel` | 下个假期去哪里 |

问题永远是："在这些候选中，哪个最好？"答案永远是带分数的排序 —— 用户可能不同意并想调整 factor。

### 组合场景 —— 先 rule 再 score

一些决策同时需要两者：

1. **Rule** 淘汰不可行候选（"这植物有毒 → 出局"）
2. **Score** 给幸存者排名（"在安全的植物里，最容易养又最好看的是？"）

其他示例：
- 求职：rule 过滤掉不办签证 sponsorship 的公司 → score 按薪资、成长、文化排名
- 公寓：rule 过滤掉超预算 / 不让养宠的楼 → score 按通勤、空间、社区排名
- 库选型：rule 过滤掉无人维护的库 → score 按 API 设计、性能、社区排名

## 但边界是软的

- rule 可检查多个文件。score 也可评估单个候选。
- 区分在于 **意图**，不是对象数量。
- 问题是"这过吗？" → rule。
- 问题是"这有多好，与替代比？" → score。

## 用哪个

**用 rule 当：**
- 你有清晰的 pass/fail 判据（字段必须存在，值必须在范围内）
- 你要在整个代码库强制标准
- 违规是可操作的 —— 你知道要修什么
- 例："每条 .rule.yml 必须有 `desc` 字段"

**用 score 当：**
- 你在比较候选项并需要决策
- 判据是偏好，不是绝对（权衡）
- 答案取决于用户优先级（factor 调优）
- 例："这个项目用哪个框架？"

**两个都用：**
- 先，rule 过滤掉不可行候选（硬门）
- 然后，score 给幸存者排名（加权比较）
- 例：rule 挡住有毒植物 → score 在安全植物中按养护难度与美观排名

## 另见

- [SKILL.md](SKILL.md) — 基于规则的合规检查（本 skill）
- [../score/SKILL.md](../score/SKILL.md) — 加权维度打分框架