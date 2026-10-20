---
name: install
description: |
  Cài phần mềm bằng bất kỳ cách nào hệ thống cho phép. Khuyên dùng `x install` — một cửa duy nhất liệt kê mọi
  phương pháp và chọn cái tốt nhất; kèm các kênh `x eget`/`x env use`/`x pixi` và các trình quản lý gói hệ thống
  có hỗ trợ đổi mirror. Mọi kênh x-cmd đều cài vào $HOME — không sudo, không làm bẩn hệ thống.
  Dùng cho "install", "apt", "brew", "eget", "pixi", "package manager", "mirror".
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

Cài phần mềm bằng bất kỳ cách nào hệ thống cho phép. **Mọi kênh x-cmd (`x eget`, `x env use`, `x pixi`) đều cài vào `$HOME` — không sudo, không làm bẩn hệ thống.** Chỉ có trình quản lý gói hệ thống (`x apt`, `x brew`, …) mới đụng tới OS và có thể cần sudo.

## Chọn một kênh

- `x install` — **Khuyên dùng.** Một cửa duy nhất — liệt kê mọi phương pháp cho một công cụ, chọn cái tốt nhất
- `x eget` — Binary mới nhất thẳng từ repo upstream (release trên GitHub / Codeberg)
- `x env use` — Runtime & công cụ do x-cmd cung cấp (bọc `x pkg use`)
- `x pixi` — gói conda / hệ sinh thái pixi
- `x apt/brew/dnf/pacman` — trình quản lý gói hệ thống (có thể cần sudo)

## Điều kiện tiên quyết

x-cmd cung cấp mọi kênh nêu trên:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — cửa vào được khuyên dùng

Mỗi công cụ đều có nhiều đường cài; `x install` tự động chọn cái tốt nhất. Mọi dạng dưới đây đều không tương tác (an toàn cho agent / CI):
```bash
x install bun                            # cài đặt — tự chọn phương pháp tốt nhất
x install --printinfo ripgrep            # liệt kê mọi phương pháp cài trước (chỉ đọc)
x install --withtool brew jq             # ép dùng một trình quản lý; hoặc dạng tiền tố: brew/jq
x install --sys bun                      # chỉ trình quản lý gói hệ thống
x install --printcmd bun vim             # xem trước lệnh, không chạy
x install --env                          # dò nền tảng / kiến trúc / bản phân phối
x install --available-tool --installed   # những trình quản lý gói nào tồn tại ở đây
```

### Khám phá những gì có thể cài

`x install --ls` xuất ra một TSV của mọi công cụ đã lập chỉ mục — grep / awk nó offline:
```bash
x install --ls --tsv | head -1                  # hàng tiêu đề
x install --ls --tsv | grep -i json             # tìm theo từ khóa
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # lọc theo ngôn ngữ
x install --search http                         # tìm kiếm gộp trên nhiều registry
```
Cột TSV: `name category lang source desc_cn desc_en binlist rule other`.

## Đổi mirror (tải nhanh hơn)

Chuyển một trình quản lý gói hệ thống chậm sang mirror nhanh hơn / mirror nội bộ. Mỗi cái có `mirror ls` (liệt kê lựa chọn) và `mirror set <code>` (áp dụng, không tương tác):
```bash
x brew mirror ls          # liệt kê: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # áp dụng mirror Tsinghua
x apt mirror set tuna     # cùng dạng trên Debian / Ubuntu (cũng dnf, pacman)
```
Yêu cầu trình quản lý gói đích đã được cài đặt.

## Tìm hiểu thêm

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Liên quan

- [x-cmd](../x-cmd/SKILL.md) — mục lục bao trùm dẫn tới install
- [agent-browser](../../it/agent-browser/SKILL.md) — install chuyển hướng tới agent-browser khi không có binary nào tồn tại
- [env](../env/SKILL.md) — install và env dùng chung kiến trúc x-channel
