---
name: skill0-writer
description: skill0 文档的写作约定 —— 金字塔结构、行数上限、布局规则。
metadata:
  related: "yfm,naming"
---

# skill0-writer

Skill0 文档遵循 **金字塔原则**：agent 可能只读前 10–30 行，所以最重要的信息必须前置。30 行之后的细节是 bonus，不是主力。

## 没有规则能约束的事

- **清晰优先于简洁。** 给错答案的短文档比给正确答案的长文档更糟。
- **安全 / 警告必须 显式** —— 使用 MUST、NEVER、DO NOT。把 caveat 写成完整陈述，而不是括注。
- **不要展开常识。** 一个约定词加一两句话能讲清就停。读者已经知道 YAML、git、cache 是什么；把 context 花在仓里特有的东西上。理由是常见冗余 —— 只在"看起来不对"时给一句理由。（`sw-1200`）
- **表只为真正的矩阵服务。** 3+ 列、行需要互相对照的。两列表格是穿表格外衣的列表 —— 写成列表。数据集应放在文档旁的外部 `.tsv`，链过去，让 `x tsv` 可以查询。（`sw-1250`）

## YFM —— 仅 `SKILL.md`

```yaml
---
name: <slug>                  # 必须等于目录名
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` 与 `description` 是 load-bearing。其他都嵌套在来自 [yfm](../yfm/SKILL.md) 的 `metadata:` 块下，做逗号分隔的 scalar —— 可选，为索引、发现、本体钩子增加结构。

**子文件不带 YFM。** 只有 `SKILL.md` 被 loader 过滤，所以只有它需要 frontmatter。其他文件（`references/*`、`usecase/*`、`EXAMPLE.md`、`*.report.md` …）由已经决定打开它的 agent 直接阅读 —— 那里的 YFM 是纯 token 成本，重述标题与首行已经给出的目的。这些文件从 `#` 标题起。需要偏离就在文件内声明原因。

中文本地化版本使用平行的 `SKILL.cn.md`（每个 skill 一份）。不要在一份文件里混语言。

## 机械检查

见 [skill0-writer.rule.yml](skill0-writer.rule.yml)。运行 `x rule lint skill0-writer.rule.yml` 与 `x rule check -r skill0-writer.rule.yml lib/skill0/`。覆盖：YFM 存在 + name/description 字段、name 格式、行数 ≤ 100（理想 50）、section 顺序 install → usage → advanced → links、纯英文、无引言 / 无结论 / 无重复、无孤儿文件。

## 截断安全性检查

写完后，停在第 30 行检查：只读到这里的 agent 会不会形成错误理解？

如果是，把关键限定前置。前 30 行必须给出（即便不完整的）正确心智模型。30 行之后，再用细节扩展 —— 金字塔是自我修正的。

## 双层加载：description 负责匹配，body 负责参考

Skills loader（Claude Code、Cursor、Continue 等）分两阶段加载 SKILL.md：

  1. **YFM `description:`** —— 自动载入 agent 的目录用于匹配。agent 读 description 决定是否加载该 skill。
  2. **Body** —— 匹配后按需加载。参考材料。

含义：

- **Description** = *它是什么 + 何时加载* —— 关键字密集、触发词丰富、简练。
- **Body** = *如何使用 + 参考* —— 示例、schema、边缘情况、链向更深文档的链接。

**不要在两层之间复制内容。** description 传达的，body 应该 *展开*，而不是复述同一面。body 的开头段尤其不得罗列与 description 相同的特性 —— body 以参考领起，而非第二份摘要。

一个实操测试：完全删掉 description，只读 body 的前 30 行，agent 应该仍能看到 skill 做什么、何时加载。如果只有 description 承载那些信息，body 在顶部就无可加 —— 把解释挪进 body，让 description 只带标题。

## skill 是知识包，不是教程

skill body 是 **给 LLM 的简报**，不是给初学者的课程。

- **能力** 在 LLM 里。body 不教。
- **知识** 在 x-cmd 数据工具（`x wkp` / `x rfc` / `x cve`，NVD / MITRE / GHSA）与外部来源中。body 只指；agent 自己再取。
- **框定** 是 skill 的工作：命名问题形态、约定、结构化输出、要用的 x-cmd 工具。

skill 承载解题角度、约定、输出形态与源指针。它 **不** 承载能力（LLM 已经有了）、静态数据（会腐）、或教程（用 sidecar）。

具体太细或太新的部分，推到 sidecar（`references/`、`ANALYTICS.md`）或外部常更文档。

## 外部链接

收集两类：**root links**（入口如 `llms.txt`、docs index）与 **useful links**（覆盖 80% 用例的 20% 文档的定向链接）。root 在前，useful 在后 —— AI 理解顺序。**不重复** 除非强调至关重要。

## 软 caveat（判断题）

- **子文件（CLEANUP.md, references/*）** 可以比 SKILL.md 长，但前 20 行仍承重（同样金字塔）。
- **必须** 从父 SKILL.md 链接每个子文件（前向链接必须）。从子文件回链父 SKILL.md **可选** —— usecase 文件通过路径隐式引用父文件。由 `sw-1000-no-orphan-docs` 在 [skill0-writer.rule.yml](skill0-writer.rule.yml) 中强制。
- **猜测** —— 写经过测试的事实，或标注"untested"。
- **Emoji** —— 除非 skill 主题需要。

## Related

- [yfm](../yfm/SKILL.md) — skill0-writer 强制第 1 层的 YFM 约定
- [naming](../naming/SKILL.md) — 命名也遵循 writer 规则
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — 机械强制