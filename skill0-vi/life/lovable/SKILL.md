---
name: lovable
description: Cách dùng công cụ Lovable MCP — deploy dự án, gửi tin nhắn cho agent, kiểm thử bằng agent-browser. Tiết kiệm credits bằng cách ủy thác cho repo cục bộ.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Cài đặt & tham chiếu MCP đầy đủ

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Tham chiếu MCP đầy đủ: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Cần gói Pro/Business
- Auth — Nhắc OAuth trên trình duyệt ở lần gọi đầu tiên
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Quy trình chính: ưu tiên cục bộ, tiết kiệm credits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Quy tắc

- **PHẢI xác minh project ID** — gọi `list_projects query=<name>` để xác nhận đúng `project_id` trước mọi hành động. **TUYỆT ĐỐI không dùng lại ID từ trí nhớ hoặc ngữ cảnh trước đó.** Sau khi deploy, chờ 30 giây rồi xác minh trang đang chạy trước khi báo thành công.
- **PHẢI chụp ảnh trước & sau** — khi sửa một dự án, chụp ảnh trước, thực hiện thay đổi, rồi chụp ảnh sau. So sánh để xác nhận ý định. Đăng lên GitHub issue khi phù hợp. **Quét sạch mọi dữ liệu riêng tư** (token, thông tin cá nhân, email) trước khi tải lên.

## Các lệnh MCP thường dùng

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Use case — Analytics

Tổng quan nhanh: `list_projects publish_status=published` trả về số lượt truy cập của từng dự án.
Xuất ra TSV/CSV với schema: `id, project, 24h, 7d, 30d, URL`.

Xem phân tích chi tiết (lượt xem trang, tỷ lệ thoát, nguồn lưu lượng, thiết bị) tại [ANALYTICS.md](ANALYTICS.md).

## Use case — Knowledge (chỉ dẫn lưu lâu dài cho Lovable agent)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Luôn `get` trước `set` — set thay thế toàn bộ. Tối đa 10K ký tự. Ngoài ra còn có: `get/set_workspace_knowledge`.

## Kiểm thử bằng agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Cách dùng đầy đủ: xem skill0 `agent-browser`.

## Khắc phục sự cố

- Site chưa cập nhật — `deploy_project`
- Đổi code, đã có bản cục bộ — Cục bộ → push → deploy
- Đổi code, không có bản cục bộ — `send_message` (tốn nhiều credits)
- Kiểm thử trên di động — `agent-browser set device "iPhone 14"`

Vấn đề PWA, vấn đề đồng bộ và những điều khác, xem [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Tìm hiểu thêm

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — chỉ mục tài liệu đầy đủ
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — trung tâm sản phẩm, bảng giá, hướng dẫn, mẫu
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack, v.v.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — đưa Notion, Linear, Jira vào các bản build
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — xây app theo lập trình qua REST

## Liên quan

- [agent-browser](../../it/agent-browser/SKILL.md) — quy trình xác minh
- [prompt](../prompt/SKILL.md) — giao tiếp với agent
- [devloop](../devloop/SKILL.md) — dự án lovable tuân theo hình dạng devloop
