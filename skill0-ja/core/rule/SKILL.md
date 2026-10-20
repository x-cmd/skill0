---
name: rule
description: ルールベースのコンプライアンスチェック — 問題を見つけ、最低品質を保証する。shell ワークフローでは `x rule` と組み合わせて使う。rule vs score の使い分けは rule-vs-score.md を参照。
metadata:
  related: "score,naming,ontology-database,devloop"
---


# Rule

ルールベースのコンプライアンスチェック。問題を見つけ、最低品質を保証する。

rule vs score の使い分けは [rule-vs-score.md](rule-vs-score.md) を参照。

## Related

- [score](../score/SKILL.md) — ペアとなるスコアリングの伴侶（rule-vs-score を参照）
- [naming](../naming/SKILL.md) — 命名候補は rule で検証される
- [ontology-database](../ontology-database/SKILL.md) — rule は ondb の schema 制約を強制する
- [devloop](../devloop/SKILL.md) — rule.yml は devloop の検証アーティファクトである
