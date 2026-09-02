---
source: lib/skill0/data/meme/references/INSTALL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# 安裝依賴

## x-cmd（可選）

[x-cmd](https://www.x-cmd.com) 提供免 sudo 的便攜包管理。

安裝：

```bash
eval "$(curl https://get.x-cmd.com)"
```

詳情見 [x-cmd.com/llms.txt](https://www.x-cmd.com/llms.txt)。

## Pillow（Python）

```bash
pip install pillow pyyaml
```

或通過 x-cmd：

```bash
x env use python
pip install pillow pyyaml
```

## ImageMagick

### macOS

```bash
brew install imagemagick
```

或通過 x-cmd：

```bash
x pixi use imagemagick
```

### Linux

```bash
apt install imagemagick    # Debian/Ubuntu
dnf install imagemagick    # Fedora
```

## 字體

### Impact（經典梗圖字體）

- **macOS**：`/System/Library/Fonts/Supplemental/Impact.ttf`（預裝）
- **Windows**：`C:\Windows\Fonts\impact.ttf`（預裝）
- **Linux（Debian/Ubuntu）**：`sudo apt install ttf-mscorefonts-installer`
- **Linux（Fedora）**：`sudo dnf install ms-core-impact-fonts`
- **注意**：Impact 是 Microsoft Core Font —— 可免費使用與分發，但不開源

### CJK / 中文字體（中文文本必需）

Impact 不含 CJK 字形 —— 用 Impact 渲染中文會顯示為空白。渲染器自動檢測 CJK 並回退到系統 CJK 字體：

- **macOS**：PingFang（蘋方）—— 預裝
- **Linux**：Noto Sans CJK —— `sudo apt install fonts-noto-cjk`（Debian/Ubuntu）或 `sudo dnf install google-noto-sans-cjk-fonts`（Fedora）

### Impact 的開源替代

若你偏好完全開源字體：

- **Anton**（Google Fonts）—— 與 Impact 非常相似，做梗圖極佳
- **Bangers**（Google Fonts）—— 漫畫/梗圖風，略圓潤

從 [Google Fonts](https://fonts.google.com) 安裝：
```bash
# 下載 Anton
mkdir -p ~/.local/share/fonts
curl -L "https://github.com/google/fonts/raw/main/ofl/anton/Anton-Regular.ttf" -o ~/.local/share/fonts/Anton-Regular.ttf
fc-cache -f
```

---

父 skill：[../SKILL.md](../SKILL.md)