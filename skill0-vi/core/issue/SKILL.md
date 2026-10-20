---
name: issue
description: Quản lý issue cho devloop — các mẫu cho goal, rule.yml, key-results, và vòng đời issue.
metadata:
  related: "devloop,repo"
---


# issue

Là một phần của [devloop](../devloop/SKILL.md).

## Mẫu issue dev mới

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Vòng đời issue

| Giai đoạn | Hành động | Nội dung bình luận |
|-------|--------|-----------------|
| Đã tạo | `gh issue create` với mẫu | goal, key-results, rule.yml |
| Đang thực hiện | Cập nhật khi công việc tiến triển | ghi chú tiến độ, ảnh chụp giữa chừng |
| Đã kiểm chứng | `x rule check` vượt qua | kết quả rule check, ảnh chụp sau |
| Đã đóng | `gh issue close` | commit SHA, tóm tắt kiểm chứng cuối cùng |

## Mẫu bình luận hoàn tất

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## Quy tắc

- **PHẢI** bao gồm `goal` và `keyresults` trong mọi issue dev — không có ngoại lệ
- **PHẢI** đăng rule.yml dưới dạng code block trong phần thân issue hoặc bình luận đầu tiên
- **PHẢI** chụp ảnh trước và sau đối với thay đổi frontend
- **KHÔNG BAO GIỜ** đóng issue mà không có bằng chứng kiểm chứng
- Liên kết issue với project board để minh bạch roadmap

## Liên quan

- [devloop](../devloop/SKILL.md) — tracker cho các vòng lặp theo mục tiêu (goal/rule.yml/KRs)
- [repo](../repo/SKILL.md) — issue gắn với repo trong bố cục x-repo
