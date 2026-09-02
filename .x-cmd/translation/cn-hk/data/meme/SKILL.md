---
source: lib/skill0/data/meme/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: meme
description: |
  通過在圖片上加文字生成梗圖。
  零門檻 —— Python + Pillow 即可，無需框架。
  模板按需從 awesome-meme 數據倉庫拉取。
  適用於 "meme"、"meme generator"、"text overlay"、"distracted boyfriend"、"image macro"。

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

生成梗圖。30+ 模板。零門檻。

AI agent 讀到此文件就知道如何做梗圖。無需 x-cmd。

## 快速上手

```bash
# 安裝依賴
pip install pillow pyyaml

# 生成一個梗圖（自動從 GitHub 下載模板）
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## 更多示例

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## 選項

| Option | Values | Default | Description |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | 渲染後端 |
| `--layout` | chest-label, above-head, bottom-label | (spec default) | 文字位置預設 |
| `--output` | file path | meme_output.jpg | 輸出文件路徑 |

## 字體選擇

- 英文 / Latin — Impact（默認）
- 中文 / CJK — PingFang（macOS）/ Noto Sans CJK（Linux）
- 混排 — 每個槽位獨立自動檢測

Impact 不含 CJK 字形 —— 中文會顯示為空白。渲染器自動檢測 CJK 並回退到系統字體。Linux：`apt install fonts-noto-cjk`。

## 純 Shell（無 Python）

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## 用 x-cmd 升級

如果你已安裝 x-cmd：

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

同樣效果，與 x-cmd 生態整合更乾淨。

## 數據源

模板託管在 [awesome-meme](https://github.com/edwinjhlee/awesome-meme)。渲染器按需從 GitHub 拉取 spec 與圖片。

## 文檔

- [references/INSTALL.md](references/INSTALL.md) — 依賴（Pillow、ImageMagick、字體）
- [references/PILLOW.md](references/PILLOW.md) — Pillow 後端詳情
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — ImageMagick 後端詳情
- [references/GUIDELINES.md](references/GUIDELINES.md) — AI agent 使用指南

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 可渲染 / 輸出梗圖