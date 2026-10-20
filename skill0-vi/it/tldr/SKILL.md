---
name: tldr
description: |
  Tra cứu lệnh với ví dụ thực tế từ dự án tldr-pages.
  Không rào cản — dùng với x-cmd, curl hoặc bất kỳ tldr client nào.
  Dùng cho "tldr", "cheatsheet", "command help", "examples", "how to".

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

Tra cứu lệnh nhanh với ví dụ đời thường. Dễ dùng hơn man page cho câu hỏi "lệnh này dùng thế nào?".

## Bắt đầu nhanh

```bash
# Với x-cmd
x tldr git                    # Ví dụ dùng git
x tldr --lang zh python       # Tài liệu tiếng Trung
x tldr --fz                   # Tìm kiếm tương tác

# Không dùng x-cmd — dùng curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# Hoặc cài một tldr client
pip install tldr
npm install -g tldr
tldr tar
```

## Có sẵn những gì

- `x tldr <cmd>` — Hiện ví dụ cho một lệnh
- `x tldr --lang zh <cmd>` — Ngôn ngữ Trung Quốc
- `x tldr --fz` — Tìm kiếm fzf tương tác
- `x tldr --cat <cmd>` — Hiện markdown gốc
- `x tldr --ls` — Liệt kê toàn bộ lệnh có sẵn
- `x tldr --update` — Cập nhật bộ nhớ đệm trang

## Các lựa chọn chạy độc lập

- Trực tuyến: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- Trang gốc: github.com/tldr-pages/tldr

## skill0 này sẽ tiếp tục lớn lên

Bắt đầu từ phần cốt lõi. Sẽ bổ sung:
- Các mẫu lệnh thường gặp
- Ghi chú riêng theo nền tảng
- Tích hợp với quy trình làm việc của agent

## Related

- [git](../git/SKILL.md) — tldr cho các lệnh con git thường dùng
- [install](../install/SKILL.md) — tldr cho các lệnh con install
