---
name: naming
description: |
  x-cmd 模塊 / 命令 / 子命令的命名框架。主觀 + 場景驅動；本 skill 是一個薄殼，不是規則手冊。三層結構：
  調研（目標）、naming.<user-task>.yml（OKR + 會話記錄，是一份 .rule 文件）、naming.okr-creator.yml（對會話進行審計的 meta-rule）。
metadata:
  related: "rule,score,ontology-database"
---


# Naming

命名是 **主觀 + 場景驅動** 的。本 skill 是一個 **框架**，不是規則手冊 —— 它不會把主觀命名規則寫死。

## 快速導覽

```
┌─────────────────────────────────────────────────────────┐
│  1. 調研目標                                              │
│     要命名什麼？扮演什麼角色？什麼概念？                       │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (.rule 文件)                   │
│     - goal-*        （命名任務）                            │
│     - keyresult-*   （可驗證的結果）                         │
│     - task-*        （任務級約束）                          │
│     - session:      （對目標規則的審計軌跡）                  │
│         prefer     （5 個 init-004 答案）                  │
│         init_verdicts （每個候選的 gate 決定）              │
│         scores     （每個候選的 D1-D7 錨點）                │
│         final      （選定 + 備選）                          │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. 用 template/naming.okr-creator.yml 審計                │
│     x rule check -r <naming-dir> naming.<user-task>.yml   │
└─────────────────────────────────────────────────────────┘
```

## Workflow —— 逐步説明

### 步驟 1 · 調研目標

寫任何東西之前，先回答下列問題。**不要** 跳過 —— 沒有答案，scorer 無法錨定 D4（TRIAL/REAL）或 D5（RUN/TEST）。

- **要命名什麼？** — module / subcommand / field / variable —— 不同的命名形式規則不同
- **它扮演什麼角色？** — 錨定概念（例如 "trial-run 模塊" → 獨立 runner，兩階段測試的 Stage 1）
- **必須 攜帶的先驗是什麼？** — 主導裸詞義必須匹配（例如 trial-run 需要 TRIAL+RUN，而非 REAL+TEST）
- **必須 避開的先驗是什麼？** — unittest 污染（`*test`/`*case`）、假（`*mock`/`*fake`/`*stub`/`*dry`）、真實部署（`field*`/`*live*`）
- **哪種原型契合？** — ship / plane / rocket / factory / abstract —— 驅動 D6/D7

輸出：一行目標陳述，例如
> "為 trial-run（兩階段測試的 Stage 1）挑選一個獨立的 x-cmd 模塊名，在 D1-D7 上得分 8.0+，一眼自解釋，能扛過所有紅線 / 字典 / 長度 fast-fail。"

### 步驟 2 · 創建會話記錄

複製模板，再裁剪 / 填充。

```bash
cp naming.template.yml naming.<user-task>.yml
```

然後按從上到下順序填充 4 個區段：

#### 2a. Goal rule（命名任務）

把 `goal-TBD_task_id` 換成真實 ID。ID 後綴應反映任務（如 `goal-trial-run-naming`、`goal-mvp-prerelease-subcmd`）。

```yaml
goal-trial-run-naming:
  name: <步驟 1 中的一行目標陳述>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <來自步驟 1 的概念 + 角色 + 反先驗>
```

#### 2b. Key results（可驗證的結果）

把每個 `keyresult-kr*_TBD_short_label` 換掉。每個 KR 都必須能 PASS。任務有幾個就加幾個。

```yaml
keyresult-kr1-top-pick-committed:
  name: <可驗證的結果 1>
  level: error
  desc:
  - <什麼算通過 —— 具體判據，而非"看起來不錯">
```

#### 2c. 任務專屬規則（候選約束）

把每個 `TBD_task_id-*` 換成匹配目標 task-id 後綴的真實約束 ID。裁掉不適用的，按需新增。

常見模式：
- `must-be-X-not-Y` — 概念對齊（如 `must-be-TRIAL-not-REAL`）
- `length-N-to-M-letters` — D1 硬區間
- `must-imply-<archetype>` — D7 約束
- `<domain>-specific-acceptable` / `not-acceptable` — 窄域許可
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <約束, 如 "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <候選必須滿足什麼>
  - <它約束了哪個 D1-D7 維度>
  tldr:
  - wrong: <反例>
  - right: <正例>
```

#### 2d. Session record（對目標規則的審計軌跡）

填齊 4 個子區段：

**prefer** —— **必須** 回答全部 5 個問題，即便答案是 "no / weak"：
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<窄域列表 OK，如 [naval]>]   # [] = 沒有窄域 OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** —— 每個考慮過的候選一條，含拒絕者：
```yaml
init_verdicts:
  - { name: <候選>, gate: init-005 | init-006 | init-007 | pass, reason: "<原因>" }
  # init-005 = 紅線模式匹配（自動拒絕）
  # init-006 = 字典首義與目標衝突
  # init-007 = 長度越界（< 2 或 > 8）
  # pass     = 通過全部 init gates，可進入評分
