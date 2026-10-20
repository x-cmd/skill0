---
name: ontology-database
description: Đồ thị tri thức có kiểu thông qua log TSV chỉ-ghi-nối — CRUD entity, quan hệ có hướng, kiểm tra schema, suy luận nhiều bước. CLI qua `x ondb`, giao thức đọc được bằng AWK/Python/JS/SQLite.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

Đồ thị tri thức có kiểu: mọi thứ đều là một **entity** (id + type + properties) được nối bằng **quan hệ có hướng** (from → rel → to). Mọi thao tác thay đổi đều thêm một dòng TSV — không bao giờ ghi đè. Bản log TSV chính là cơ sở dữ liệu.

## Định dạng log TSV (giao thức)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # tạo entity
set     <id>  <epoch_ms>  key  val                             # cập nhật thuộc tính
rm      <id>  <epoch_ms>                                       # xóa entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # tạo quan hệ
unlink  <from>  <rel>  <to>  <epoch_ms>                        # gỡ quan hệ
# phân tách bằng tab; escape: \t → tab, \n → newline, \\ → backslash
# thuộc tính là các cặp key/val xen kẽ (mỗi cái là một trường tab riêng)
```

Ngôn ngữ nào cũng đọc được. AWK thì stream, Python thì dict, SQLite thì vật chất hóa. **Log là nguồn sự thật.**

## Cách dùng CLI

```
x ondb add --type Person --name Alice                            # UUID tự động
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # chi tiết entity
x ondb set --id t1 status=done                                  # cập nhật thuộc tính
x ondb rm --id t1                                               # xóa

x ondb link --from proj_001 --rel has_task --to t1              # tạo quan hệ
x ondb link --from t1 --rel blocks --to t2                      # kèm thuộc tính link: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # quan hệ đi ra
x ondb linked --id t1 --direction incoming                      # đi vào (ai link TỚI)
x ondb related --id proj_001 --rel has_task --json              # entity đầy đủ ở phía bên kia

x ondb ls --type Task                                           # liệt kê theo type
x ondb query --type Task --where status=open --json             # lọc theo thuộc tính
```

`linked` = metadata của quan hệ. `related` = entity đầy đủ ở phía bên kia. Dùng `--dir <path>` / `-d <path>` cho thư mục dữ liệu (→ `path/ondb.tsv`).

## Schema & kiểm tra

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # kiểm tra required, enum, tham chiếu treo, lực lượng, chu trình
```

Các chỉ thị: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. Việc kiểm tra tách biệt với việc ghi.

## Nguyên tắc kiến trúc

- **Log là nguồn** — log TSV là thứ có thẩm quyền; SQLite chỉ là một materialized view
- **Chỉ-ghi-nối** — `set`, `rm`, `unlink` đều thêm dòng; không bao giờ sửa các dòng đã có
- **Nhiều instance** — mỗi sub-domain một ondb (mặc định); chỉ gộp cho các chuỗi xuyên domain
- **Type = Concept** — cùng một tên type luôn mang cùng một khái niệm
- **Kiểm tra theo yêu cầu** — không kiểm tra schema lúc ghi; hãy chạy `validate` sau các thay đổi hàng loạt

## Backend

| Backend | Khi nào | |
|---|---|---|
| **AWK** (mặc định) | < 2k entity | Không phụ thuộc, dạng stream |
| Python | Trung bình | Cấu trúc dữ liệu phong phú |
| JS/Bun | Ứng dụng web | JSON native |
| SQLite | > 5k entity | Tự sinh từ log TSV |

## Cấu trúc thư mục

```
<datadir>/ONDB.DESC.txt    # Bắt buộc. Định danh instance ondb
<datadir>/ondb.tsv         # Log chỉ-ghi-nối
<datadir>/schema.tsv       # Tùy chọn. Các ràng buộc
<datadir>/ondb.db          # Tùy chọn. Materialized view SQLite
```

## Tìm hiểu thêm

- `x ondb --help` — tham chiếu CLI
- `x ondb libpath {awk,py,js}` — đường dẫn thư viện cho các truy vấn tùy chỉnh
- [ondb SKILL.md](../../../ondb/SKILL.md) — tài liệu đầy đủ (kịch bản, tích hợp, truy vấn tùy chỉnh, cấu hình SQLite WAL)

## Liên quan

- [yfm](../yfm/SKILL.md) — `metadata:` của yfm là bề mặt nạp dữ liệu được khuyên dùng
- [rule](../rule/SKILL.md) — các quy tắc kiểm tra schema nằm trong khung rule
