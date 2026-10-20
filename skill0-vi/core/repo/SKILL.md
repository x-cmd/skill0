---
name: repo
description: Quy ước + công cụ về nơi các repo do agent clone đặt ở đâu và worktree của chúng được sắp xếp ra sao. Mặc định là bare repo tại `~/.x-repo/.bare/<provider>/<owner>/<name>.git` với các working tree liên kết nằm dưới `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]`. Khám phá qua `x repo ls`. Quản lý worktree qua `x repo wt`. Dùng cho "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path".
metadata:
  related: "git"
---

# repo

## Vì sao

Mọi bản clone đều hội tụ về `~/.x-repo/<provider>/<owner>/<name>`. Cùng một đường dẫn cho mọi agent, con người, CI — có thể mount vào container hoặc sandbox của agent để họ dùng chung mà không phải clone lại. Một gốc duy nhất để sao lưu; khám phá được qua `x repo ls`. Bố cục mirror đường dẫn github nên `../<sibling>` từ bất kỳ worktree nào cũng trỏ tới worktree mặc định của sibling đó — các config và script tham chiếu tới sibling hoạt động đồng nhất trên mọi wt và agent.

## Bố cục đường dẫn

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- default wt: `~/.x-repo/<provider>/<owner>/<name>`
- designed wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname là bất kỳ định danh nào cho workspace này: tên agent/worker, tên branch, tag, SHA ngắn, issue id, chuỗi tự do. Ký tự `/` trong wtname được mã hóa thành `~`.

Mặc định, repo là bare kèm worktree liên kết — bản bare nằm trong `.bare/`, tách khỏi thư mục worktree, nên `rm -rf` một wt không thể chạm tới nó. `git clone` thuần cũng được chấp nhận (`x repo ls/which/update` nhìn thấy nó) nhưng không có lớp bảo vệ theo hình học. Khi đó hãy cẩn thận: đừng `rm -rf`, hãy ưu tiên `git worktree remove`, và tránh các heuristic dọn dẹp nhắm vào `.git/`. Công việc giữa chừng mất đi theo cách này không thể gộp lại với repo gốc.

## Các lệnh

```bash
x repo <id>                      # cd tới default wt (tự clone nếu thiếu)
x repo wt <id> <wtname>          # gắn vào branch có sẵn, hoặc tạo mới từ HEAD
x repo wt ls <id>                # liệt kê các wt
x repo wt rm <id> <wtname>       # gỡ bỏ êm ái (dùng cái này, đừng rm -rf)
x repo update <id>               # làm mới default wt sau khi upstream thay đổi
x repo ls [--raw|--tsv]          # khám phá những gì đã được clone
x repo which <id>[@<wtname>]     # phân giải id thành đường dẫn tuyệt đối
```

## Đừng

- `rm -rf` một designed worktree. Nó để lại các mục cũ trong sổ đăng ký `worktrees/` của bản bare. Hãy dùng `x repo wt rm`. Nếu buộc phải làm vậy, hãy chạy `git -C <bare> worktree prune` sau.

## Liên quan

- [doc/path-layout.md](doc/path-layout.md) — ngữ pháp đường dẫn đầy đủ và quy ước đặt tên worktree
- [doc/workflow.md](doc/workflow.md) — quy trình vận hành và nguyên tắc dọn dẹp-không-xóa
- [doc/design.md](doc/design.md) — vì sao bố cục có hình dạng này