```

**scores** —— 每個通過 init 的候選一條。分數均 >= 6.0。每條分數必須有錨點：
```yaml
scores:
  - name: <候選>
    score: <0_to_10>
    anchors:
      - "D1: <字母數證據>"
      - "D2: <字典首義證據>"
      - "D3: <複合字面證據>"
      - "D4: <trial vs real 證據>"
      - "D5: <run vs test 證據>"
      - "D6: <生動性證據>"
      - "D7: <大型設備證據>
    misses:
      - "<缺失之處 —— 只列真正缺失，不必 7 項全列>"
```

**final** —— 聲明選定 + 備選：
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### 步驟 3 · 用 meta-rule 審計

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator（位於 `template/naming.okr-creator.yml`）跑 11 項檢查（error + warn 混合）：

| Check | Level | 驗證內容 |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | 文件含 ≥1 條 `goal-*` 規則 |
| `okr-creator-002` has-keyresult-rules | error | 文件含 ≥1 條 `keyresult-*` 規則 |
| `okr-creator-003` has-task-specific-rules | error | 文件含 ≥1 條任務規則（非 goal/keyresult） |
| `okr-creator-010` has-session-record | error | goal 規則有 `session:` 字段 |
| `okr-creator-011` prefer-answers-all-five | error | 全部 5 個 init-004 問題已回答 |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts 非空 |
| `okr-creator-013` scores-have-anchors | error | 每個分數都有非空 anchors 列表 |
| `okr-creator-014` scores-no-below-6 | error | 所有分數 >= 6.0 |
| `okr-creator-015` final-section-present | error | 已聲明 `final.pick` |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | pick 分數 >= 7.0 |

**若有 error 檢查失敗**：修復文件並重新運行。常見修復：
- 缺 prefer 字段 → 加到 `session.prefer`
- 裸分 → 加 `anchors: [...]`
- 分數 < 6 → 移到 `init_verdicts`（拒絕）或重新框定分數
- 缺 final → 加 `final: { pick, backup }`

**若 warn 檢查失敗**：決定是否處理或記錄權衡。

### 步驟 4 · 用户挑選最終名字

skill 提議，用户決定。最終名字在 `session.final.pick` 中聲明並提交。

## 文件

| 文件 | 角色 | 格式 |
|---|---|---|
| `SKILL.md` | 本文件 —— 工作流 + 文件索引 | markdown |
| `naming.template.yml` | 含 `TBD_*` 佔位符的模板 —— 複製、重命名、填充 | `.rule` |
| `naming.trial-run-module.yml` | 完整會話記錄的範例 | `.rule` |
| `template/naming-concept.yml` | 客觀評估框架（D1–D7、紅線、評分錨點）—— 以 `.rule` 條目形式 | `.rule` |
| `template/naming-brand.yml` | x-cmd 品牌規則（長度、大小寫、先驗偏好）—— 以 `.rule` 條目形式 | `.rule` |
| `template/naming.okr-creator.yml` | meta-rule：審計 `naming.<user-task>.yml`（上述 11 項檢查） | `.rule` |
| `template/naming-x-cmd-mod.yml` | 可選的 x-cmd 模塊命名預設（starter session record） | `.rule` |

## 主觀 vs 客觀 劃分

| 客觀（寫在文件 / 代碼裏） | 主觀（init 時詢問，不打分） |
|---|---|
| 字典首義 | "想要生動還是抽象" |
| 字母數 | "允許窄域 X" |
| Trial / Real / Run / Test 語義類 | "允許 naval 隱喻嗎" |
| 複合字面義 | "中文來源還是英文來源" |
| 先驗污染（unittest testcase, dryrun） | "短優先於自解釋" |

## 規則

- **必須** 先調研目標 —— 要命名什麼、扮演什麼角色、什麼概念作錨。
- **必須** 從 `naming.template.yml`（含 `TBD_*` 佔位符）出發，按任務裁剪 / 填充。
- **必須** 產出 `naming.<user-task>.yml`（`.rule` 格式），包含 goal / key results / task rules / session record。
- **必須** 用 `x rule check` + `template/naming.okr-creator.yml` 審計會話記錄。
- **必須** 把分數錨定在客觀事實上 —— 不得隨用户反應注水 / 縮水。
- **必須** 讓用户挑最終名字 —— skill 提議，用户決定。
- **禁止** 把主觀規則加進 `template/naming-concept.yml` —— 那些應放在任務的 `session.prefer`。

## Related

- [rule](../rule/SKILL.md) — naming 會話通過 x rule 校驗
- [score](../score/SKILL.md) — 候選通過 score 框架打分
- [ontology-database](../ontology-database/SKILL.md) — 選定的名字持久化到 ondb