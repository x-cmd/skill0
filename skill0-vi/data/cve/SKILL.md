---
name: cve
description: |
  Tra cứu hồ sơ CVE qua x cve — đã cache, không cần API key, TSV xz hằng ngày.
  Nạp cho cve, vulnerability id, kev, epss, nvd, cvelist, hoặc security advisory.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

TSV nén xz theo từng năm; năm hiện tại và năm trước tự động làm mới (TTL 1 giờ), các năm cũ hơn được giữ nguyên trong 180 ngày. Sau ngày trực tuyến đầu tiên, `x cve` hoạt động ngoại tuyến mãi mãi.

## Bắt đầu nhanh với `x cve`

```bash
x cve info CVE-2024-0001      # tra cứu theo id (dạng viết tắt: x cve 2024-0001)
x cve year 2024               # luồng theo từng năm, TSV thân thiện với pipe
x cve detail CVE-2024-0001    # hồ sơ upstream đầy đủ (sản phẩm, CWE, tham chiếu, ADP)
```

`x cve -h` cho mọi cờ, subcommand, và dạng viết tắt.

## Dữ liệu và các công cụ liên quan

TSV xz hằng ngày được phát hành tại `github.com/x-cmd/cve/releases/download/data/` (schema được ghi rõ trong release). Hồ sơ đã cache chỉ là một bản chiếu mỏng — với những câu hỏi đi xa hơn nó một bước:

- `x shodan cve CVE-X` — điểm EPSS, thành viên KEV, bài viết khai thác, thông báo của nhà cung cấp
- `x kev ls` — danh mục KEV của CISA (danh sách bị khai thác đã biết, bảng đầy đủ)
- `x osv` — truy vấn theo phiên bản của từng gói ("phiên bản của tôi có dính lỗi không"); chấp nhận id `osv-*` và `cve-*`
- `x cve detail` — JSON thô từ `CVEProject/cvelistV5` (upstream chuẩn, tải về theo yêu cầu)
