---
name: prompt
description: Quy ước về prompt engineering cho x-cmd — tái sử dụng qua biến template, quy tắc cấu trúc, các mẫu cưỡng chế an toàn.
metadata:
  related: "devloop,rule"
---


# Prompt

## Nguyên tắc cốt lõi: tái sử dụng, đừng nhân bản

Prompt trong x-cmd được lắp ghép từ các mảnh tái sử dụng, chứ không viết thành khối nguyên khối. Một prompt template chứa các biến `<PLACEHOLDER>` được giải quyết lúc chạy bởi module shell.

Ví dụ từ `claw`:
```
first_contact.md          # độc lập — được nạp vào <FIRST_CONTACT_PROMPT>
msg_telegram.md           # lắp ghép: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # cùng các mảnh, khác bộ chuyển đổi theo nền tảng
heartbeat.md              # quy trình khác, dùng chung <CHECK_PROMPT>
```

**Vì sao**: một bản sửa sẽ lan tỏa khắp mọi nơi. Các bộ chuyển đổi theo nền tảng (Telegram, Feishu, WeChat) chia sẻ quy tắc hành vi nhưng khác nhau ở lệnh gửi và giới hạn định dạng.

Xem [reusing.md](reusing.md) để biết các mẫu tái sử dụng chi tiết.

## Quy tắc cấu trúc

- Mỗi file prompt là một bộ chỉ dẫn hoàn chỉnh, tự chứa cho một kịch bản
- Dùng placeholder `<UPPER_CASE>` cho biến — không bao giờ nhúng dữ liệu thật
- Placeholder được giải quyết bởi module gọi, không phải bởi chính prompt
- Mảnh = hàm (logic và luồng), dữ liệu được nối thêm lúc chạy (giống như truyền đối số)

## Mẫu cưỡng chế an toàn

Quy tắc an toàn và hành vi PHẢI rõ ràng và dứt khoát:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

Hãy dùng MUST, NEVER, DO NOT. Xem [skill0-writer](../skill0-writer/SKILL.md) để biết quy tắc về ngôn ngữ an toàn.

## Mẫu hướng dẫn định dạng

Khi prompt nhắm tới nhiều nền tảng có khả năng định dạng khác nhau:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## Ví dụ thực tế

Các mảnh prompt hiện nằm trong `lib/data/prompt/` của từng module (ví dụ `claw/lib/data/prompt/`).
Chúng sẽ chuyển sang `skill0/lib/skill0/<subskill>/` — cùng cấu trúc, vị trí chuẩn.

Các ví dụ hiện tại trong `claw/lib/data/prompt/`:
- `first_contact.md` — chào workspace mới, mảnh tái sử dụng
- `heartbeat.md` — agent nền, đọc trạng thái workspace
- `msg_<platform>.md` — bộ xử lý tin nhắn theo từng nền tảng, dùng chung các mảnh chung

## Liên quan

- [devloop](../devloop/SKILL.md) — prompt thường chi phối các tác vụ devloop
- [rule](../rule/SKILL.md) — các quy tắc cấu trúc prompt được x rule cưỡng chế
