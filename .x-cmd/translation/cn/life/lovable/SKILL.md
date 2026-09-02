---
source: lib/skill0/life/lovable/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: lovable
description: Lovable MCP 工具用法 —— 部署项目、向 agent 发消息、用 agent-browser 测试。通过委托本地 repo 来减少 credits。
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## 安装与完整 MCP 参考

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

完整 MCP 参考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

- Plan —— 需要 Pro/Business
- Auth —— 首次调用时浏览器 OAuth 提示
- Clients —— Claude Code、Claude Desktop、ChatGPT、Cursor、VS Code

## 核心工作流：本地优先，节省 credits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## 规则

- **必须 验证项目 ID** —— 在任何操作前调用 `list_projects query=<name>` 确认正确的 `project_id`。**永远不要 复用记忆里或上下文中之前的 ID。** 部署后等待 30 秒再验证线上站点，再回报成功。
- **必须 改前改后截图** —— 修改项目时，捕获 before-screenshot，做改动，捕获 after-screenshot。对比以确认意图。适用时发到 GitHub issue。**上传前抹除全部隐私数据**（令牌、个人信息、邮箱）。

## 常用 MCP 调用

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Usecase —— Analytics

快速总览：`list_projects publish_status=published` 返回每个项目的访客数。
以 TSV/CSV 导出，schema 为：`id, project, 24h, 7d, 30d, URL`。

详细分析（pageviews、跳出率、流量来源、设备）见 [ANALYTICS.md](ANALYTICS.md)。

## Usecase —— Knowledge（持久化给 Lovable agent 的指令）

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
永远先 `get` 再 `set` —— set 会整篇替换。最多 10K 字符。还有：`get/set_workspace_knowledge`。

## 用 agent-browser 测试

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
完整用法：见 skill0 `agent-browser`。

## 故障排查

- 站点未更新 —— `deploy_project`
- 改代码，本地存在 —— 本地 → push → deploy
- 改代码，无本地 —— `send_message`（高 credits 成本）
- 移动端测试 —— `agent-browser set device "iPhone 14"`

PWA 问题、同步问题等见 [TROUBLESHOOTING.md](TROUBLESHOOTING.md)。

## 更多信息

- [docs llms.txt](https://docs.lovable.dev/llms.txt) —— 完整文档索引
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) —— 产品中心、价格、指南、模板
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) —— Stripe、Supabase、Slack 等
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) —— 把 Notion、Linear、Jira 接入构建
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) —— 通过 REST 以编程方式构建应用

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) —— 验证流
- [prompt](../prompt/SKILL.md) —— 与 agent 通信
- [devloop](../devloop/SKILL.md) —— lovable 项目遵循 devloop 形态