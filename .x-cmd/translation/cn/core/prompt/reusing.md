---
source: lib/skill0/core/prompt/reusing.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# Prompt reusing

属于 [prompt SKILL.md](SKILL.md)。

## 核心思想：prompt = function，placeholder = variable

prompt fragment 像一个函数 —— 用 `<PLACEHOLDER>` 变量定义逻辑与流程。真实数据永远不内联；它在运行时被解析并附加，像设置参数值一样。

```
# first_contact.md — "函数"
You are **X-CLAW**. Your workspace is "<WORKSPACE_DIR>".

# msg_telegram.md — 组装 fragments，再附加数据
<FIRST_CONTACT_PROMPT>
CURRENT CHAT ID: "<CHATID>"
Your workspace: "<WORKSPACE_DIR>"
Current time: '<CURRENT_TIME>'
<MSG>
```

`<WORKSPACE_DIR>`、`<CHATID>`、`<CURRENT_TIME>`、`<MSG>` —— 都在运行时被解析。
fragment 只声明它们放在哪里，不声明它们是什么。

## 为何重要

- **一处修复，传播所有** —— `first_contact.md` 被 `msg_telegram`、`msg_feishu`、`msg_weixin` 等共享
- **逻辑与数据分离** —— fragment 可独立审查行为正确性，无需触碰真实数据
- **可组合** —— 不同平台适配器复用同样的 fragment，仅在发送命令与格式限制上不同

## 示例：claw

```
claw/lib/data/prompt/
├── first_contact.md      # 可复用 fragment（身份 / 性格）
├── heartbeat.md          # 独立 prompt（后台 agent）
├── msg_feishu.md         # Telegram 适配器 + 共享 fragments + 运行时数据
├── msg_qywx.md           # 企业微信适配器 + 共享 fragments + 运行时数据
├── msg_telegram.md       # Telegram 适配器 + 共享 fragments + 运行时数据
└── msg_weixin.md         # 微信适配器 + 共享 fragments + 运行时数据
```

`msg_*` 模板间共享：
- `<FIRST_CONTACT_PROMPT>` — 身份规则
- `<CHECK_PROMPT>` — 工作区状态检查
- `=== UNBREAKABLE RULES ===` — 行为约束

各平台不同：
- 发送命令语法（`x feishu abot send` vs `x telegram send`）
- 格式限制（Feishu 卡片 vs Telegram markdown vs WeChat 纯文本）