---
source: lib/skill0/core/prompt/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: prompt
description: x-cmd 的 prompt 工程约定 —— 通过模板变量复用、约定结构、安全强制模式。
metadata:
  related: "devloop,rule"
---


# Prompt

## 核心原则：复用，不要复制

x-cmd 的 prompt 由可复用的片段组装，而非写成一整块。prompt 模板里包含由 shell 模块在运行时解析的 `<PLACEHOLDER>` 变量。

`claw` 中的示例：
```
first_contact.md          # 独立 —— 载入 <FIRST_CONTACT_PROMPT>
msg_telegram.md           # 组装：<FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # 同样的片段，平台适配器不同
heartbeat.md              # 不同的工作流，共享 <CHECK_PROMPT>
```

**原因**：一处修复传播到所有地方。平台适配器（Telegram、Feishu、WeChat）共享行为规则，但发送命令与格式限制不同。

详细复用模式见 [reusing.md](reusing.md)。

## 结构规则

- 每个 prompt 文件都是一个场景下完整、自包含的指令集
- 用 `<UPPER_CASE>` 占位符表示变量 —— 永远不要内联真实数据
- 占位符由调用模块解析，而非 prompt 自己
- Fragment = function（逻辑与流程），数据在运行时附加（像设置参数一样）

## 安全强制模式

安全与行为规则必须 显式且有力：

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

使用 MUST、NEVER、DO NOT。安全语言规则见 [skill0-writer](../skill0-writer/SKILL.md)。

## 格式指南模式

当 prompt 要面向多个平台、每个平台格式化能力不同时：

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## 实际示例

prompt fragment 当前存放在每个模块的 `lib/data/prompt/`（如 `claw/lib/data/prompt/`）。
它们将迁移到 `skill0/lib/skill0/<subskill>/` —— 结构相同、位置规范。

`claw/lib/data/prompt/` 中的现有示例：
- `first_contact.md` — 新工作区问候，可复用片段
- `heartbeat.md` — 后台 agent，读取工作区状态
- `msg_<platform>.md` — 各平台消息处理器，共享公共片段

## Related

- [devloop](../devloop/SKILL.md) — prompt 经常驱动 devloop 任务
- [rule](../rule/SKILL.md) — prompt 结构规则由 x rule 强制