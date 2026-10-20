---
name: skill0
description: "Chỉ mục gốc của các sub-skill skill0 của x-cmd. Định nghĩa quy trình agent theo phong cách OKR (mục tiêu → kết quả đã được rule xác minh → thực thi), cách khám phá skill, và sở thích về công cụ agent. Văn phong: nguyên tắc trước, súc tích, giao phần chi tiết cho các nguồn bên ngoài có thẩm quyền."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 mã hóa nguyên tắc, không mã hóa dữ liệu

LLM liên tục hấp thụ kiến thức thường; việc của skill0 là mã hóa các quy ước và con trỏ nguồn, rồi mỏng dần theo thời gian khi LLM theo kịp. Hãy kiểm chứng bằng dữ liệu bên thứ nhất (`x rfc`, `x cve`, `x wkp`, `agent-browser`) và thực hành tốt nhất hiện tại (`x skill`, `x clawhub`), rồi dựng lại bằng logic hình thức thay vì ghi nhớ.

## Các sub-skill tạo thành một đồ thị có hướng trên 4 bucket

Các bucket: `core/`, `data/`, `it/`, `life/`. Đường dẫn: `<bucket>/<slug>/SKILL.md`. Danh mục máy đọc được (name + description) nằm ở [index.tsv](index.tsv). Trước đây có một tài liệu đặt ở đây với vai trò hướng dẫn tương tác cho manager/lifestyle; nó đã được chuyển sang [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) vì không thuộc đồ thị skill0.

## Goal → keyresults → x-rule là quy trình OKR

Objective: Điều gì cần đạt được
Key Results: Cách kiểm chứng
Verification: `x rule check/audit`

## Sau khi dựng khung, ưu tiên dùng công cụ x-cmd để thực thi

- `x skill` — danh mục skill do x-cmd tuyển chọn và con người đã duyệt.
- `x clawhub` — sổ đăng ký skill toàn cầu. **Cảnh báo**: tải lên miễn phí, **phải** chạy `x clawhub skill moderate <name>` để có báo cáo an toàn được tạo tự động.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — quản lý dự án, lên lịch, agent nền, ontology, wiki. Chạy `x [mod] --help`.

## Mỗi SKILL.md đều phải vượt qua skill0-writer

Xem [skill0-writer](core/skill0-writer/SKILL.md) để biết các quy ước.
