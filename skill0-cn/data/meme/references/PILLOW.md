# Pillow 后端

## 用法

```bash
python3 skill/meme_render.py distracted-boyfriend ZIG ME RUST
```

## 编程用法

```python
from PIL import Image, ImageDraw, ImageFont

img = Image.open("base_image.jpg")
draw = ImageDraw.Draw(img)
font = ImageFont.truetype("Impact.ttf", 48)

draw.text(
    (170, 323), "ZIG",
    font=font, fill="white",
    stroke_width=4, stroke_fill="black",
    anchor="mm"
)

img.save("output.jpg", quality=95)
img.save("output.webp", "WEBP", quality=90)
```

## 坐标

Pillow 用 **中心坐标** 与 `anchor="mm"`（middle-middle）：
- `pos: [170, 323]` = 文字中心位于像素 (170, 323)
- 原点：左上 = (0, 0)，Y 向下增大

## 字体说明

### CJK / 中文（重要）

**Impact 不含 CJK 字形。** 若用 Impact 渲染中文/日文/韩文，文字会显示为空白 —— 不报错，就是空白。

渲染器自动检测 CJK 文本并回退到：
- macOS：PingFang（苹方）、STHeiti、Arial Unicode
- Linux：Noto Sans CJK

对于会承载中文的梗图 spec，建议：
- 在 spec 中设 `font.path` 指向 CJK 字体，或
- 让自动检测处理（默认行为）

### 英文 / Latin 文本

- Impact：经典梗图字体，macOS 预装在 `/System/Library/Fonts/Supplemental/Impact.ttf`
- 免费替代：Google Fonts Anton、Bangers
- 渲染器默认对非 CJK 文本使用 Impact

---

父 skill：[../SKILL.md](../SKILL.md)