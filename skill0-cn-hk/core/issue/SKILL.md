---
name: issue
description: devloop 的 issue 管理 —— 提供目標、rule.yml、關鍵結果與 issue 生命週期的模板。
metadata:
  related: "devloop,repo"
---


# issue

屬於 [devloop](../devloop/SKILL.md)。

## 新開發 issue 模板

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Issue 生命週期

| 階段 | 動作 | 評論內容 |
|-------|--------|----------------|
| Created | 用模板 `gh issue create` | 目標、關鍵結果、rule.yml |
| In progress | 工作中持續更新 | 進度記錄、中間截圖 |
| Verified | `x rule check` 通過 | rule check 結果、after 截圖 |
| Closed | `gh issue close` | commit SHA、最終驗證摘要 |

## 完成評論模板

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## 規則

- **必須** 在每個開發 issue 中包含 `goal` 與 `keyresults` —— 無例外
- **必須** 把 rule.yml 作為代碼塊貼在 issue 正文或首條評論中
- **必須** 為前端改動截改前/改後圖
- **嚴禁** 在沒有驗證證據時關閉 issue
- 將 issue 關聯到項目看板以便 roadmap 可見

## Related

- [devloop](../devloop/SKILL.md) — 目標驅動循環（goal/rule.yml/KRs）的 tracker
- [repo](../repo/SKILL.md) — issue 附在 x-repo 佈局中的倉庫