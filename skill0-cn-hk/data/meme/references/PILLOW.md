# Pillow 後端

## 用法

```bash
python3 skill/meme_render.py distracted-boyfriend ZIG ME RUST
```

## 編程用法

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

## 座標

Pillow 用 **中心座標** 與 `anchor="mm"`（middle-middle）：
- `pos: [170, 323]` = 文字中心位於像素 (170, 323)
- 原點：左上 = (0, 0)，Y 向下增大

## 字體説明

### CJK / 中文（重要）

**Impact 不含 CJK 字形。** 若用 Impact 渲染中文/日文/韓文，文字會顯示為空白 —— 不報錯，就是空白。

渲染器自動檢測 CJK 文本並回退到：
- macOS：PingFang（蘋方）、STHeiti、Arial Unicode
- Linux：Noto Sans CJK

對於會承載中文的梗圖 spec，建議：
- 在 spec 中設 `font.path` 指向 CJK 字體，或
- 讓自動檢測處理（默認行為）

### 英文 / Latin 文本

- Impact：經典梗圖字體，macOS 預裝在 `/System/Library/Fonts/Supplemental/Impact.ttf`
- 免費替代：Google Fonts Anton、Bangers
- 渲染器默認對非 CJK 文本使用 Impact

---

父 skill：[../SKILL.md](../SKILL.md)