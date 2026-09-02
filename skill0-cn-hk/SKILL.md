---
source: lib/skill0/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: skill0
description: "x-cmd skill0 子技能的根索引。定義 OKR 風格的 agent 工作流（目標 → 規則驗證的結果 → 執行）、技能發現與 agent 工具偏好。風格：原則先行、簡潔，具體細節委託給權威外部來源。"
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 編碼原則，而非數據

LLM 持續吸收常識；skill0 的工作是編碼約定與源指針，然後隨 LLM 追上而逐步變薄。通過第一方數據（`x rfc`、`x cve`、`x wkp`、`agent-browser`）與當前最佳實踐（`x skill`、`x clawhub`）進行驗證，再用形式化邏輯重建，而非靠記憶。

## 子技能在 4 個 bucket 中形成有向圖

Buckets: `core/`、`data/`、`it/`、`life/`。路徑：`<bucket>/<slug>/SKILL.md`。機器可讀目錄（name + description）見 [index.tsv](index.tsv)。曾有一份文檔作為 manager/lifestyle 交互指南放在此處；現已移至 [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md)，因為它不屬於 skill0 圖。

## 目標 → keyresults → x-rule 是 OKR 工作流

目標：要達成的成果
Key Results：如何驗證
驗證：`x rule check/audit`

## 在腳手架就位後，優先用 x-cmd 工具執行

- `x skill` — x-cmd 精心策劃、人審過的技能目錄。
- `x clawhub` — 全局技能註冊中心。**注意**：自由上傳，**必須**運行 `x clawhub skill moderate <name>` 獲取自動生成的安全報告。
- `x roadmap`、`x cron`、`x agent job`、`x ondb`、`x wiki` / `x llmwiki` — 項目管理、調度、後台 agent、本體、wiki。運行 `x [mod] --help`。

## 每份 SKILL.md 必須通過 skill0-writer

約定見 [skill0-writer](core/skill0-writer/SKILL.md)。