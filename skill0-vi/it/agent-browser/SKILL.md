---
name: agent-browser
description: Tự động hóa trình duyệt qua Chrome/Chromium CDP — mở trang, chụp cây trạng thái, click, chụp màn hình. Dành cho kiểm thử web app, bố cục di động và tương tác tự động mà không cần Playwright/Puppeteer.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## Cài đặt

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # tùy chọn, bỏ qua nếu dùng Chrome sẵn có
```

## Kết nối với Chrome đang chạy

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profile & đa phiên

Dùng `--profile /tmp/ab-default` để xác thực một lần rồi dùng chung cho mọi phiên.
Mỗi `--user-data-dir` mới sẽ kích hoạt lại lời nhắc đăng nhập của Chrome — hãy dùng lại profile mặc định để tránh điều đó.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

Tên phiên có phạm vi toàn cục — hãy dùng `<project>-<device>` để tránh trùng tên giữa các agent.
Các phiên dùng chung daemon nhưng hoàn toàn cách ly (cookie, cache, tab).

## Kỹ năng & các lệnh thường dùng

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

Dữ liệu sẽ tích tụ dần — xem [CLEANUP.md](CLEANUP.md) để biết cách dọn dẹp định kỳ.

## Liên quan

- [install](../install/SKILL.md) — cài đặt/khởi chạy qua các kênh của x install
- [devloop](../devloop/SKILL.md) — được dùng để đối chiếu hình ảnh trước/sau trong devloop
- [lovable](../../life/lovable/SKILL.md) — lovable định tuyến việc kiểm chứng web qua agent-browser