# 安装依赖

## x-cmd（可选）

[x-cmd](https://www.x-cmd.com) 提供免 sudo 的便携包管理。

安装：

```bash
eval "$(curl https://get.x-cmd.com)"
```

详情见 [x-cmd.com/llms.txt](https://www.x-cmd.com/llms.txt)。

## Pillow（Python）

```bash
pip install pillow pyyaml
```

或通过 x-cmd：

```bash
x env use python
pip install pillow pyyaml
```

## ImageMagick

### macOS

```bash
brew install imagemagick
```

或通过 x-cmd：

```bash
x pixi use imagemagick
```

### Linux

```bash
apt install imagemagick    # Debian/Ubuntu
dnf install imagemagick    # Fedora
```

## 字体

### Impact（经典梗图字体）

- **macOS**：`/System/Library/Fonts/Supplemental/Impact.ttf`（预装）
- **Windows**：`C:\Windows\Fonts\impact.ttf`（预装）
- **Linux（Debian/Ubuntu）**：`sudo apt install ttf-mscorefonts-installer`
- **Linux（Fedora）**：`sudo dnf install ms-core-impact-fonts`
- **注意**：Impact 是 Microsoft Core Font —— 可免费使用与分发，但不开源

### CJK / 中文字体（中文文本必需）

Impact 不含 CJK 字形 —— 用 Impact 渲染中文会显示为空白。渲染器自动检测 CJK 并回退到系统 CJK 字体：

- **macOS**：PingFang（苹方）—— 预装
- **Linux**：Noto Sans CJK —— `sudo apt install fonts-noto-cjk`（Debian/Ubuntu）或 `sudo dnf install google-noto-sans-cjk-fonts`（Fedora）

### Impact 的开源替代

若你偏好完全开源字体：

- **Anton**（Google Fonts）—— 与 Impact 非常相似，做梗图极佳
- **Bangers**（Google Fonts）—— 漫画/梗图风，略圆润

从 [Google Fonts](https://fonts.google.com) 安装：
```bash
# 下载 Anton
mkdir -p ~/.local/share/fonts
curl -L "https://github.com/google/fonts/raw/main/ofl/anton/Anton-Regular.ttf" -o ~/.local/share/fonts/Anton-Regular.ttf
fc-cache -f
```

---

父 skill：[../SKILL.md](../SKILL.md)