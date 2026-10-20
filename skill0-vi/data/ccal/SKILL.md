---
name: ccal
description: |
  Lịch vùng Trung Quốc với 调休, 农历, 节气, 生肖, 黄历吉凶、干支纪年.
  Nhiều cách truy cập: `x ccal`, tải trực tiếp archive, hoặc tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — quy tắc cho phép mượn ngày cuối tuần để tạo ngày nghỉ giữa tuần, hoặc bù lại một ngày giữa tuần khi ngày lễ rơi vào cuối tuần — là tính năng then chốt cho người dùng Trung Quốc khi lên kế hoạch theo lịch làm việc chính thức.

## Bắt đầu nhanh với `x ccal`

```bash
# Hiển thị toàn bộ thông tin ngày ở dạng tsv. Các cột TSV như sau:
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三个状态:休，工，无-非调休导致的假期或工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# Hiển thị toàn bộ thông tin ngày ở dạng tsv
x ccal ls 2026-07
# Ngày cụ thể ở dạng YAML
x ccal info 2026-05-31
# Lấy thư mục dữ liệu. Nếu nó rỗng, hãy thử `x ccal update`
x ccal datadir
```

`x ccal -h` để biết thêm thông tin.

Lưu ý: nguồn dữ liệu là https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

Để tiết kiệm dung lượng, `x ccal` duyệt file tar.xz bằng lệnh tar mà không cần giải nén. Chúng tôi khuyến khích cách làm này, nhưng nếu bạn cần xử lý tự do hơn, bạn có thể giải nén tùy ý.
