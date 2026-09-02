# Prompt reusing

屬於 [prompt SKILL.md](SKILL.md)。

## 核心思想：prompt = function，placeholder = variable

prompt fragment 像一個函數 —— 用 `<PLACEHOLDER>` 變量定義邏輯與流程。真實數據永遠不內聯；它在運行時被解析並附加，像設置參數值一樣。

```
# first_contact.md — "函數"
You are **X-CLAW**. Your workspace is "<WORKSPACE_DIR>".

# msg_telegram.md — 組裝 fragments，再附加數據
<FIRST_CONTACT_PROMPT>
CURRENT CHAT ID: "<CHATID>"
Your workspace: "<WORKSPACE_DIR>"
Current time: '<CURRENT_TIME>'
<MSG>
```

`<WORKSPACE_DIR>`、`<CHATID>`、`<CURRENT_TIME>`、`<MSG>` —— 都在運行時被解析。
fragment 只聲明它們放在哪裏，不聲明它們是什麼。

## 為何重要

- **一處修復，傳播所有** —— `first_contact.md` 被 `msg_telegram`、`msg_feishu`、`msg_weixin` 等共享
- **邏輯與數據分離** —— fragment 可獨立審查行為正確性，無需觸碰真實數據
- **可組合** —— 不同平台適配器複用同樣的 fragment，僅在發送命令與格式限制上不同

## 示例：claw

```
claw/lib/data/prompt/
├── first_contact.md      # 可複用 fragment（身份 / 性格）
├── heartbeat.md          # 獨立 prompt（後台 agent）
├── msg_feishu.md         # Telegram 適配器 + 共享 fragments + 運行時數據
├── msg_qywx.md           # 企業微信適配器 + 共享 fragments + 運行時數據
├── msg_telegram.md       # Telegram 適配器 + 共享 fragments + 運行時數據
└── msg_weixin.md         # 微信適配器 + 共享 fragments + 運行時數據
```

`msg_*` 模板間共享：
- `<FIRST_CONTACT_PROMPT>` — 身份規則
- `<CHECK_PROMPT>` — 工作區狀態檢查
- `=== UNBREAKABLE RULES ===` — 行為約束

各平台不同：
- 發送命令語法（`x feishu abot send` vs `x telegram send`）
- 格式限制（Feishu 卡片 vs Telegram markdown vs WeChat 純文本）