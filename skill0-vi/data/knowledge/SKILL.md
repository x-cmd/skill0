---
name: knowledge
description: |
  Tìm kiếm Hacker News, Wikipedia, DuckDuckGo, tài liệu RFC và Stack Exchange ngay trên dòng lệnh.
  Không rào cản — cài x-cmd rồi bắt đầu tìm kiếm.
  Dùng cho "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow".

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

Tìm kiếm các nguồn tri thức trên internet ngay trên dòng lệnh.

## Bắt đầu nhanh

```bash
# Cài x-cmd
eval "$(curl https://get.x-cmd.com)"

# Bài đăng top trên Hacker News
x hn top

# Tìm kiếm Wikipedia
x wkp "trí tuệ nhân tạo"

# Tìm kiếm DuckDuckGo
x ddgo "ngôn ngữ lập trình rust"

# Tài liệu RFC
x rfc 2616

# Tìm kiếm Stack Exchange
x se "cách thoát vim"
```

## Những gì đang có

| Lệnh | Nguồn | Ví dụ |
|---------|--------|---------|
| `x hn top` | Hacker News | 10 bài đăng thịnh hành nhất |
| `x hn new` | Hacker News | Bài đăng mới nhất |
| `x wkp <query>` | Wikipedia | Tìm bài viết |
| `x ddgo <query>` | DuckDuckGo | Tìm kiếm trên web |
| `x rfc <number>` | Tài liệu RFC | Đọc đặc tả RFC |
| `x se <query>` | Stack Exchange | Tìm trong hỏi đáp |

## skill0 này sẽ tiếp tục phát triển

Bắt đầu với những thứ cơ bản. Sẽ bổ sung:
- Thêm nguồn (Project Gutenberg, arxiv)
- Các mẫu tìm kiếm nâng cao
- Mẹo lọc và định dạng kết quả

## Trải nghiệm đầy đủ

`x knowledge --help` để xem tất cả tùy chọn sau khi cài x-cmd.

## Liên quan
