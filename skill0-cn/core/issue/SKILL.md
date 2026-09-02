---
name: issue
description: devloop 的 issue 管理 —— 提供目标、rule.yml、关键结果与 issue 生命周期的模板。
metadata:
  related: "devloop,repo"
---


# issue

属于 [devloop](../devloop/SKILL.md)。

## 新开发 issue 模板

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

## Issue 生命周期

| 阶段 | 动作 | 评论内容 |
|-------|--------|----------------|
| Created | 用模板 `gh issue create` | 目标、关键结果、rule.yml |
| In progress | 工作中持续更新 | 进度记录、中间截图 |
| Verified | `x rule check` 通过 | rule check 结果、after 截图 |
| Closed | `gh issue close` | commit SHA、最终验证摘要 |

## 完成评论模板

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

## 规则

- **必须** 在每个开发 issue 中包含 `goal` 与 `keyresults` —— 无例外
- **必须** 把 rule.yml 作为代码块贴在 issue 正文或首条评论中
- **必须** 为前端改动截改前/改后图
- **严禁** 在没有验证证据时关闭 issue
- 将 issue 关联到项目看板以便 roadmap 可见

## Related

- [devloop](../devloop/SKILL.md) — 目标驱动循环（goal/rule.yml/KRs）的 tracker
- [repo](../repo/SKILL.md) — issue 附在 x-repo 布局中的仓库