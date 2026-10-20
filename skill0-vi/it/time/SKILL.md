---
name: time
description: |
  Đo thời gian thực thi lệnh — độ chính xác micro giây, phân tích thống kê, so sánh.
  Không rào cản — dùng với x-cmd hoặc lệnh time dựng sẵn của shell.
  Dùng cho "timing", "benchmark", "performance", "profiling".

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

Đo thời gian thực thi lệnh. Từ đo một lần ở mức micro giây đến phân tích thống kê qua nhiều lần chạy.

## Bắt đầu nhanh

```bash
# Với x-cmd
x time <command>                      # Đo một lần, độ chính xác micro giây
x time stress -c 100 <command>        # Thống kê 100 lần chạy
x time cmp 'cmd1' 'cmd2' 'cmd3'      # So sánh các lệnh

# Không dùng x-cmd — dùng lệnh dựng sẵn của shell
time <command>                        # Đo cơ bản
# Để benchmark, hãy dùng vòng lặp:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## Có sẵn những gì

- `x time <cmd>` — Một lần chạy, độ chính xác micro giây
- `x time getms <cmd>` — Độ chính xác milli giây
- `x time stress -c N <cmd>` — N lần chạy kèm thống kê đầy đủ
- `x time stress -b N <cmd>` — Tự quyết định số lần chạy trong ngân sách
- `x time cmp 'c1' 'c2'` — So sánh nhiều lệnh

## Định dạng đầu ra

- `--csv` CSV để phân tích bằng chương trình
- `--tsv` Phân tách bằng tab
- `--yml` YAML

## skill0 này sẽ tiếp tục lớn lên

Bắt đầu từ phần cốt lõi. Sẽ bổ sung:
- Các mẫu benchmark
- Hướng dẫn diễn giải thống kê
- Những anti-pattern hiệu năng thường gặp

## Related
