# Lovable troubleshooting

属于 [lovable SKILL.md](SKILL.md)。完整 MCP 参考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

## 常见问题

- 部署后站点未更新 —— `deploy_project` —— 等 30 秒，先检查 lovable.app URL
- 改代码，本地 repo 存在 —— 本地改 → push → deploy
- 改代码，无本地 repo —— `send_message`（高 credits 成本）
- 移动端测试 —— `agent-browser set device "iPhone 14"`
- PWA 与浏览器表现不同 —— PWA（主屏幕）有独立的 cache/service worker —— 都要测
- Lovable 与 GitHub 不同步 —— 不要把 `send_message` 与本地编辑混用 —— 选一种工作流
- 需要比较编辑历史 —— `list_edits` / `get_diff` 与本地 `git log` 比对
- 部署成功但自定义域名显示旧版本 —— CDN 缓存 —— 等待或直接检查 lovable.app URL

## 关键教训

- **本地优先**：有本地 repo 时永远不要用 `send_message`。`send_message` 改的是 Lovable sandbox，可能与 GitHub 分叉。
- **PWA vs 浏览器**：iOS 主屏幕 PWA 有自己的 SW cache，与 Safari 分开。改动可能要更久才出现。
- **自定义域名**：`deploy_project` 返回 lovable.app URL。自定义域名指向同一构建但可能有 CDN 缓存延迟。
- **永远先 `get` 知识再 `set`**：`set_project_knowledge` 会整篇替换。