---
name: naming
description: |
  Khung đặt tên cho các module / lệnh / subcommand của x-cmd. Chủ quan + dựa trên kịch bản; skill này là một vỏ mỏng,
  KHÔNG phải sổ tay quy tắc. Ba lớp: khảo sát (goal), naming.<user-task>.yml (OKR + bản ghi phiên, một file .rule),
  naming.okr-creator.yml (meta-rule kiểm toán phiên làm việc đó).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

Việc đặt tên là **chủ quan + dựa trên kịch bản**. Skill này là một **khung**, không phải sổ tay quy tắc — nó không đóng đinh những quy tắc đặt tên chủ quan vào.

## Bản đồ nhanh

```
┌─────────────────────────────────────────────────────────┐
│  1. KHẢO SÁT mục tiêu                                   │
│     Đang đặt tên cho cái gì? Vai trò gì? Khái niệm nào? │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (file .rule)                │
│     - goal-*        (tác vụ đặt tên)                    │
│     - keyresult-*   (kết quả có thể kiểm chứng)         │
│     - task-*        (ràng buộc riêng của tác vụ)        │
│     - session:      (dấu vết kiểm toán trên rule goal)  │
│         prefer     (5 câu trả lời init-004)             │
│         init_verdicts  (quyết định gate mỗi ứng viên)   │
│         scores     (neo D1-D7 cho mỗi ứng viên)         │
│         final      (lựa chọn + dự phòng)                │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. KIỂM TOÁN với template/naming.okr-creator.yml       │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Quy trình — từng bước

### Bước 1 · Khảo sát mục tiêu

Trước khi viết bất cứ thứ gì, hãy trả lời các câu hỏi sau. Đừng bỏ qua — không có câu trả lời thì scorer không thể neo D4 (TRIAL/REAL) hoặc D5 (RUN/TEST).

- **Đang đặt tên cho cái gì?** — module / subcommand / field / variable — mỗi loại có quy tắc hình thức đặt tên khác nhau
- **Nó đóng vai trò gì?** — neo khái niệm (ví dụ "module trial-run" → runner độc lập, Stage 1 của kiểm thử hai giai đoạn)
- **Phải mang tiền đề nào?** — nghĩa của từ trần chủ đạo phải khớp (ví dụ trial-run cần TRIAL+RUN, chứ không phải REAL+TEST)
- **Phải tránh những tiền đề nào?** — ô nhiễm unittest (`*test`/`*case`), giả (`*mock`/`*fake`/`*stub`/`*dry`), triển khai thật (`field*`/`*live*`)
- **Nguyên mẫu nào hợp?** — ship / plane / rocket / factory / abstract — điều khiển D6/D7

Đầu ra: một câu mục tiêu một dòng, ví dụ
> "Chọn một tên module x-cmd độc lập cho trial-run (Stage 1 của kiểm thử hai giai đoạn) đạt 8.0+ điểm trên D1-D7, tự giải thích ngay khi nhìn thấy lần đầu, và vượt qua mọi fast-fail về đường viền đỏ / từ điển / độ dài."

### Bước 2 · Tạo bản ghi phiên làm việc

Sao chép template rồi cắt bớt / điền vào.

```bash
cp naming.template.yml naming.<user-task>.yml
```

Sau đó điền vào 4 mục (từ trên xuống dưới):

#### 2a. Rule goal (tác vụ đặt tên)

Thay `goal-TBD_task_id` bằng một ID thật. Hậu tố ID nên phản ánh tác vụ (ví dụ `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <one-line goal statement from Step 1>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <concept + role + anti-priors, from Step 1>
```

#### 2b. Key results (kết quả có thể kiểm chứng)

Thay từng `keyresult-kr*_TBD_short_label`. Mỗi KR là một rule phải PASS được. Thêm nhiều tùy theo tác vụ.

```yaml
keyresult-kr1-top-pick-committed:
  name: <verifiable outcome 1>
  level: error
  desc:
  - <what counts as passing — concrete criterion, not "looks good">
```

#### 2c. Rule riêng của tác vụ (ràng buộc lên các ứng viên)

Thay từng `TBD_task_id-*` bằng một ID ràng buộc thật khớp với hậu tố task-id của goal. Cắt bỏ những cái không áp dụng, thêm cái mới khi cần.

Các mẫu thường gặp:
- `must-be-X-not-Y` — căn cứ khái niệm (ví dụ `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — khoảng cứng của D1
- `must-imply-<archetype>` — ràng buộc của D7
- `<domain>-specific-acceptable` / `not-acceptable` — cho phép theo domain hẹp
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <constraint, e.g. "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <what the candidate must satisfy>
  - <which D1-D7 dimension this constrains>
  tldr:
  - wrong: <anti-example>
  - right: <good example>
```

#### 2d. Bản ghi phiên (dấu vết kiểm toán trên rule goal)

Điền đủ cả 4 mục con:

**prefer** — PHẢI trả lời cả 5 câu hỏi, kể cả khi câu trả lời là "không / yếu":
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<list of narrow domains OK, e.g. [naval]>]   # [] = không có domain hẹp nào OK
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — mỗi ứng viên được cân nhắc một mục, kể cả các ứng viên bị loại:
```yaml
init_verdicts:
  - { name: <candidate>, gate: init-005 | init-006 | init-007 | pass, reason: "<why>" }
  # init-005 = khớp mẫu đường viền đỏ (tự động loại)
  # init-006 = nghĩa đầu tiên trong từ điển trái với mục tiêu
  # init-007 = độ dài ngoài khoảng cho phép (< 2 hoặc > 8)
  # pass     = đã qua mọi init gate, đủ điều kiện chấm điểm
