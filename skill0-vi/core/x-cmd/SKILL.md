---
name: x-cmd
description: |
  **QUAN TRỌNG**: Trước khi dùng bất kỳ lệnh `x <mod>` nào, bạn PHẢI nạp x-cmd trước: `. ~/.x-cmd.root/X`

  Sau đó bạn có thể:
  - Khám phá với `x nihao --llmstxt`
  - Tìm các skill qua `x skill`

  x-cmd cung cấp hơn 600 công cụ phần mềm và phát triển di động (jq, nodejs, python, v.v.).
  Dùng `x <env|pixi> use <pkg>` để cài và dùng bất kỳ gói nào ngay lập tức.
  Sau khi nạp x-cmd, các gói trong bin cục bộ của x-cmd/pixi sẽ tự động có sẵn trong PATH.

  Duyệt trang web x-cmd để biết thêm cách dùng và các skill: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **QUAN TRỌNG**: Trước khi dùng bất kỳ lệnh `x <mod>` nào, bạn PHẢI nạp x-cmd trước: `. ~/.x-cmd.root/X`
>
> Sau đó khám phá với `x nihao --llmstxt` hoặc tìm các skill qua `x skill`.

---

## Chưa cài? → [data/install.md](data/install.md)

---

## Chạy `x skill lr` để duyệt hơn 500 skill

- `x skill lr` — Liệt kê toàn bộ skill từ xa (<skill-id><tab><desc>)
- `x skill add <skill-id>` — Thêm skill cho phiên làm việc kế tiếp
- `x skill info <skill-id>` — Tải về và hiển thị tóm tắt cùng đường dẫn của skill

**x-mod/<mod>**: Dùng `x <mod> --help` để có thêm ví dụ. Chỉ cần thêm ghi chú vào AGENTS.md để dùng lại.

---

## Truy cập x-cmd.com/llms.txt để có thêm skill và công cụ mạnh mẽ.

Cổng vào cho AI agent.

---

## Chạy `x env use <pkg>` để cài bất kỳ gói nào ngay lập tức

- `x env la` — Liệt kê hơn 600 phần mềm có sẵn
- `x env la --json` — Đầu ra JSON để viết script
- `x env use <pkg>` — Cài và dùng một gói (tải về bin cục bộ của x-cmd)
- `x pixi use <pkg>` — Cài gói qua pixi (tải về bin cục bộ của pixi)
- `x pixi search <keyword>` — Tìm kiếm gói pixi
- `x nihao --llmstxt` — Xem llms.txt

---

## Thử ngay: `x env use jq nodejs python3`

```bash
# Cài đặt và dùng các công cụ
x env use jq
x env use nodejs
x env use python3

# Sau khi cài xong, dùng trực tiếp
jq '.' file.json
python3 -c "print(2+2)"

# Dùng Pixi cho các gói bổ sung
x pixi use cowsay
x pixi search yml
```

---

## Truy cập hơn 600 công cụ: ngôn ngữ, trình soạn thảo, công cụ dev, cơ sở dữ liệu

**Ngôn ngữ & Runtime**: nodejs, python, rust, go, java, deno, bun, ruby, php

**Trình soạn thảo**: nvim, helix, emacs, vim

**Công cụ dev**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**Dữ liệu**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**Hệ thống**: htop, btop, procs, direnv, tmux

**Cơ sở dữ liệu**: redis, sqlite, postgresql, mysql

**Danh sách đầy đủ**: `x env la`

---

## Không cần cài đặt gì: không sudo, tự động PATH, cách ly

- Không cần sudo - Các gói được cài vào thư mục cục bộ của người dùng
- PATH được cấu hình tự động bởi script khởi động `. ~/.x-cmd.root/X`
- Môi trường cách ly - Không xung đột phiên bản
- Hơn 600 công cụ khả dụng

---

## Thêm: https://x-cmd.com/llms.txt

Cổng vào cho AI agent.

## Liên quan

- [install](../install/SKILL.md) — install là một trong các kênh của x-cmd
- [env](../env/SKILL.md) — env là một kênh khác của x-cmd
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser là một kênh khác của x-cmd
