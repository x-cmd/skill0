---
name: devloop
description: Vòng lặp phát triển dựa trên mục tiêu — xác định objective, viết rule kèm key-results, kiểm chứng bằng mắt, đồng bộ sang issue tracker.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Thiết lập

```
x rule init :ror                          # hoặc ruleset riêng cho dự án
x env use agent-browser                   # để kiểm chứng bằng mắt
```

## Quy trình

```
goal → rule.yml → code → verify → issue
```

### 1. Xác định goal → viết rule.yml

Trước khi viết code, hãy tạo một rule.yml cho tác vụ:

```yaml
goal: "Sửa bản tiếng Anh hiển thị tag tiếng Trung ở mục Features"
keyresults:
  - kr-1: "Tag Features ở chế độ tiếng Anh đều là tiếng Anh"
  - kr-2: "Tag Features ở chế độ tiếng Trung vẫn là tiếng Trung"
  - kr-3: "Build vượt qua mà không gây hồi quy"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - Khi language=en, mọi phần tử details[] phải là tiếng Anh
    - Không có ký tự Trung Quốc trong bất kỳ tag badge nào ở chế độ tiếng Anh
```

Các trường của rule: `id`, `name`, `apply`, `level`, `desc`, `tldr`. Xem `x rule -h`.

**PHẢI** bao gồm `goal` và `keyresults` — hai trường bắt buộc của mọi tác vụ dev.

### 2. Thực thi → kiểm chứng bằng mắt (frontend)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... thực hiện thay đổi ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**PHẢI** chụp ảnh trước và sau. So sánh với ý định ban đầu:
1. Kiểm tra bằng thị giác của AI: after.png có khớp với goal không?
2. Nếu không khớp → lặp lại và chụp lại ảnh
3. **Loại bỏ mọi dữ liệu riêng tư** (token, email, thông tin cá nhân) trước khi tải lên

### 3. Kiểm chứng bằng x rule

```
x rule scan <files>     # nhanh (~1 phút), cho vòng lặp nội bộ
x rule check <files>    # kỹ (~10 phút)
x rule audit <files>    # báo cáo đầy đủ (~30 phút)
```

### 4. Đồng bộ sang issue tracker

Xem [issue/SKILL.md](../issue/SKILL.md). Tối thiểu: đăng goal, key-results, rule.yml, ảnh chụp trước/sau vào issue.

## Công cụ agent

- `x rule scan` — kiểm tra nhanh trong lúc lặp
- `x rule check` — tuân thủ đầy đủ trước khi commit
- `agent-browser screenshot` — bằng chứng trực quan trước/sau
- `gh issue create/comment` — đồng bộ goal + rule.yml sang tracker

## Liên quan

- [rule](../rule/SKILL.md) — rule.yml là bộ khung xác minh
- [score](../score/SKILL.md) — chấm điểm KR dùng khung score
- [install](../install/SKILL.md) — thiết lập môi trường dev
- [agent-browser](../../it/agent-browser/SKILL.md) — kiểm chứng trực quan trước/sau
- [issue](../issue/SKILL.md) — đồng bộ goal + KR + ảnh chụp sang issue tracker
- [repo](../repo/SKILL.md) — pull/push công việc trong repo
- [prompt](../prompt/SKILL.md) — quy ước prompt thường chi phối các tác vụ devloop
