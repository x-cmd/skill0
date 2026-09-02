# Lovable analytics

属于 [lovable SKILL.md](SKILL.md)。完整 MCP 参考：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

## 所有项目快速总览

`list_projects` 返回每个项目的访客数 —— 无需逐个查询。

```bash
mcp__lovable__list_projects  workspace_id=<id>  publish_status=published
```

响应包含每个项目：
- `app_visitors_24h` / `app_visitors_7d` / `app_visitors_30d`
- `url` —— 线上站点 URL
- `trending_score`

这是跨项目比较流量最快的方式。

## 单项目详细分析

需要具体的 `project_id` 与日期范围（RFC 3339 格式）。

```bash
mcp__lovable__get_project_analytics  project_id=<id>  start_date="2026-05-01T00:00:00Z"  end_date="2026-06-01T00:00:00Z"
```

返回：visitors、pageviews、跳出率、session duration、按 page、source、device、country 的分布。
可选：`granularity="daily"` 或 `"hourly"`。

## 实时趋势

当前访客数 + 过去 30 分钟 5 分钟间隔的访问数。

```bash
mcp__lovable__get_project_analytics_trend  project_id=<id>
```

## 典型工作流

1. `list_projects publish_status=published` → 获取所有项目 ID + 访客摘要
2. 识别需要深入分析的项目
3. 用日期范围跑 `get_project_analytics` → pageviews、sources、devices
4. `get_project_analytics_trend` → 实时流量检查