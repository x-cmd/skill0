---
source: lib/skill0/data/meme/references/IMAGE_MAGICK.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# ImageMagick 后端

## 安装

```bash
# macOS
brew install imagemagick

# 或通过 x-cmd
x pixi use imagemagick

# Linux
apt install imagemagick
```

## 用法

### 通过 Python wrapper

```bash
python3 skill/meme_render.py distracted-boyfriend ZIG ME RUST --backend magick
```

### 通过 shell 脚本

```bash
bash skill/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

### 直接 magick 命令

```bash
magick base.jpg \
  -colorspace sRGB \
  -font Impact -pointsize 48 \
  -fill white -stroke black -strokewidth 4 \
  -draw "text 140,340 'ZIG'" \
  -draw "text 400,280 'ME'" \
  -draw "text 595,370 'RUST'" \
  output.jpg
```

## 坐标

ImageMagick `-draw "text x,y"` 使用 **left-baseline** 锚点：
- x,y = 文字左边 + 基线位置
- 从中心换算：`im_x = center_x - text_width/2`
- 从中心换算：`im_y = center_y + font_size * 0.35`

### 坐标换表

| Pillow (anchor=mm) | ImageMagick (-draw) |
|---------------------|---------------------|
| 中心坐标 | left-baseline 坐标 |
| `(170, 323)` | `(140, 340)` |
| `(427, 263)` | `(400, 280)` |
| `(645, 353)` | `(595, 370)` |

## 格式

```bash
magick input.jpg -quality 90 output.jpg      # JPEG
magick input.jpg -quality 90 output.webp     # WebP（约小 58%）
magick input.jpg output.png                   # PNG
```

## CJK 文本

Impact 不含 CJK 字形 —— 用 Impact 渲染中文/日文/韩文会显示为空白。shell 脚本自动检测 CJK 字符并回退到系统 CJK 字体：

- **macOS**：PingFang, STHeiti
- **Linux**：Noto Sans CJK, WenQuanYi Zen Hei

若 CJK 文本显示空白，安装字体：
```bash
# Debian/Ubuntu
sudo apt install fonts-noto-cjk
# Fedora
sudo dnf install google-noto-sans-cjk-fonts
```

脚本还会同时支持带连字符或下划线的模板文件名（如 `distracted-boyfriend.yml` 会找到 `distracted_boyfriend.yml`）。

---

父 skill：[../SKILL.md](../SKILL.md)