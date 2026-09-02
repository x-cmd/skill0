---
source: lib/skill0/core/devloop/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: devloop
description: 目標驅動的開發循環 —— 定義目標、用關鍵結果寫規則、可視化驗證、同步到 issue tracker。
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # 或項目專屬規則集
x env use agent-browser                   # 用於可視化驗證
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. 定義目標 → 寫 rule.yml

編碼前，為任務創建 rule.yml：

```yaml
goal: "修復 Features 區塊的英文版本顯示中文標籤"
keyresults:
  - kr-1: "英文模式下 Features 標籤全部為英文"
  - kr-2: "中文模式下 Features 標籤保持中文"
  - kr-3: "構建通過、無迴歸"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - 當 language=en 時，所有 details[] 項目必須為英文
    - 英文模式下任何標籤徽章都不能包含中文字符
```

Rule 字段：`id`、`name`、`apply`、`level`、`desc`、`tldr`。見 `x rule -h`。

**必須** 包含 `goal` 與 `keyresults` —— 每個開發任務都強制這兩個字段。

### 2. 執行 → 可視化驗證（前端）

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... 改動 ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**必須** 改前、改後都截圖。比對意圖：

1. AI 視覺檢查：after.png 是否匹配目標？
2. 若不匹配 → 迭代並重新截圖
3. **上傳前抹除全部隱私數據**（令牌、郵箱、個人信息）

### 3. 用 x rule 驗證

```
x rule scan <files>     # 快速（約 1 分鐘），用於內循環
x rule check <files>    # 完整（約 10 分鐘）
x rule audit <files>    # 完整報告（約 30 分鐘）
```

### 4. 同步到 issue tracker

見 [issue/SKILL.md](../issue/SKILL.md)。最低要求：在 issue 中貼出目標、關鍵結果、rule.yml、改前/改後截圖。

## Agent tools

- `x rule scan` — 迭代中快速檢查
- `x rule check` — 提交前完整合規檢查
- `agent-browser screenshot` — 改前/改後的可視化證據
- `gh issue create/comment` — 把目標 + rule.yml 同步到 tracker

## Related

- [rule](../rule/SKILL.md) — rule.yml 是驗證骨架
- [score](../score/SKILL.md) — KR 評分用 score 框架
- [install](../install/SKILL.md) — 設置開發環境
- [agent-browser](../../it/agent-browser/SKILL.md) — 可視化改前/改後驗證
- [issue](../issue/SKILL.md) — 把目標 + KRs + 截圖同步到 issue tracker
- [repo](../repo/SKILL.md) — 在 repo 中拉取/推送工作
- [prompt](../prompt/SKILL.md) — prompt 約定經常驅動 devloop 任務