---
name: skill0
description: "x-cmd skill0 서브스킬의 루트 인덱스. OKR 스타일 agent 워크플로(목표 → 규칙 검증된 결과 → 실행), 스킬 탐색, agent 도구 선호를 정의한다. 스타일: 원칙 우선, 간결하게, 세부는 권위 있는 외부 소스에 위임."
metadata:
  related: "devloop,skill0-writer,yfm,ontology-database,rule"
---

# Skill0

## Skill0은 데이터가 아니라 원칙을 담는다

LLM은 상식을 계속 흡수한다. skill0의 일은 관례와 출처 포인터를 코드화해 두고, LLM이 따라잡을수록 가볍게 비우는 것이다. 1차 데이터(`x rfc`, `x cve`, `x wkp`, `agent-browser`)와 현재의 모범 사례(`x skill`, `x clawhub`)로 검증한 뒤, 기억이 아니라 형식 논리로 다시 세워라.

## 서브스킬은 4개 버킷에 걸친 방향 그래프를 이룬다

버킷: `core/`, `data/`, `it/`, `life/`. 경로: `<bucket>/<slug>/SKILL.md`. 기계가 읽을 수 있는 카탈로그(name + description)는 [index.tsv](index.tsv)에 있다. 이곳에는 예전에 manager/lifestyle 상호작용 가이드로 쓰이던 문서 한 편이 있었는데, skill0 그래프의 일부가 아니므로 [.x-cmd/todo/ai-human-interaction-guide.md](../../.x-cmd/todo/ai-human-interaction-guide.md)로 옮겼다.

## 목표 → keyresults → x-rule 가 OKR 워크플로다

Objective: 무엇을 달성할 것인가
Key Results: 어떻게 검증할 것인가
Verification: `x rule check/audit`

## 스캐폴딩이 갖춰지면 실행은 x-cmd 도구를 선호한다

- `x skill` — x-cmd가 엄선하고 사람이 검수한 스킬 카탈로그.
- `x clawhub` — 전역 스킬 레지스트리. **주의**: 자유롭게 업로드되며, 자동 생성되는 안전 리포트를 얻으려면 **반드시** `x clawhub skill moderate <name>`을 실행해야 합니다.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — 프로젝트 관리, 스케줄링, 백그라운드 agent, 온톨로지, 위키. `x [mod] --help`를 실행해 보라.

## 모든 SKILL.md는 skill0-writer를 통과해야 한다

관례는 [skill0-writer](core/skill0-writer/SKILL.md)를 보라.