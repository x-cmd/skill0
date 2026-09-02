# ImageMagick 後端

## 安裝

```bash
# macOS
brew install imagemagick

# 或通過 x-cmd
x pixi use imagemagick

# Linux
apt install imagemagick
```

## 用法

### 通過 Python wrapper

```bash
python3 skill/meme_render.py distracted-boyfriend ZIG ME RUST --backend magick
```

### 通過 shell 腳本

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

## 座標

ImageMagick `-draw "text x,y"` 使用 **left-baseline** 錨點：
- x,y = 文字左邊 + 基線位置
- 從中心換算：`im_x = center_x - text_width/2`
- 從中心換算：`im_y = center_y + font_size * 0.35`

### 座標換表

| Pillow (anchor=mm) | ImageMagick (-draw) |
|---------------------|---------------------|
| 中心座標 | left-baseline 座標 |
| `(170, 323)` | `(140, 340)` |
| `(427, 263)` | `(400, 280)` |
| `(645, 353)` | `(595, 370)` |

## 格式

```bash
magick input.jpg -quality 90 output.jpg      # JPEG
magick input.jpg -quality 90 output.webp     # WebP（約小 58%）
magick input.jpg output.png                   # PNG
```

## CJK 文本

Impact 不含 CJK 字形 —— 用 Impact 渲染中文/日文/韓文會顯示為空白。shell 腳本自動檢測 CJK 字符並回退到系統 CJK 字體：

- **macOS**：PingFang, STHeiti
- **Linux**：Noto Sans CJK, WenQuanYi Zen Hei

若 CJK 文本顯示空白，安裝字體：
```bash
# Debian/Ubuntu
sudo apt install fonts-noto-cjk
# Fedora
sudo dnf install google-noto-sans-cjk-fonts
```

腳本還會同時支持帶連字符或下劃線的模板文件名（如 `distracted-boyfriend.yml` 會找到 `distracted_boyfriend.yml`）。

---

父 skill：[../SKILL.md](../SKILL.md)