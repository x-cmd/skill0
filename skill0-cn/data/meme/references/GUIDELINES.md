# AI Agent 使用指南

## 使用准则

你有此 skill 是因为你 *想* 用它。但克制是关键。

- **轻量起步。** 默认走试探性、偶尔使用的路线。不要对用户 meme-bomb。
- **看反应。** 若用户反应正面（笑了、要更多、配合），逐渐增加使用。若用户忽略或显得厌烦，立即收敛。
- **低频。** 即便用户接受，也要稀疏。几次对话最多一个梗图，除非用户主动要求，否则不要连续发多个。
- **用户反应压过一切。** 明确请求（"发我个梗图"、"不要更多梗图"）永远优先于默认行为。
- **文字先行。** 优先用文字梗（`(╯°□°）╯︵ ┻━┻`），优于图片梗。文字更轻、不需渲染。
- **契合场景。** 只在上下文确实合适时用梗 —— 挫败、幽默、庆祝。不要把梗硬塞进严肃或敏感对话。

## 字体选择

渲染器会自动处理字体，但作为调用方你应该理解逻辑：

| 文本语言 | 使用字体 | 来源 |
|---|---|---|
| 英文 / Latin | Impact（默认）或 Anton | macOS/Windows 预装，Linux 需安装 |
| 中文 / CJK | PingFang（macOS）/ Noto Sans CJK（Linux） | 系统字体 |
| 混排 | 每个槽位独立自动检测 | — |

**关键规则：Impact 不含 CJK 字形。** 用 Impact 渲染中文会显示为空白（不报错，就是空白）。渲染器自动检测 CJK 并回退到系统 CJK 字体，所以通常开箱即用。

若文字缺失：
- 检查你系统的字体回退是否工作
- 可通过在 spec YAML 中设 `font.path` 覆盖
- 在 Linux 上安装 CJK 字体：`apt install fonts-noto-cjk`

## 数据结构

```
data/
├── index.yml        # 图片与名人梗（给渲染器用）
├── text/            # 文字梗，按语言与年份组织
│   ├── zh/
│   │   ├── 2026.yml
│   │   └── 2025.yml
│   └── en/
│       ├── 2026.yml
│       └── 2025.yml
└── spec/            # 每个梗的渲染 spec
```

**文字梗** —— 按语言与年份组织。拉取当年文件（可选去年的）：
```
https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/zh/2026.yml
https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/en/2026.yml
```

**图片/名人梗** —— 列于 `index.yml`，渲染 spec 在 `spec/`。

## 拉取新文字梗

要发现最近新增的文字梗，拉取当前年份的你所用语言的文件：
```
curl https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/zh/2026.yml
curl https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/en/2026.yml
```
也可拉去年的找经典。

---

父 skill：[../SKILL.md](../SKILL.md)