---
name: env
description: |
  Cài đặt và quản lý tức thời các gói phần mềm, runtime ngôn ngữ và công cụ CLI.
  Không rào cản — cài x-cmd là có mọi công cụ trong vài giây. Không cần sudo.
  Dùng cho "install", "package", "python", "node", "jq", "runtime", "tool".

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

Cài bất kỳ phần mềm nào trong tích tắc. Không sudo. Không làm bẩn hệ thống.

## Bắt đầu nhanh

```bash
# Cài x-cmd
eval "$(curl https://get.x-cmd.com)"

# Cài Python
x env use python

# Cài Node.js
x env use node

# Cài công cụ CLI
x env use jq
x env use fzf

# Dùng thử mà không cần cài vĩnh viễn
x env try python3 script.py
```

## Có sẵn những gì

Hơn 600 gói, bao gồm:

- Ngôn ngữ — python, node, go, bun, java, rust
- Công cụ CLI — jq, yq, fzf, himalaya
- Công cụ phát triển — claude-code, code-server

## Tính năng chính

- **Không sudo** — cài vào thư mục người dùng
- **Quản lý phiên bản** — cài và chuyển đổi phiên bản
- **Dùng thử trước khi cài** — `x env try` cho nhu cầu tạm thời
- **Dọn dẹp** — `x env clean` gỡ bỏ các gói không dùng

## skill0 này sẽ tiếp tục phát triển

Bắt đầu với những thứ cơ bản nhất. Sẽ bổ sung thêm:
- Các mẫu cài đặt phổ biến
- Mẹo ghim phiên bản
- Hướng dẫn thiết lập dự án đa ngôn ngữ

## Trải nghiệm đầy đủ

`x env --help` để xem mọi tùy chọn sau khi cài x-cmd.

## Liên quan

- [install](../install/SKILL.md) — x env use là một trong các kênh của install
- [x-cmd](../x-cmd/SKILL.md) — điểm vào bao trùm cho env