```

**scores** — mỗi ứng viên đã qua init một mục. Mọi điểm >= 6.0. Mỗi điểm PHẢI có neo:
```yaml
scores:
  - name: <candidate>
    score: <0_to_10>
    anchors:
      - "D1: <letter count evidence>"
      - "D2: <dictionary first meaning evidence>"
      - "D3: <compound literal evidence>"
      - "D4: <trial vs real evidence>"
      - "D5: <run vs test evidence>"
      - "D6: <vividness evidence>"
      - "D7: <large equipment evidence>"
    misses:
      - "<what's missing — only list real misses, not always all 7>"
```

**final** — tuyên bố lựa chọn + dự phòng:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### Bước 3 · Kiểm toán bằng meta-rule

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator (ở `template/naming.okr-creator.yml`) chạy 11 kiểm tra (pha trộn error và warn):

| Kiểm tra | Mức | Nó kiểm chứng điều gì |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | file có ≥1 rule `goal-*` |
| `okr-creator-002` has-keyresult-rules | error | file có ≥1 rule `keyresult-*` |
| `okr-creator-003` has-task-specific-rules | error | file có ≥1 rule tác vụ (không phải goal/keyresult) |
| `okr-creator-010` has-session-record | error | rule goal có trường `session:` |
| `okr-creator-011` prefer-answers-all-five | error | đã trả lời cả 5 câu hỏi init-004 |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts không rỗng |
| `okr-creator-013` scores-have-anchors | error | mọi điểm đều có danh sách neo không rỗng |
| `okr-creator-014` scores-no-below-6 | error | mọi điểm >= 6.0 |
| `okr-creator-015` final-section-present | error | đã khai báo `final.pick` |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | điểm của pick >= 7.0 |

**Nếu có kiểm tra mức error nào thất bại**: sửa file rồi chạy lại. Các cách sửa thường gặp:
- Thiếu trường prefer → thêm vào `session.prefer`
- Điểm trần trụi → thêm `anchors: [...]`
- Điểm < 6 → chuyển sang `init_verdicts` (bị loại) hoặc định khung lại cách chấm
- Thiếu final → thêm `final: { pick, backup }`

**Nếu có kiểm tra mức warn thất bại**: hãy quyết định xem có nên xử lý hay ghi nhận đánh đổi đó.

### Bước 4 · Người dùng chọn tên cuối cùng

Skill đề xuất; người dùng quyết định. Tên cuối cùng được khai báo trong `session.final.pick` và được commit.

## Các file

| File | Vai trò | Định dạng |
|---|---|---|
| `SKILL.md` | File này — quy trình + chỉ mục file | markdown |
| `naming.template.yml` | TEMPLATE với các placeholder `TBD_*` — sao chép, đổi tên, điền vào | `.rule` |
| `naming.trial-run-module.yml` | Ví dụ thực tế về một bản ghi phiên hoàn chỉnh | `.rule` |
| `template/naming-concept.yml` | Khung đánh giá khách quan (D1–D7, đường viền đỏ, neo chấm điểm) — dưới dạng các mục `.rule` | `.rule` |
| `template/naming-brand.yml` | Quy tắc thương hiệu x-cmd (độ dài, chữ hoa/thường, sở thích tiền đề) — dưới dạng các mục `.rule` | `.rule` |
| `template/naming.okr-creator.yml` | Meta-rule: kiểm toán một `naming.<user-task>.yml` (11 kiểm tra ở trên) | `.rule` |
| `template/naming-x-cmd-mod.yml` | Preset đặt tên module x-cmd tuỳ chọn (bản ghi phiên khởi đầu) | `.rule` |

## Phân tách chủ quan vs khách quan

| Khách quan (trong file / code) | Chủ quan (hỏi lúc init, không chấm điểm) |
|---|---|
| Nghĩa đầu tiên trong từ điển | "Tôi muốn sinh động hơn là trừu tượng" |
| Số chữ cái | "Tôi chấp nhận domain X" |
| Lớp ngữ nghĩa Trial / Real / Run / Test | "Tôi có chấp nhận ẩn dụ hải quân không" |
| Nghĩa nghĩa đen của từ ghép | "Tôi muốn gốc Trung Quốc hay gốc tiếng Anh" |
| Ô nhiễm tiền đề (unittest testcase, dryrun) | "Tôi muốn ngắn hơn là tự giải thích" |

## Quy tắc

- **PHẢI** khảo sát mục tiêu trước — đang đặt tên cho cái gì, nó đóng vai trò gì, khái niệm nào neo.
- **PHẢI** bắt đầu từ `naming.template.yml` (các placeholder `TBD_*`) và cắt bớt / điền vào theo yêu cầu của tác vụ.
- **PHẢI** tạo ra một `naming.<user-task>.yml` (định dạng `.rule`) với goal / key results / task rules / bản ghi phiên.
- **PHẢI** chạy `x rule check` với `template/naming.okr-creator.yml` để kiểm toán bản ghi phiên.
- **PHẢI** neo điểm vào các sự kiện khách quan — không bao giờ thổi phồng/hạ thấp dựa trên phản ứng của người dùng.
- **PHẢI** để người dùng chọn tên cuối cùng — skill đề xuất, người dùng quyết định.
- **KHÔNG ĐƯỢC** thêm quy tắc chủ quan vào `template/naming-concept.yml` — những thứ đó thuộc về `session.prefer` của từng tác vụ.

## Liên quan

- [rule](../rule/SKILL.md) — phiên đặt tên được kiểm tra qua x rule
- [score](../score/SKILL.md) — các ứng viên được chấm điểm qua khung score
- [ontology-database](../ontology-database/SKILL.md) — tên đã chọn được lưu lại trong ondb
