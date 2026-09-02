---
name: lovable
description: Lovable MCP 工具用法 —— 部署項目、向 agent 發消息、用 agent-browser 測試。通過委託本地 repo 來減少 credits。
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## 安裝與完整 MCP 參考

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

完整 MCP 參考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

- Plan —— 需要 Pro/Business
- Auth —— 首次調用時瀏覽器 OAuth 提示
- Clients —— Claude Code、Claude Desktop、ChatGPT、Cursor、VS Code

## 核心工作流：本地優先，節省 credits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## 規則

- **必須 驗證項目 ID** —— 在任何操作前調用 `list_projects query=<name>` 確認正確的 `project_id`。**永遠不要 複用記憶裏或上下文中之前的 ID。** 部署後等待 30 秒再驗證線上站點，再回報成功。
- **必須 改前改後截圖** —— 修改項目時，捕獲 before-screenshot，做改動，捕獲 after-screenshot。對比以確認意圖。適用時發到 GitHub issue。**上傳前抹除全部隱私數據**（令牌、個人信息、郵箱）。

## 常用 MCP 調用

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Usecase —— Analytics

快速總覽：`list_projects publish_status=published` 返回每個項目的訪客數。
以 TSV/CSV 導出，schema 為：`id, project, 24h, 7d, 30d, URL`。

詳細分析（pageviews、跳出率、流量來源、設備）見 [ANALYTICS.md](ANALYTICS.md)。

## Usecase —— Knowledge（持久化給 Lovable agent 的指令）

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
永遠先 `get` 再 `set` —— set 會整篇替換。最多 10K 字符。還有：`get/set_workspace_knowledge`。

## 用 agent-browser 測試

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
完整用法：見 skill0 `agent-browser`。

## 故障排查

- 站點未更新 —— `deploy_project`
- 改代碼，本地存在 —— 本地 → push → deploy
- 改代碼，無本地 —— `send_message`（高 credits 成本）
- 移動端測試 —— `agent-browser set device "iPhone 14"`

PWA 問題、同步問題等見 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)。

## 更多信息

- [docs llms.txt](https://docs.lovable.dev/llms.txt) —— 完整文檔索引
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) —— 產品中心、價格、指南、模板
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) —— Stripe、Supabase、Slack 等
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) —— 把 Notion、Linear、Jira 接入構建
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) —— 通過 REST 以編程方式構建應用

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) —— 驗證流
- [prompt](../prompt/SKILL.md) —— 與 agent 通信
- [devloop](../devloop/SKILL.md) —— lovable 項目遵循 devloop 形態