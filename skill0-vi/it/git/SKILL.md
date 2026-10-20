---
name: git
description: |
  Quản lý Git và các nền tảng lưu trữ mã nguồn — GitHub, GitLab, Codeberg, Forgejo.
  Không rào cản — cài x-cmd là quản lý repo ngay trên terminal.
  Dùng cho "git", "github", "gitlab", "repo", "pull request", "code hosting".

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

Quản lý repo Git và các nền tảng lưu trữ mã nguồn ngay từ dòng lệnh.

## Bắt đầu nhanh

```bash
# Cài x-cmd
eval "$(curl https://get.x-cmd.com)"

# Quản lý repo GitHub
x gh repo list
x gh repo clone owner/repo

# Tạo pull request
x gh pr create --title "Fix bug" --body "Description"

# Quản lý Git hooks
x git hook
```

## Có sẵn những gì

| Lệnh | Nền tảng | Mô tả |
|---------|----------|-------------|
| `x gh` | GitHub | Tích hợp đầy đủ GitHub CLI |
| `x gl` | GitLab | Quản lý project GitLab |
| `x cb` | Codeberg | Tích hợp Codeberg |
| `x git hook` | Local | Quản lý Git hooks |

## skill0 này sẽ tiếp tục phát triển

Bắt đầu với những nền tảng cơ bản của GitHub. Sẽ bổ sung thêm:
- Quy trình làm việc với GitLab
- Thực hành tốt khi lưu trữ mã nguồn
- Hướng dẫn di chuyển repo
- Mẹo tích hợp CI/CD

## Trải nghiệm đầy đủ

`x git --help` để xem mọi tùy chọn sau khi cài x-cmd.

## Liên quan

- [repo](../repo/SKILL.md) — khám phá/quản lý repo qua x repo