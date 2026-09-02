# Lovable troubleshooting

屬於 [lovable SKILL.md](SKILL.md)。完整 MCP 參考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

## 常見問題

- 部署後站點未更新 —— `deploy_project` —— 等 30 秒，先檢查 lovable.app URL
- 改代碼，本地 repo 存在 —— 本地改 → push → deploy
- 改代碼，無本地 repo —— `send_message`（高 credits 成本）
- 移動端測試 —— `agent-browser set device "iPhone 14"`
- PWA 與瀏覽器表現不同 —— PWA（主屏幕）有獨立的 cache/service worker —— 都要測
- Lovable 與 GitHub 不同步 —— 不要把 `send_message` 與本地編輯混用 —— 選一種工作流
- 需要比較編輯歷史 —— `list_edits` / `get_diff` 與本地 `git log` 比對
- 部署成功但自定義域名顯示舊版本 —— CDN 緩存 —— 等待或直接檢查 lovable.app URL

## 關鍵教訓

- **本地優先**：有本地 repo 時永遠不要用 `send_message`。`send_message` 改的是 Lovable sandbox，可能與 GitHub 分叉。
- **PWA vs 瀏覽器**：iOS 主屏幕 PWA 有自己的 SW cache，與 Safari 分開。改動可能要更久才出現。
- **自定義域名**：`deploy_project` 返回 lovable.app URL。自定義域名指向同一構建但可能有 CDN 緩存延遲。
- **永遠先 `get` 知識再 `set`**：`set_project_knowledge` 會整篇替換。