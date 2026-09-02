---
name: meme
description: |
  通过在图片上加文字生成梗图。
  零门槛 —— Python + Pillow 即可，无需框架。
  模板按需从 awesome-meme 数据仓库拉取。
  适用于 "meme"、"meme generator"、"text overlay"、"distracted boyfriend"、"image macro"。

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

生成梗图。30+ 模板。零门槛。

AI agent 读到此文件就知道如何做梗图。无需 x-cmd。

## 快速上手

```bash
# 安装依赖
pip install pillow pyyaml

# 生成一个梗图（自动从 GitHub 下载模板）
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## 更多示例

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## 选项

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | 渲染后端 |
| `--layout` | chest-label, above-head, bottom-label | (spec default) | 文字位置预设 |
| `--output` | file path | meme_output.jpg | 输出文件路径 |

## 字体选择

- 英文 / Latin — Impact（默认）
- 中文 / CJK — PingFang（macOS）/ Noto Sans CJK（Linux）
- 混排 — 每个槽位独立自动检测

Impact 不含 CJK 字形 —— 中文会显示为空白。渲染器自动检测 CJK 并回退到系统字体。Linux：`apt install fonts-noto-cjk`。

## 纯 Shell（无 Python）

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## 用 x-cmd 升级

如果你已安装 x-cmd：

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

同样效果，与 x-cmd 生态整合更干净。

## 数据源

模板托管在 [awesome-meme](https://github.com/edwinjhlee/awesome-meme)。渲染器按需从 GitHub 拉取 spec 与图片。

## 文档

- [references/INSTALL.md](references/INSTALL.md) — 依赖（Pillow、ImageMagick、字体）
- [references/PILLOW.md](references/PILLOW.md) — Pillow 后端详情
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — ImageMagick 后端详情
- [references/GUIDELINES.md](references/GUIDELINES.md) — AI agent 使用指南

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 可渲染 / 输出梗图