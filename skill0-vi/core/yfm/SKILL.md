---
name: yfm
description: |
  YAML front matter (YFM) cho bất kỳ bài viết markdown nào. Mặc định của x-cmd là ba trường cấp cao nhất: `tags`, `description`, `memo`. Mặc định mượn hình dạng frontmatter của Agent Skills — xem <https://agentskills.io/specification>. Module yfm là công cụ phụ trợ: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## Áp dụng YFM

Hãy dùng YFM cho bất kỳ file markdown nào mà agent, chỉ mục, hay pipeline ontology có thể quét. **Hãy theo dialect đang có sẵn nếu repo đã dùng dialect đó** (Agent Skills, Obsidian, Jekyll, Hugo, v.v.) — mặc định của x-cmd chỉ áp dụng khi không có dialect nào khác chi phối.

## Mặc định của x-cmd: ba trường

```yaml
---
tags: [design, front-matter]
description: Một câu tóm tắt để người đọc quyết định có mở file này không.
memo:
  2026-07-31T14:30:00+08:00: Bỏ aliases; đổi tên trường thứ ba thành memo.
---

# Tiêu đề

Nội dung...
```

- **`tags`** — danh sách slug `[a-z0-9-]` ở cấp cao nhất. Bên tiêu thụ: bộ thu thập cho việc lập chỉ mục ontology.
- **`description`** — chuỗi ở cấp cao nhất. Một câu. Không phải `description:` của Agent Skills (đó là yêu cầu chỉ dành cho SKILL.md, do `skill0-writer` quản lý).
- **`memo:`** — map ở cấp cao nhất, là nhật ký sửa đổi của file. Khoá là dấu thời gian ISO 8601 (`YYYY-MM-DDTHH:mm:ss±HH:mm`, theo múi giờ địa phương của tác giả); giá trị là mô tả thay đổi ngắn. Mới nhất trước. Bỏ qua khi không có lịch sử nào đáng ghi.

### Phạm vi áp dụng

- `<project>/.x-cmd/story/` — mở rộng với `issue:` — xem [usecase/story.md](usecase/story.md).
- Nội dung issue / PR của GitHub — mở rộng với `repo:`, `number:` — xem [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md).
- `README.md` của GitHub — chỉ các trường mặc định.

## Module

Module yfm là công cụ phụ trợ. Ba lệnh:

- `x yfm ls [path]` — liệt kê các khối YFM; mặc định là thư mục hiện tại
- `x yfm init [path]` — ghi một khối mặc định của x-cmd vào mỗi file markdown dưới path
- `x yfm lint [path]` — kiểm tra rằng mỗi khối YFM là YAML hợp lệ và tuân theo dialect mà nó tuyên bố

## Đọc front matter của dialect khác

Bộ thu thập tiêu thụ nhiều dialect khác nhau. Về đặc tả mà mặc định mượn, xem <https://agentskills.io/specification>. Theo từng dialect:

- [Agent Skills](usecase/agentskills.md) — `metadata:` là string→string; cấp cao nhất là đóng
- [Obsidian](usecase/obsidian.md) — dành riêng cho `tags` / `aliases` / `cssclasses`
- [Jekyll](usecase/jekyll.md) — danh sách hoặc phân tách bằng **dấu cách**
- [Hugo](usecase/hugo.md) — có thể là TOML; taxonomy do site cấu hình

