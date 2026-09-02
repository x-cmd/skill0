# skill0

[English](README.md) · [简体中文](README.cn.md) — **[x-cmd.com/skill0 →](https://x-cmd.com/skill0)**

[x-cmd](https://x-cmd.com) 的子技能图：一个由约定与源指针组成的有向图，agent 在动手前先读它，以挑工具、定形状。

根技能的全文在仓库里三个语言版本都有：[skill0/SKILL.md](skill0/SKILL.md)（英文，权威源）· [skill0-cn/SKILL.md](skill0-cn/SKILL.md)（简体中文）· [skill0-cn-hk/SKILL.md](skill0-cn-hk/SKILL.md)（繁體中文）。本 README 是它的浓缩地图。

## skill0 vs 一个"skill"

这两个词描述的是不同层级，容易混。

- **一个 skill** 是*能力的单元*。它告诉 agent"出现 Y 时做 X"。skill 是*内容*：每一条都承载一个任务的步骤或参考，住在 `x skill` 的策展目录或 `x clawhub` 的开放注册中心，**当任务本身变了就更新**。

- **skill0** 是坐在 skill 之上的*方法论与图*。它编码原则（用第一方数据、走 OKR、优先 x-cmd 工具），把 skill 组织进 4 个 bucket（`core/`、`data/`、`it/`、`life/`），再用 `metadata.related:` 把它们串起来。**skill0 是在 agent 挑选 skill *之前* 加载的，不作为其中之一。** 当 LLM 吸收了更多常识，skill0 会*变薄*；单个 skill 不会。

| | 一个 skill | skill0 |
|---|---|---|
| 是什么 | 能力的单元 | 方法论 + 子技能图 |
| 何时加载 | agent 有事要做时 | agent 在定*怎么*工作 |
| 形态 | 一份 SKILL.md 对应一个任务 | 由 `metadata.related:` 串联的有向图 |
| 谁策展 | `x skill`（人审） / `x clawhub`（开放） | x-cmd 维护者（本仓库） |
| 何时更新 | 任务本身变了 | LLM 追上 —— 它们会变薄 |
| 编码内容 | 流程 | 原则，外加"挑选流程的流程" |

## Skill0 编码原则，而非数据

LLM 持续吸收常识；skill0 的工作是编码**约定与源指针**，然后随 LLM 追上而逐步变薄。通过第一方数据（`x rfc`、`x cve`、`x wkp`、`agent-browser`）与当前最佳实践（`x skill`、`x clawhub`）进行验证，再用形式化逻辑重建，而非靠记忆。

## 子技能在 4 个 bucket 中形成有向图

```
core/   agent 的工作方式             （devloop、rule、score、ontology-database……）
data/   第一方数据源                （rfc、cve、wkp、knowledge、ccal……）
it/     工具与运行时                （tldr、csv、tsv、time、ip、qr、agent-browser……）
life/   生活与个人领域              （travel、pet、health、lovable……）
```

路径：`<bucket>/<slug>/SKILL.md`。机器可读目录（name + description）在 [skill0/index.tsv](skill0/index.tsv)。

## 目标 → 关键结果 → x-rule 是 OKR 工作流

| | |
|---|---|
| **Objective** | 要达成的成果 |
| **Key Results** | 如何验证 |
| **Verification** | `x rule check / audit` |

## 脚手架就位后，优先用 x-cmd 工具执行

- `x skill` —— x-cmd 精心策展、人审过的技能目录。
- `x clawhub` —— 全局技能注册中心。**注意**：自由上传，**必须**运行 `x clawhub skill moderate <name>` 获取自动生成的安全报告。
- `x roadmap`、`x cron`、`x agent job`、`x ondb`、`x wiki` / `x llmwiki` —— 项目管理、调度、后台 agent、本体、wiki。运行 `x [mod] --help`。

## 每份 SKILL.md 都必须通过 skill0-writer

约定见 [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md)。新增与修改的条目都按这份清单校验。

## 仓库布局与贡献

本 README 讲 *what* 与 *why*。*how* —— 仓库布局、翻译镜像（`skill0-cn/`、`skill0-cn-hk/`）、如何用 [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz) 重新生成香港繁体镜像、编辑流程 —— 在 [CONTRIBUTING.md](CONTRIBUTING.md)。