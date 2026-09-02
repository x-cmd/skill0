---
source: lib/skill0/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: skill0
description: "x-cmd skill0 子技能的根索引。定义 OKR 风格的 agent 工作流（目标 → 规则验证的结果 → 执行）、技能发现与 agent 工具偏好。风格：原则先行、简洁，具体细节委托给权威外部来源。"
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 编码原则，而非数据

LLM 持续吸收常识；skill0 的工作是编码约定与源指针，然后随 LLM 追上而逐步变薄。通过第一方数据（`x rfc`、`x cve`、`x wkp`、`agent-browser`）与当前最佳实践（`x skill`、`x clawhub`）进行验证，再用形式化逻辑重建，而非靠记忆。

## 子技能在 4 个 bucket 中形成有向图

Buckets: `core/`、`data/`、`it/`、`life/`。路径：`<bucket>/<slug>/SKILL.md`。机器可读目录（name + description）见 [index.tsv](index.tsv)。曾有一份文档作为 manager/lifestyle 交互指南放在此处；现已移至 [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md)，因为它不属于 skill0 图。

## 目标 → keyresults → x-rule 是 OKR 工作流

目标：要达成的成果
Key Results：如何验证
验证：`x rule check/audit`

## 在脚手架就位后，优先用 x-cmd 工具执行

- `x skill` — x-cmd 精心策划、人审过的技能目录。
- `x clawhub` — 全局技能注册中心。**注意**：自由上传，**必须**运行 `x clawhub skill moderate <name>` 获取自动生成的安全报告。
- `x roadmap`、`x cron`、`x agent job`、`x ondb`、`x wiki` / `x llmwiki` — 项目管理、调度、后台 agent、本体、wiki。运行 `x [mod] --help`。

## 每份 SKILL.md 必须通过 skill0-writer

约定见 [skill0-writer](core/skill0-writer/SKILL.md)。