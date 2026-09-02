---
source: lib/skill0/core/prompt/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: prompt
description: x-cmd 的 prompt 工程約定 —— 通過模板變量複用、約定結構、安全強制模式。
metadata:
  related: "devloop,rule"
---


# Prompt

## 核心原則：複用，不要複製

x-cmd 的 prompt 由可複用的片段組裝，而非寫成一整塊。prompt 模板裏包含由 shell 模塊在運行時解析的 `<PLACEHOLDER>` 變量。

`claw` 中的示例：
```
first_contact.md          # 獨立 —— 載入 <FIRST_CONTACT_PROMPT>
msg_telegram.md           # 組裝：<FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # 同樣的片段，平台適配器不同
heartbeat.md              # 不同的工作流，共享 <CHECK_PROMPT>
```

**原因**：一處修復傳播到所有地方。平台適配器（Telegram、Feishu、WeChat）共享行為規則，但發送命令與格式限制不同。

詳細複用模式見 [reusing.md](reusing.md)。

## 結構規則

- 每個 prompt 文件都是一個場景下完整、自包含的指令集
- 用 `<UPPER_CASE>` 佔位符表示變量 —— 永遠不要內聯真實數據
- 佔位符由調用模塊解析，而非 prompt 自己
- Fragment = function（邏輯與流程），數據在運行時附加（像設置參數一樣）

## 安全強制模式

安全與行為規則必須 顯式且有力：

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

使用 MUST、NEVER、DO NOT。安全語言規則見 [skill0-writer](../skill0-writer/SKILL.md)。

## 格式指南模式

當 prompt 要面向多個平台、每個平台格式化能力不同時：

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## 實際示例

prompt fragment 當前存放在每個模塊的 `lib/data/prompt/`（如 `claw/lib/data/prompt/`）。
它們將遷移到 `skill0/lib/skill0/<subskill>/` —— 結構相同、位置規範。

`claw/lib/data/prompt/` 中的現有示例：
- `first_contact.md` — 新工作區問候，可複用片段
- `heartbeat.md` — 後台 agent，讀取工作區狀態
- `msg_<platform>.md` — 各平台消息處理器，共享公共片段

## Related

- [devloop](../devloop/SKILL.md) — prompt 經常驅動 devloop 任務
- [rule](../rule/SKILL.md) — prompt 結構規則由 x rule 強制