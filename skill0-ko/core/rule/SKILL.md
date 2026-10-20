---
name: rule
description: 규칙 기반 준수 검사 — 문제를 찾아내고 최저 품질을 보장합니다. 셸 워크플로는 `x rule` 와 짝을 이루며, rule 과 score 중 무엇을 쓸지는 rule-vs-score.md 를 참고하세요.
metadata:
  related: "score,naming,ontology-database,devloop"
---


# Rule

규칙 기반 준수 검사. 문제를 찾아내고 최저 품질을 보장합니다.

rule 과 score 중 무엇을 쓸지는 [rule-vs-score.md](rule-vs-score.md) 를 참고하세요.

## Related

- [score](../score/SKILL.md) — 짝을 이루는 채점 파트너 (rule-vs-score 참고)
- [naming](../naming/SKILL.md) — naming 후보는 rule 로 검증한다
- [ontology-database](../ontology-database/SKILL.md) — rule 이 ondb 의 schema 제약을 강제한다
- [devloop](../devloop/SKILL.md) — rule.yml 은 devloop 의 검증 산출물이다