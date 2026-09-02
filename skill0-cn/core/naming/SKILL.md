---
name: naming
description: |
  x-cmd 模块 / 命令 / 子命令的命名框架。主观 + 场景驱动；本 skill 是一个薄壳，不是规则手册。三层结构：
  调研（目标）、naming.<user-task>.yml（OKR + 会话记录，是一份 .rule 文件）、naming.okr-creator.yml（对会话进行审计的 meta-rule）。
metadata:
  related: "rule,score,ontology-database"
---


# Naming

命名是 **主观 + 场景驱动** 的。本 skill 是一个 **框架**，不是规则手册 —— 它不会把主观命名规则写死。

## 快速导览

```
┌─────────────────────────────────────────────────────────┐
│  1. 调研目标                                              │
│     要命名什么？扮演什么角色？什么概念？                       │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (.rule 文件)                   │
│     - goal-*        （命名任务）                            │
│     - keyresult-*   （可验证的结果）                         │
│     - task-*        （任务级约束）                          │
│     - session:      （对目标规则的审计轨迹）                  │
│         prefer     （5 个 init-004 答案）                  │
│         init_verdicts （每个候选的 gate 决定）              │
│         scores     （每个候选的 D1-D7 锚点）                │
│         final      （选定 + 备选）                          │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. 用 template/naming.okr-creator.yml 审计                │
│     x rule check -r <naming-dir> naming.<user-task>.yml   │
└─────────────────────────────────────────────────────────┘
```

## Workflow —— 逐步说明

### 步骤 1 · 调研目标

写任何东西之前，先回答下列问题。**不要** 跳过 —— 没有答案，scorer 无法锚定 D4（TRIAL/REAL）或 D5（RUN/TEST）。

- **要命名什么？** — module / subcommand / field / variable —— 不同的命名形式规则不同
- **它扮演什么角色？** — 锚定概念（例如 "trial-run 模块" → 独立 runner，两阶段测试的 Stage 1）
- **必须 携带的先验是什么？** — 主导裸词义必须匹配（例如 trial-run 需要 TRIAL+RUN，而非 REAL+TEST）
- **必须 避开的先验是什么？** — unittest 污染（`*test`/`*case`）、假（`*mock`/`*fake`/`*stub`/`*dry`）、真实部署（`field*`/`*live*`）
- **哪种原型契合？** — ship / plane / rocket / factory / abstract —— 驱动 D6/D7

输出：一行目标陈述，例如
> "为 trial-run（两阶段测试的 Stage 1）挑选一个独立的 x-cmd 模块名，在 D1-D7 上得分 8.0+，一眼自解释，能扛过所有红线 / 字典 / 长度 fast-fail。"

### 步骤 2 · 创建会话记录

复制模板，再裁剪 / 填充。

```bash
cp naming.template.yml naming.<user-task>.yml
```

然后按从上到下顺序填充 4 个区段：

#### 2a. Goal rule（命名任务）

把 `goal-TBD_task_id` 换成真实 ID。ID 后缀应反映任务（如 `goal-trial-run-naming`、`goal-mvp-prerelease-subcmd`）。

```yaml
goal-trial-run-naming:
  name: <步骤 1 中的一行目标陈述>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <来自步骤 1 的概念 + 角色 + 反先验>
```

#### 2b. Key results（可验证的结果）

把每个 `keyresult-kr*_TBD_short_label` 换掉。每个 KR 都必须能 PASS。任务有几个就加几个。

```yaml
keyresult-kr1-top-pick-committed:
  name: <可验证的结果 1>
  level: error
  desc:
  - <什么算通过 —— 具体判据，而非"看起来不错">
```

#### 2c. 任务专属规则（候选约束）

把每个 `TBD_task_id-*` 换成匹配目标 task-id 后缀的真实约束 ID。裁掉不适用的，按需新增。

常见模式：
- `must-be-X-not-Y` — 概念对齐（如 `must-be-TRIAL-not-REAL`）
- `length-N-to-M-letters` — D1 硬区间
- `must-imply-<archetype>` — D7 约束
- `<domain>-specific-acceptable` / `not-acceptable` — 窄域许可
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <约束, 如 "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <候选必须满足什么>
  - <它约束了哪个 D1-D7 维度>
  tldr:
  - wrong: <反例>
  - right: <正例>
```

#### 2d. Session record（对目标规则的审计轨迹）

填齐 4 个子区段：

**prefer** —— **必须** 回答全部 5 个问题，即便答案是 "no / weak"：
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<窄域列表 OK，如 [naval]>]   # [] = 没有窄域 OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** —— 每个考虑过的候选一条，含拒绝者：
```yaml
init_verdicts:
  - { name: <候选>, gate: init-005 | init-006 | init-007 | pass, reason: "<原因>" }
  # init-005 = 红线模式匹配（自动拒绝）
  # init-006 = 字典首义与目标冲突
  # init-007 = 长度越界（< 2 或 > 8）
  # pass     = 通过全部 init gates，可进入评分
