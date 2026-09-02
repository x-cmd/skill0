# Score Template Writer

如何为 skill0/score 框架写一份好的 `.score.yml` 模板。

模板是一份 **可复用打分标准**，agent 可用 `x score init -t <name>` 复制并定制。它应当开箱即用于最常见场景，同时引导 agent 为边缘情况调整它。

## 模板注释格式

每个模板文件包含两类注释：一段 **header block** 列出可调维度，以及对单个维度的 **inline notes**。

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

规则：
- header 列出具体、可操作的 condition —— 不是含糊的建议。
- 每行遵循 `条件 → 动作` 或 `condition → action`。
- 总以"draft then iterate"提醒结束。
- 保持可扫读。agent 应当能在 10 秒内读完要点并知道要问用户什么。

### Dimension inline comments

```
  - name: <dim>
    factor: <n>
    desc: "<0-10 anchored description>"
    # If <condition>, bump factor to <value>. Optional: split into <sub-dims>.
```

规则：
- inline 注释可选。在维度经常需要调整时使用。
- 保持一行。要写三行，就属于 header block。

## 选择维度

### 发现流程

1. **问用户什么最要紧。** "挑 <thing> 时，你最在意什么？"
2. **列出 3–5 个核心维度。** 这是不可少的因素。
3. **探查隐性约束。** "你养宠物吗？过敏吗？预算上限？特定环境？"
4. **把每个答案映射到维度或排除项。** 不是每个约束都要一个维度 —— 有些是硬过滤（如"必须对猫无毒"）。

### 维度设计规则

- **5–7 个维度是甜蜜点。** 少于 4 显得单薄；多于 8 制造噪声。
- **每个维度都必须能真正区分候选。** 如果所有候选在某维度上同分，就是浪费权重。
- **避免重叠维度。** "Aesthetics" 与 "beauty" 是同一件事。合并它们。
- **优先具体而非抽象。** "2 周不浇水还能活" > "Low maintenance"。

## 赋 factor

基线 = **2**（普通重要）。量级：

| Factor | 含义 | 何时用 |
|--------|---------|-------------|
| 1 | 次要考虑 | 锦上添花，几乎不影响决策 |
| 2 | 基线 | 正常权重，与对等项相等 |
| 4 | 2× 重要 | 明显比基线更重要 |
| 6 | 3× 重要 | 很重要，驱动决策 |
| 8 | 4× 重要 | 关键维度 |
| 10 | 5× 重要 | 主导因子 —— 很少用，留给 deal-breaker |

指南：
- 最重要的维度取 8 或 10。别太保守。
- 大多数维度应取 4 或 6。如果全是基线，模板就太通用了。
- factor 1 留给"以防万一"但预计不重要的维度。
- factor 不必加和。公式会自动归一化。

## 写 desc

### 格式

```
"<What this dimension measures>. <High score anchor>: <description>; <Low score anchor>: <description>; <Zero>: <description>."
```

### 规则

1. **把 9–10 和 1–2 锚到具体。** 中间分数是推导的。边缘必须鲜明。
2. **描述可观察事实，而非感觉。** "1 周后叶子上看不到明显灰尘" > "看起来干净"。
3. **0 就是 0。** 定义"完全失败此维度"长什么样。
4. **控制在 200 字符以内。** 更长的话，维度大概太模糊。

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

Category 前缀：
- `naming-` — 评估名字（模块名、品牌名、项目名）
- `removed — just use topic prefix` — 比较替代项以挑一（tech stack, library, vendor, migration）
- `pet-` — 宠物选型（办公室、家中等）
- `plant-` — 植物选型（室内、对猫安全等）

自由新增 category。前缀帮助 `x score ls` 把相关模板分组。

Topic：短 kebab-case 英文描述。保持具体：`plant-cat` 优于 `plant-pet-safe`。

文件第一行是：
```
# <prefix>-<topic>.score.yml — <English description>
```

这一行被 `x score ls` 解析为 `desc` 列。

## 工作流：创建新模板

```
1. 与用户对话 → 提取 3–5 个核心关注点
2. 起草维度 + factor → 写 .score.yml
3. 写 header comment block → 列出条件变化时要问什么
4. 写 inline 注释 → 标注经常变化的维度
5. 为每个维度写 desc → 具体的 0–10 锚点
6. 测试：挑 3–5 个候选、打分、compute → 排名合理吗？
7. 迭代：调 factor、拆/合维度、收紧 desc 锚点
8. 存到 skill0/score/template/，加正确前缀
```

## 硬过滤（block 列）

有些标准不可议价 —— 它们是 deal-breaker，不是偏好权重。

用 TSV 中 `target` 之后的可选 `block` 列：
- `block` 空 → 正常候选，按 total 排名
- `block` 非空 → 失格，压到底部，rank 显示 `X`

total 仍会计算 —— 便于在 block 候选之间比较（"如果你非要挑一个……"）。

何时用 `block` vs 低分维度：
- "这植物对猫有毒" → **block**（是二元门槛，不是偏好）
- "这植物难养" → **在养护维度上打低分**（是程度，不是 deal-breaker）

在模板注释里记录什么条件应触发 block：
```
# 硬过滤（block 列）：
#   对猫有毒 → block = "toxic to cats"
#   需要直射光但你住地下室 → block = "needs direct sun"
```

## 反模式

- **过度拟合某个用户。** 如果模板只适用于"我家朝南的北京公寓加两只猫"，那不是模板 —— 那是一次性 score.yml。
- **维度太多。** 12 个维度 = 噪声。拆成两个模板或合并。
- **全 factor = 2。** 如果没有东西比别的东西更重要，那用户其实没有偏好 —— 多问几个问题。
- **desc 模糊。** "质量好" 不是评分锚点。"1000 单位批次零缺陷" 才是。
- **没有注释。** 没有 agent 指引的模板就只是 YAML。注释让它成为 *模板*。

---

父 skill：[SKILL.md](SKILL.md)