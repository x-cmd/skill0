---
name: wikipedia
description: |
  Tìm kiếm và đọc Wikipedia qua x wkp — MediaWiki API, không cần API key,
  không cần cài gì; tra cứu, trích xuất, gợi ý và định tuyến DDG gói trong một module.
  Nạp cho wiki, wikipedia, tra cứu bách khoa, tóm tắt bài viết.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

Đầu ra là một đoạn trích dạng văn bản thuần (~đoạn đầu tiên + infobox). Động từ của subcommand quyết định hình dạng kết quả — `hop` để tìm rồi tóm tắt, `extract` cho tiêu đề đã biết, `search` để liệt kê ứng viên, `suggest` cho gợi ý "ý bạn là gì". Site mặc định là Wikipedia tiếng Anh; `--lang` / `--api-url` để chuyển sang wiki khác.

## Bắt đầu nhanh với `x wkp`

```bash
x wkp hop Python                      # tìm kiếm + trích xuất kết quả đầu tiên trong một lệnh
x wkp extract OpenAI                  # tóm tắt một trang đã biết
x wkp search "Linux kernel"           # liệt kê ứng viên khi chưa chắc tiêu đề
x wkp suggest pythen                  # gợi ý sửa lỗi chính tả trước khi tìm kiếm
```

Dùng `x wkp -h` để xem tất cả cờ và subcommand.

## Dữ liệu và công cụ liên quan

Nguồn thượng nguồn: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. Các dự án cùng họ (Wikidata, Wiktionary, Commons) cũng truy cập được theo cách tương tự; chỉ cần trỏ `--api-url` tới subdomain tương ứng.

Với những câu hỏi đi xa hơn một bước so với bản tóm tắt wikitext:
- `x wkp : <query>` / `x wkp ddgo <query>` — cùng module `x wkp`, được định tuyến qua chỉ mục Wikipedia của DuckDuckGo (xử lý tốt hơn tìm theo tiêu đề với truy vấn mơ hồ hoặc khẩu ngữ)
- `x ddgo <query>` — tìm kiếm web chung, hữu ích khi Wikipedia không có bài viết nhưng chủ đề vẫn tồn tại trên web mở
- Xem skill [knowledge](../knowledge/SKILL.md) để có bộ công cụ nghiên cứu đầy đủ hơn với `x hn` / `x rfc` / `x se`
- `x wkp open <page>` — chuyển sang trình duyệt khi bạn thực sự cần trang đã render (infobox, bảng, hình ảnh)