```

**scores** —— 每个通过 init 的候选一条。分数均 >= 6.0。每条分数必须有锚点：
```yaml
scores:
  - name: <候选>
    score: <0_to_10>
    anchors:
      - "D1: <字母数证据>"
      - "D2: <字典首义证据>"
      - "D3: <复合字面证据>"
      - "D4: <trial vs real 证据>"
      - "D5: <run vs test 证据>"
      - "D6: <生动性证据>"
      - "D7: <大型设备证据>
    misses:
      - "<缺失之处 —— 只列真正缺失，不必 7 项全列>"
```

**final** —— 声明选定 + 备选：
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### 步骤 3 · 用 meta-rule 审计

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator（位于 `template/naming.okr-creator.yml`）跑 11 项检查（error + warn 混合）：

| Check | Level | 验证内容 |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | 文件含 ≥1 条 `goal-*` 规则 |
| `okr-creator-002` has-keyresult-rules | error | 文件含 ≥1 条 `keyresult-*` 规则 |
| `okr-creator-003` has-task-specific-rules | error | 文件含 ≥1 条任务规则（非 goal/keyresult） |
| `okr-creator-010` has-session-record | error | goal 规则有 `session:` 字段 |
| `okr-creator-011` prefer-answers-all-five | error | 全部 5 个 init-004 问题已回答 |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts 非空 |
| `okr-creator-013` scores-have-anchors | error | 每个分数都有非空 anchors 列表 |
| `okr-creator-014` scores-no-below-6 | error | 所有分数 >= 6.0 |
| `okr-creator-015` final-section-present | error | 已声明 `final.pick` |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | pick 分数 >= 7.0 |

**若有 error 检查失败**：修复文件并重新运行。常见修复：
- 缺 prefer 字段 → 加到 `session.prefer`
- 裸分 → 加 `anchors: [...]`
- 分数 < 6 → 移到 `init_verdicts`（拒绝）或重新框定分数
- 缺 final → 加 `final: { pick, backup }`

**若 warn 检查失败**：决定是否处理或记录权衡。

### 步骤 4 · 用户挑选最终名字

skill 提议，用户决定。最终名字在 `session.final.pick` 中声明并提交。

## 文件

| 文件 | 角色 | 格式 |
|---|---|---|
| `SKILL.md` | 本文件 —— 工作流 + 文件索引 | markdown |
| `naming.template.yml` | 含 `TBD_*` 占位符的模板 —— 复制、重命名、填充 | `.rule` |
| `naming.trial-run-module.yml` | 完整会话记录的范例 | `.rule` |
| `template/naming-concept.yml` | 客观评估框架（D1–D7、红线、评分锚点）—— 以 `.rule` 条目形式 | `.rule` |
| `template/naming-brand.yml` | x-cmd 品牌规则（长度、大小写、先验偏好）—— 以 `.rule` 条目形式 | `.rule` |
| `template/naming.okr-creator.yml` | meta-rule：审计 `naming.<user-task>.yml`（上述 11 项检查） | `.rule` |
| `template/naming-x-cmd-mod.yml` | 可选的 x-cmd 模块命名预设（starter session record） | `.rule` |

## 主观 vs 客观 划分

| 客观（写在文件 / 代码里） | 主观（init 时询问，不打分） |
|---|---|
| 字典首义 | "想要生动还是抽象" |
| 字母数 | "允许窄域 X" |
| Trial / Real / Run / Test 语义类 | "允许 naval 隐喻吗" |
| 复合字面义 | "中文来源还是英文来源" |
| 先验污染（unittest testcase, dryrun） | "短优先于自解释" |

## 规则

- **必须** 先调研目标 —— 要命名什么、扮演什么角色、什么概念作锚。
- **必须** 从 `naming.template.yml`（含 `TBD_*` 占位符）出发，按任务裁剪 / 填充。
- **必须** 产出 `naming.<user-task>.yml`（`.rule` 格式），包含 goal / key results / task rules / session record。
- **必须** 用 `x rule check` + `template/naming.okr-creator.yml` 审计会话记录。
- **必须** 把分数锚定在客观事实上 —— 不得随用户反应注水 / 缩水。
- **必须** 让用户挑最终名字 —— skill 提议，用户决定。
- **禁止** 把主观规则加进 `template/naming-concept.yml` —— 那些应放在任务的 `session.prefer`。

## Related

- [rule](../rule/SKILL.md) — naming 会话通过 x rule 校验
- [score](../score/SKILL.md) — 候选通过 score 框架打分
- [ontology-database](../ontology-database/SKILL.md) — 选定的名字持久化到 ondb