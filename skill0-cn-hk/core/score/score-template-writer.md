# Score Template Writer

如何為 skill0/score 框架寫一份好的 `.score.yml` 模板。

模板是一份 **可複用打分標準**，agent 可用 `x score init -t <name>` 複製並定製。它應當開箱即用於最常見場景，同時引導 agent 為邊緣情況調整它。

## 模板註釋格式

每個模板文件包含兩類註釋：一段 **header block** 列出可調維度，以及對單個維度的 **inline notes**。

### Header comment block

```
# <filename> — <one-line English description>

# == Notes for Agents ==
# This is the default standard for <scenario>. Adjust based on user needs:
#
# Common adjustments:
#   - <condition>? → <action>: add/remove <dimension>, bump <factor> to <value>
#   - <condition>? → <action>: swap <dim-a> for <dim-b>
#   ...
#
# Draft then iterate: run with defaults first, user feedback will reveal gaps.
```

規則：
- header 列出具體、可操作的 condition —— 不是含糊的建議。
- 每行遵循 `條件 → 動作` 或 `condition → action`。
- 總以"draft then iterate"提醒結束。
- 保持可掃讀。agent 應當能在 10 秒內讀完要點並知道要問用户什麼。

### Dimension inline comments

```
  - name: <dim>
    factor: <n>
    desc: "<0-10 anchored description>"
    # If <condition>, bump factor to <value>. Optional: split into <sub-dims>.
```

規則：
- inline 註釋可選。在維度經常需要調整時使用。
- 保持一行。要寫三行，就屬於 header block。

## 選擇維度

### 發現流程

1. **問用户什麼最要緊。** "挑 <thing> 時，你最在意什麼？"
2. **列出 3–5 個核心維度。** 這是不可少的因素。
3. **探查隱性約束。** "你養寵物嗎？過敏嗎？預算上限？特定環境？"
4. **把每個答案映射到維度或排除項。** 不是每個約束都要一個維度 —— 有些是硬過濾（如"必須對貓無毒"）。

### 維度設計規則

- **5–7 個維度是甜蜜點。** 少於 4 顯得單薄；多於 8 製造噪聲。
- **每個維度都必須能真正區分候選。** 如果所有候選在某維度上同分，就是浪費權重。
- **避免重疊維度。** "Aesthetics" 與 "beauty" 是同一件事。合併它們。
- **優先具體而非抽象。** "2 周不澆水還能活" > "Low maintenance"。

## 賦 factor

基線 = **2**（普通重要）。量級：

| Factor | 含義 | 何時用 |
|--------|---------|-------------|
| 1 | 次要考慮 | 錦上添花，幾乎不影響決策 |
| 2 | 基線 | 正常權重，與對等項相等 |
| 4 | 2× 重要 | 明顯比基線更重要 |
| 6 | 3× 重要 | 很重要，驅動決策 |
| 8 | 4× 重要 | 關鍵維度 |
| 10 | 5× 重要 | 主導因子 —— 很少用，留給 deal-breaker |

指南：
- 最重要的維度取 8 或 10。別太保守。
- 大多數維度應取 4 或 6。如果全是基線，模板就太通用了。
- factor 1 留給"以防萬一"但預計不重要的維度。
- factor 不必加和。公式會自動歸一化。

## 寫 desc

### 格式

```
"<What this dimension measures>. <High score anchor>: <description>; <Low score anchor>: <description>; <Zero>: <description>."
```

### 規則

1. **把 9–10 和 1–2 錨到具體。** 中間分數是推導的。邊緣必須鮮明。
2. **描述可觀察事實，而非感覺。** "1 周後葉子上看不到明顯灰塵" > "看起來乾淨"。
3. **0 就是 0。** 定義"完全失敗此維度"長什麼樣。
4. **控制在 200 字符以內。** 更長的話，維度大概太模糊。

### 示例

好的：
```
"Survival difficulty — watering frequency, humidity sensitivity, survives 1-week business trip. 9-10: nearly unkillable, forgives forgotten watering; 7-8: hardy, occasional neglect ok; 5-6: needs regular care; 3-4: fussy, leaves yellow at slightest change; 1-2: requires expertise; 0: beginner will kill within a month."
```

差的：
```
"Whether the plant is easy to take care of or not."
```

## 文件命名

```
<category>-<topic>.score.yml
```

Category 前綴：
- `naming-` — 評估名字（模塊名、品牌名、項目名）
- `removed — just use topic prefix` — 比較替代項以挑一（tech stack, library, vendor, migration）
- `pet-` — 寵物選型（辦公室、家中等）
- `plant-` — 植物選型（室內、對貓安全等）

自由新增 category。前綴幫助 `x score ls` 把相關模板分組。

Topic：短 kebab-case 英文描述。保持具體：`plant-cat` 優於 `plant-pet-safe`。

文件第一行是：
```
# <prefix>-<topic>.score.yml — <English description>
```

這一行被 `x score ls` 解析為 `desc` 列。

## 工作流：創建新模板

```
1. 與用户對話 → 提取 3–5 個核心關注點
2. 起草維度 + factor → 寫 .score.yml
3. 寫 header comment block → 列出條件變化時要問什麼
4. 寫 inline 註釋 → 標註經常變化的維度
5. 為每個維度寫 desc → 具體的 0–10 錨點
6. 測試：挑 3–5 個候選、打分、compute → 排名合理嗎？
7. 迭代：調 factor、拆/合維度、收緊 desc 錨點
8. 存到 skill0/score/template/，加正確前綴
```

## 硬過濾（block 列）

有些標準不可議價 —— 它們是 deal-breaker，不是偏好權重。

用 TSV 中 `target` 之後的可選 `block` 列：
- `block` 空 → 正常候選，按 total 排名
- `block` 非空 → 失格，壓到底部，rank 顯示 `X`

total 仍會計算 —— 便於在 block 候選之間比較（"如果你非要挑一個……"）。

何時用 `block` vs 低分維度：
- "這植物對貓有毒" → **block**（是二元門檻，不是偏好）
- "這植物難養" → **在養護維度上打低分**（是程度，不是 deal-breaker）

在模板註釋裏記錄什麼條件應觸發 block：
```
# 硬過濾（block 列）：
#   對貓有毒 → block = "toxic to cats"
#   需要直射光但你住地下室 → block = "needs direct sun"
```

## 反模式

- **過度擬合某個用户。** 如果模板只適用於"我家朝南的北京公寓加兩隻貓"，那不是模板 —— 那是一次性 score.yml。
- **維度太多。** 12 個維度 = 噪聲。拆成兩個模板或合併。
- **全 factor = 2。** 如果沒有東西比別的東西更重要，那用户其實沒有偏好 —— 多問幾個問題。
- **desc 模糊。** "質量好" 不是評分錨點。"1000 單位批次零缺陷" 才是。
- **沒有註釋。** 沒有 agent 指引的模板就只是 YAML。註釋讓它成為 *模板*。

---

父 skill：[SKILL.md](SKILL.md)