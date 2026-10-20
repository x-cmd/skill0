---
description: "x-cmd/skill0 多语言 i18n 决策与约定 — 翻译工作流 / 目录结构 / 文件状态机"
type: "reference"
keywords: [x-cmd, skill0, i18n, translation, agent]
version: "2026-10-21"
scope: "skill0"
audience: "agent"
prerequisites: []
related:
  - "https://github.com/x-cmd/draw/blob/main/README.md"  # draw 17-lang 顶部链接是 lang 参考
source: "2026-10-20/21 feat/i18n-skill0-16lang branch 实际执行决策沉淀"
confidence: "high"
---

# skill0 — Agent Instructions

## i18n 目录结构(2026-10-21 建立)

skill0 仓库以**目录镜像**方式为 17 种语言提供 SKILL 文档:

| 目录 | 语言 | 状态 |
|---|---|---|
| `skill0/` | English | 权威源 |
| `skill0-cn/` | 简体中文 | 已存在(SKILL.md + 22 伴生 .md,粗粒度但稳定) |
| `skill0-cn-hk/` | 繁體中文 | 已存在(legacy,不动) |
| `skill0-{cs,de,es,fr,id,it,ja,ko,pl,pt,ro,ru,th,tr,uk,vi}/` | draw 17-lang 列表去掉 cn/cn-hk | 新建(32 SKILL.md 已译 + 78 英文伴生镜像) |

每个 `<lang>` 目录 **统一**含有:

- **32 个 `SKILL.md`**(已译) — root + `core/12` + `data/6` + `it/9` + `life/4`
- **78 个英文伴生文件**(未译)— 模板、规则 yaml、references、scripts、`index.tsv`

镜像规模(`git ls-files skill0-X | wc -l`)统一是 **110** 文件 / 目录。

### 为什么镜像 78 英文伴生

`skill0-cn/` 只译了 22 个伴生 .md(那是手挑)。新 16 lang 跟 cn **不要求同行**;先**确保目录骨架完整**(英文伴生)+ SKILL.md 译完 = 文档系统能挂载。然后:
- **22 个伴生 .md 翻译** = 独立后续工作(16 lang × 22 = 352 篇),派 16 个 agent 并行
- **76 个英文 yaml/template/scripts** = 机器/模板产物,**预期不译**;只有当内容是真 prose 才译

### SKILL.md 文件状态机

每篇 SKILL.md 永远跟随这两个不变式:
1. **frontmatter `name:` slug** = 文件路径最后一截(`naming/SKILL.md` → `name: naming`),**不译**
2. **frontmatter `metadata:` 全块**(`category`/`tags`/`repository`/`type`/`version`/`related`)**不译**
3. `description:` 顶部管 prose,**译** + 多行 block scalar 保留

其他见 `cn → <lang>` 翻译规范(ref skill0-cn 现成样本)。

## 翻译工作流决策

### 一、语言列表

沿用 `x-cmd/draw` README 顶部 17-lang 列表 + 历史 en/cn/cn-hk:

```
en  cn  cs  de  es  fr  id  it  ja  ko  pl  pt  ro  ru  th  tr  uk  vi
                   (+cn-hk 繁体 legacy, 不动)
```

**不在本批**:`zh`(按 doc-2026 AGENTS.md 决议,中文固定 `cn`,不是 ISO 639-1)
**语言代号与 ISO 639-1 一致**,唯一例外 = 中文用 `cn.md`/`skill0-cn/`(不写 `zh`)。

### 二、目录布局 = 镜像,不是 readme/

**draw** 是单 README 文件 → 用 `readme/<lang>.md` 就够。

**skill0** 是 32 文件整树 → 镜像整目录树 `skill0-<lang>/<...>/SKILL.md`,跟 skill0-cn/ 现状对齐。

| 类型 | draw | skill0 |
|---|---|---|
| 单 doc | `readme/<lang>.md` | n/a |
| 整树 doc | n/a | `skill0-<lang>/<...>/SKILL.md` |
| 混用 | 不混 | 不混 |

### 三、scope 边界(2026-10-20 实际决议)

- ✅ 32 个 SKILL.md 全译
- ✅ 22 个伴生 .md 全译(本次先不译,**下一批工作**)
- ❌ 76 个 template/preset/yaml/script — **不译**(机器字段)

### 四、commit 粒度

每次目录合并后**只算一遍 commit**(per language):开始 16 个 main agent 各 commit 1 次 = 16 commit;后 8 lang 因 aux drift 各补 1 个 `chore: add EN scaffold` commit = 8 commit;**最终 25 commit 总**。

**不要每文件 1 commit** — 粒度过细,git log 噪音。

### 五、并发坑(本批踩的)

16 个 translate agent 共用同一 branch + `git add skill0-<lang>/`,会 race:
- `git add skill0-<lang>/` 是目录作用域,会把任何未跟踪的伴生文件拽进去
- 多个 agent 同时 `git add` 时,后到的会**吞掉**前一 agent 已经 staged 的内容(如 KO commit 被 race 吞了)

**下一批 worktree-isolation**:
- 每 agent 自己的 `git worktree add feat/i18n-<lang> main`
- 独立 commit + push(per-agent branch),最后 outer 仓 `--ff-only` merge 各 PR

## 验证与上线

- `wc -l skill0-<lang>/SKILL.md` 与 `wc -l skill0/SKILL.md` 比,在 ±25% 内
- `name:` slug 一致
- `metadata:` 块 byte-identical 到 EN
- ASCII box 在 `core/naming/SKILL.md` 行宽保持 EN 一致(不靠 word count,靠东亚洲宽度感知)
- 代码块平衡、URL/路径 byte-identical

## 路径与 URL 速查

| 项 | 路径 |
|---|---|
| 权威 EN 源 | `skill0/SKILL.md` (root) |
| CN 样本(翻译参考) | `skill0-cn/SKILL.md` |
| 新 16 lang | `skill0-{cs,de,es,fr,id,it,ja,ko,pl,pt,ro,ru,th,tr,uk,vi}/` |
| 翻译分支 | `feat/i18n-skill0-16lang` |
| draw 参考 17-lang | draw/README.md 顶部 |
| i18n 决策来源 | 本文档(2026-10-21 commit 已沉淀) |
