# Lovable analytics

屬於 [lovable SKILL.md](SKILL.md)。完整 MCP 參考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

## 所有項目快速總覽

`list_projects` 返回每個項目的訪客數 —— 無需逐個查詢。

```bash
mcp__lovable__list_projects  workspace_id=<id>  publish_status=published
```

響應包含每個項目：
- `app_visitors_24h` / `app_visitors_7d` / `app_visitors_30d`
- `url` —— 線上站點 URL
- `trending_score`

這是跨項目比較流量最快的方式。

## 單項目詳細分析

需要具體的 `project_id` 與日期範圍（RFC 3339 格式）。

```bash
mcp__lovable__get_project_analytics  project_id=<id>  start_date="2026-05-01T00:00:00Z"  end_date="2026-06-01T00:00:00Z"
```

返回：visitors、pageviews、跳出率、session duration、按 page、source、device、country 的分佈。
可選：`granularity="daily"` 或 `"hourly"`。

## 實時趨勢

當前訪客數 + 過去 30 分鐘 5 分鐘間隔的訪問數。

```bash
mcp__lovable__get_project_analytics_trend  project_id=<id>
```

## 典型工作流

1. `list_projects publish_status=published` → 獲取所有項目 ID + 訪客摘要
2. 識別需要深入分析的項目
3. 用日期範圍跑 `get_project_analytics` → pageviews、sources、devices
4. `get_project_analytics_trend` → 實時流量檢查