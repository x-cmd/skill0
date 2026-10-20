---
name: skill0
description: "x-cmd skill0 サブスキルのルート索引。OKR 形式の agent ワークフロー（goal → rule で検証された結果 → execute）、スキルの発見方法、agent ツールの好みを定義する。スタイル: 原則優先、簡潔、詳細は authoritative な外部ソースに委譲。"
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0 が符号化するのはデータではなく原則

LLM は常識を常に吸収していく。skill0 の仕事は規約と情報源へのポインタを符号化し、LLM が追いつくにつれて徐々に薄くすることである。第一次データ（`x rfc`、`x cve`、`x wkp`、`agent-browser`）と現在のベストプラクティス（`x skill`、`x clawhub`）で検証し、記憶ではなく形式的ロジックで再構築する。

## サブスキルは 4 つのバケットにまたがる有向グラフを成す

バケット: `core/`、`data/`、`it/`、`life/`。パス: `<bucket>/<slug>/SKILL.md`。機械可読なカタログ（name + description）は [index.tsv](index.tsv) にある。ここにはかつて manager/lifestyle の相互作用ガイドという文書が置かれていたが、skill0 グラフの一部ではないため [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md) へ移された。

## goal → keyresults → x-rule が OKR ワークフロー

Objective: 何を達成するか
Key Results: どう検証するか
Verification: `x rule check/audit`

## scaffold の後は、実行に x-cmd ツールを好む

- `x skill` — x-cmd が厳選し、人手で検証した skill カタログ。
- `x clawhub` — グローバル skill レジストリ。**注意**: 無償で公開できるが、自動生成の安全レポートのために必ず `x clawhub skill moderate <name>` を実行すること。
- `x roadmap`、`x cron`、`x agent job`、`x ondb`、`x wiki` / `x llmwiki` — プロジェクト管理、スケジュール、バックグラウンド agent、ontology、wiki。`x [mod] --help` を実行。

## すべての SKILL.md は skill0-writer を通す必要がある

規約については [skill0-writer](core/skill0-writer/SKILL.md) を参照。