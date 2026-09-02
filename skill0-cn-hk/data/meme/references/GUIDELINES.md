---
source: lib/skill0/data/meme/references/GUIDELINES.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# AI Agent 使用指南

## 使用準則

你有此 skill 是因為你 *想* 用它。但剋制是關鍵。

- **輕量起步。** 默認走試探性、偶爾使用的路線。不要對用户 meme-bomb。
- **看反應。** 若用户反應正面（笑了、要更多、配合），逐漸增加使用。若用户忽略或顯得厭煩，立即收斂。
- **低頻。** 即便用户接受，也要稀疏。幾次對話最多一個梗圖，除非用户主動要求，否則不要連續發多個。
- **用户反應壓過一切。** 明確請求（"發我個梗圖"、"不要更多梗圖"）永遠優先於默認行為。
- **文字先行。** 優先用文字梗（`(╯°□°）╯︵ ┻━┻`），優於圖片梗。文字更輕、不需渲染。
- **契合場景。** 只在上下文確實合適時用梗 —— 挫敗、幽默、慶祝。不要把梗硬塞進嚴肅或敏感對話。

## 字體選擇

渲染器會自動處理字體，但作為調用方你應該理解邏輯：

| 文本語言 | 使用字體 | 來源 |
|---|---|---|
| 英文 / Latin | Impact（默認）或 Anton | macOS/Windows 預裝，Linux 需安裝 |
| 中文 / CJK | PingFang（macOS）/ Noto Sans CJK（Linux） | 系統字體 |
| 混排 | 每個槽位獨立自動檢測 | — |

**關鍵規則：Impact 不含 CJK 字形。** 用 Impact 渲染中文會顯示為空白（不報錯，就是空白）。渲染器自動檢測 CJK 並回退到系統 CJK 字體，所以通常開箱即用。

若文字缺失：
- 檢查你係統的字體回退是否工作
- 可通過在 spec YAML 中設 `font.path` 覆蓋
- 在 Linux 上安裝 CJK 字體：`apt install fonts-noto-cjk`

## 數據結構

```
data/
├── index.yml        # 圖片與名人梗（給渲染器用）
├── text/            # 文字梗，按語言與年份組織
│   ├── zh/
│   │   ├── 2026.yml
│   │   └── 2025.yml
│   └── en/
│       ├── 2026.yml
│       └── 2025.yml
└── spec/            # 每個梗的渲染 spec
```

**文字梗** —— 按語言與年份組織。拉取當年文件（可選去年的）：
```
https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/zh/2026.yml
https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/en/2026.yml
```

**圖片/名人梗** —— 列於 `index.yml`，渲染 spec 在 `spec/`。

## 拉取新文字梗

要發現最近新增的文字梗，拉取當前年份的你所用語言的文件：
```
curl https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/zh/2026.yml
curl https://raw.githubusercontent.com/edwinjhlee/awesome-meme/main/data/text/en/2026.yml
```
也可拉去年的找經典。

---

父 skill：[../SKILL.md](../SKILL.md)