---
source: lib/skill0/core/devloop/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: devloop
description: 目标驱动的开发循环 —— 定义目标、用关键结果写规则、可视化验证、同步到 issue tracker。
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # 或项目专属规则集
x env use agent-browser                   # 用于可视化验证
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. 定义目标 → 写 rule.yml

编码前，为任务创建 rule.yml：

```yaml
goal: "修复 Features 区块的英文版本显示中文标签"
keyresults:
  - kr-1: "英文模式下 Features 标签全部为英文"
  - kr-2: "中文模式下 Features 标签保持中文"
  - kr-3: "构建通过、无回归"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - 当 language=en 时，所有 details[] 项目必须为英文
    - 英文模式下任何标签徽章都不能包含中文字符
```

Rule 字段：`id`、`name`、`apply`、`level`、`desc`、`tldr`。见 `x rule -h`。

**必须** 包含 `goal` 与 `keyresults` —— 每个开发任务都强制这两个字段。

### 2. 执行 → 可视化验证（前端）

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... 改动 ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**必须** 改前、改后都截图。比对意图：

1. AI 视觉检查：after.png 是否匹配目标？
2. 若不匹配 → 迭代并重新截图
3. **上传前抹除全部隐私数据**（令牌、邮箱、个人信息）

### 3. 用 x rule 验证

```
x rule scan <files>     # 快速（约 1 分钟），用于内循环
x rule check <files>    # 完整（约 10 分钟）
x rule audit <files>    # 完整报告（约 30 分钟）
```

### 4. 同步到 issue tracker

见 [issue/SKILL.md](../issue/SKILL.md)。最低要求：在 issue 中贴出目标、关键结果、rule.yml、改前/改后截图。

## Agent tools

- `x rule scan` — 迭代中快速检查
- `x rule check` — 提交前完整合规检查
- `agent-browser screenshot` — 改前/改后的可视化证据
- `gh issue create/comment` — 把目标 + rule.yml 同步到 tracker

## Related

- [rule](../rule/SKILL.md) — rule.yml 是验证骨架
- [score](../score/SKILL.md) — KR 评分用 score 框架
- [install](../install/SKILL.md) — 设置开发环境
- [agent-browser](../../it/agent-browser/SKILL.md) — 可视化改前/改后验证
- [issue](../issue/SKILL.md) — 把目标 + KRs + 截图同步到 issue tracker
- [repo](../repo/SKILL.md) — 在 repo 中拉取/推送工作
- [prompt](../prompt/SKILL.md) — prompt 约定经常驱动 devloop 任务