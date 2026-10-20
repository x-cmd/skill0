---
name: meme
description: |
  Tạo ảnh meme bằng cách chồng chữ lên các mẫu có sẵn.
  Không rào cản — chạy với Python + Pillow, không cần framework nào.
  Các mẫu được tải theo yêu cầu từ kho dữ liệu awesome-meme.
  Dùng cho "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro".

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

Tạo ảnh meme. Hơn 30 mẫu. Không rào cản.

Một AI agent đọc file này là biết cách làm meme. Không cần x-cmd.

## Bắt đầu nhanh

```bash
# Cài các phụ thuộc
pip install pillow pyyaml

# Tạo một meme (tự động tải mẫu từ GitHub)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## Thêm ví dụ

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## Tùy chọn

| Tùy chọn | Giá trị | Mặc định | Mô tả |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | Backend dựng hình |
| `--layout` | chest-label, above-head, bottom-label | (mặc định của spec) | Bộ đặt trước vị trí đặt chữ |
| `--output` | đường dẫn file | meme_output.jpg | Đường dẫn file đầu ra |

## Chọn phông chữ

- Tiếng Anh / Latin — Impact (mặc định)
- Tiếng Trung / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- Hỗn hợp — Mỗi ô được tự động nhận diện riêng

Impact không có glyph CJK — chữ tiếng Trung sẽ vô hình. Bộ dựng hình tự động nhận diện CJK và chuyển sang phông hệ thống. Trên Linux: `apt install fonts-noto-cjk`.

## Thuần Shell (không cần Python)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## Nâng cấp với x-cmd

Nếu bạn đã cài x-cmd:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

Kết quả tương tự, tích hợp gọn gàng hơn với hệ sinh thái x-cmd.

## Nguồn dữ liệu

Các mẫu nằm trong [awesome-meme](https://github.com/edwinjhlee/awesome-meme). Bộ dựng hình lấy spec và hình ảnh từ GitHub theo yêu cầu.

## Tài liệu

- [references/INSTALL.md](references/INSTALL.md) — Phụ thuộc (Pillow, ImageMagick, phông chữ)
- [references/PILLOW.md](references/PILLOW.md) — Chi tiết backend Pillow
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — Chi tiết backend ImageMagick
- [references/GUIDELINES.md](references/GUIDELINES.md) — Hướng dẫn sử dụng cho AI agent

## Liên quan

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser có thể dựng/xuất ảnh meme
