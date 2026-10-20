---
name: naming
description: |
  x-cmd 모듈 / 명령 / 하위 명령을 위한 네이밍 프레임워크. 주제적 + 시나리오 주도적이며, 이 스킬은 얇은 껍데기일 뿐 규칙집이 아니다.
  세 계층: 조사(목표), naming.<user-task>.yml (OKR + 세션 기록이며 .rule 파일), naming.okr-creator.yml (세션을 감사하는 메타-규칙).
metadata:
  related: "rule,score,ontology-database"
---


# Naming

네이밍은 **주제적 + 시나리오 주도적**이다. 이 스킬은 **프레임워크**이지 규칙집이 아니다 — 주제적인 네이밍 규칙을 하드코딩하지 않는다.

## 빠른 지도

```
┌─────────────────────────────────────────────────────────┐
│  1. 목표 조사                                            │
│     무엇에 이름을 짓는가? 어떤 역할? 어떤 개념?            │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (.rule 파일)                 │
│     - goal-*        (네이밍 태스크)                       │
│     - keyresult-*   (검증 가능한 결과)                    │
│     - task-*        (태스크 고유 제약)                     │
│     - session:      (goal 규칙에 대한 감사 추적)           │
│         prefer     (init-004 5개 답변)                   │
│         init_verdicts  (후보별 게이트 판정)                │
│         scores     (후보별 D1-D7 앵커)                    │
│         final      (선택 + 백업)                          │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. template/naming.okr-creator.yml 로 감사                │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## Workflow — 단계별

### 1단계 · 목표 조사

무엇이든 쓰기 전에 아래 질문에 답하라. **건너뛰지 말라** — 답이 없으면 scorer는 D4(TRIAL/REAL)나 D5(RUN/TEST)를 앵커링할 수 없다.

- **무엇에 이름을 짓는가?** — 모듈 / 하위 명령 / 필드 / 변수 — 서로 다른 네이밍 형태 규칙이 적용된다
- **무슨 역할을 하는가?** — 개념을 앵커한다 (예: "trial-run 모듈" → 독립 실행기, 2단계 테스트의 1단계)
- **반드시 실어야 하는 선행식은?** — 지배적인 맨손 단어의 뜻이 일치해야 한다 (예: trial-run은 REAL+TEST가 아니라 TRIAL+RUN 필요)
- **반드시 피해야 하는 선행식은?** — unittest 오염(`*test`/`*case`), 가짜(`*mock`/`*fake`/`*stub`/`*dry`), 실제 배포(`field*`/`*live*`)
- **어떤 아키타입이 맞는가?** — ship / plane / rocket / factory / abstract — D6/D7을 이끈다

결과물: 한 줄짜리 목표 진술, 예를 들어
> "trial-run(2단계 테스트의 1단계)을 위한 독립 x-cmd 모듈명을, D1-D7에서 8.0점 이상을 받고 한눈에 자명하며 모든 레드라인 / 사전 / 길이 fast-fail을 견디는 이름으로 고른다."

### 2단계 · 세션 기록 만들기

템플릿을 복사한 뒤 잘라내거나 채워라.

```bash
cp naming.template.yml naming.<user-task>.yml
```

그다음 4개 섹션을 위에서 아래로 채운다:

#### 2a. Goal rule (네이밍 태스크)

`goal-TBD_task_id`를 실제 ID로 바꾼다. ID 접미사는 태스크를 반영해야 한다 (예: `goal-trial-run-naming`, `goal-mvp-prerelease-subcmd`).

```yaml
goal-trial-run-naming:
  name: <1단계에서 얻은 한 줄 목표 진술>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <1단계에서 온 개념 + 역할 + 반대 선행식>
```

#### 2b. Key results (검증 가능한 결과)

각 `keyresult-kr*_TBD_short_label`를 바꾼다. 모든 KR은 PASS될 수 있는 규칙이어야 한다. 태스크가 가진 만큼 추가하라.

```yaml
keyresult-kr1-top-pick-committed:
  name: <검증 가능한 결과 1>
  level: error
  desc:
  - <무엇이 통과로 치는가 — 구체적 기준, "괜찮아 보인다"가 아니라>
```

#### 2c. 태스크 고유 규칙 (후보에 대한 제약)

각 `TBD_task_id-*`를 goal의 task-id 접미사와 일치하는 실제 제약 ID로 바꾼다. 해당 없는 것은 잘라내고, 필요하면 새로 추가하라.

흔한 패턴:
- `must-be-X-not-Y` — 개념 정렬 (예: `must-be-TRIAL-not-REAL`)
- `length-N-to-M-letters` — D1 하드 범위
- `must-imply-<archetype>` — D7 구속
- `<domain>-specific-acceptable` / `not-acceptable` — 좁은 도메인 허용
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <제약, 예: "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <후보가 반드시 만족해야 할 것>
  - <이것이 제약하는 D1-D7 차원>
  tldr:
  - wrong: <반례>
  - right: <좋은 예>
```

#### 2d. Session record (goal 규칙에 대한 감사 추적)

하위 4개 섹션을 모두 채워라:

**prefer** — 답이 "no / weak"이더라도 5개 질문을 **반드시** 모두 답하라:
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<허용되는 좁은 도메인 목록, 예: [naval]>]   # [] = 좁은 도메인 허용 안 함
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — 고려한 후보 하나당 한 줄, 탈락자도 포함:
```yaml
init_verdicts:
  - { name: <후보>, gate: init-005 | init-006 | init-007 | pass, reason: "<이유>" }
  # init-005 = 레드라인 패턴 일치 (자동 탈락)
  # init-006 = 사전의 첫 번째 뜻이 목표와 충돌
  # init-007 = 길이 범위 밖 (< 2 또는 > 8)
  # pass     = 모든 init 게이트 통과, 채점 대상 가능
```

**scores** — init을 통과한 후보 하나당 한 줄. 모든 점수가 >= 6.0. 모든 점수는 앵커를 가져야 한다:
```yaml
scores:
  - name: <후보>
    score: <0_to_10>
    anchors:
      - "D1: <글자 수 근거>"
      - "D2: <사전 첫 번째 뜻 근거>"
      - "D3: <합성어 문자 그대로의 뜻 근거>"
      - "D4: <trial 과 real 근거>"
      - "D5: <run 과 test 근거>"
      - "D6: <생생함 근거>"
      - "D7: <대형 장비 근거>"
    misses:
      - "<빠진 것 — 진짜 누락만 나열, 7개를 다 채울 필요는 없음>"
```

**final** — 선택과 백업을 선언:
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### 3단계 · 메타-규칙으로 감사

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator(`template/naming.okr-creator.yml`에 있음)가 11가지 검사(error와 warn 혼합)를 돌린다:

| 검사 | 레벨 | 무엇을 검증하는가 |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | 파일에 `goal-*` 규칙이 ≥1개 있다 |
| `okr-creator-002` has-keyresult-rules | error | 파일에 `keyresult-*` 규칙이 ≥1개 있다 |
| `okr-creator-003` has-task-specific-rules | error | 파일에 태스크 규칙(goal/keyresult 아님)이 ≥1개 있다 |
| `okr-creator-010` has-session-record | error | goal 규칙에 `session:` 필드가 있다 |
| `okr-creator-011` prefer-answers-all-five | error | 5개 init-004 질문이 모두 답해졌다 |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts가 비어 있지 않다 |
| `okr-creator-013` scores-have-anchors | error | 모든 점수에 비어 있지 않은 anchors 목록이 있다 |
| `okr-creator-014` scores-no-below-6 | error | 모든 점수가 >= 6.0이다 |
| `okr-creator-015` final-section-present | error | `final.pick`이 선언되어 있다 |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | pick 점수가 >= 7.0 |

**error 검사에 하나라도 실패하면**: 파일을 고치고 다시 실행하라. 흔한 수정:
- prefer 필드 누락 → `session.prefer`에 추가
- 점수가 앵커 없이 떠 있음 → `anchors: [...]` 추가
- 점수 < 6 → `init_verdicts`(탈락)로 옮기거나 점수 정의를 다시 세워라
- final 누락 → `final: { pick, backup }` 추가

**warn 검사에 실패하면**: 대응할지 트레이드오프를 기록할지 판단하라.

### 4단계 · 사용자가 최종 이름을 고른다

스킬은 제안하고, 사용자가 결정한다. 최종 이름은 `session.final.pick`에 선언되어 커밋된다.

## 파일

| 파일 | 역할 | 형식 |
|---|---|---|
| `SKILL.md` | 이 파일 — 워크플로 + 파일 인덱스 | markdown |
| `naming.template.yml` | `TBD_*` 자리표시자가 든 템플릿 — 복사, 이름 변경, 채우기 | `.rule` |
| `naming.trial-run-module.yml` | 완성된 세션 기록의 실전 예시 | `.rule` |
| `template/naming-concept.yml` | 객관적 평가 프레임워크(D1–D7, 레드라인, 채점 앵커) — `.rule` 항목 형태로 | `.rule` |
| `template/naming-brand.yml` | x-cmd 브랜드 규칙(길이, 대소문자, 선행식 선호) — `.rule` 항목 형태로 | `.rule` |
| `template/naming.okr-creator.yml` | 메타-규칙: `naming.<user-task>.yml`를 감사 (위의 11가지 검사) | `.rule` |
| `template/naming-x-cmd-mod.yml` | 선택적 x-cmd 모듈 네이밍 프리셋(스타터 세션 기록) | `.rule` |

## 주제적 vs 객관적 구분

| 객관적 (파일 / 코드에 들어 있음) | 주제적 (init에서 물어보고, 채점 안 함) |
|---|---|
| 사전의 첫 번째 뜻 | "생생한 쪽과 추상적인 쪽 중 어느 쪽을 원하는가" |
| 글자 수 | "도메인 X를 허용해도 되는가" |
| Trial / Real / Run / Test 의미 분류 | "naval 은유를 허용해도 되는가" |
| 합성어 문자 그대로의 뜻 | "중국어 출발인가 영어 출발인가" |
| 선행식 오염(unittest testcase, dryrun) | "짧은 쪽이 자기 설명적인 쪽보다 낫다" |

## 규칙

- **반드시** 목표를 먼저 조사하라 — 무엇에 이름을 짓는지, 무슨 역할을 하는지, 어떤 개념이 앵커인지.
- **반드시** `naming.template.yml`(`TBD_*` 자리표시자)에서 출발해, 태스크에 맞게 잘라내거나 채워라.
- **반드시** goal / key results / task rules / session record를 담은 `naming.<user-task>.yml`(`.rule` 형식)을 만들어라.
- **반드시** `template/naming.okr-creator.yml`과 함께 `x rule check`를 실행해 세션 기록을 감사하라.
- **반드시** 점수를 객관적 사실에 앵커링하라 — 사용자 반응에 따라 부풀리거나 깎아서는 안 된다.
- **반드시** 최종 이름은 사용자가 고르게 하라 — 스킬은 제안하고, 사용자가 결정한다.
- `template/naming-concept.yml`에 주제적 규칙을 추가해서는 **안 된다** — 그런 것은 태스크별 `session.prefer`에 넣는다.

## Related

- [rule](../rule/SKILL.md) — naming 세션은 x rule로 검사된다
- [score](../score/SKILL.md) — 후보는 score 프레임워크로 채점된다
- [ontology-database](../ontology-database/SKILL.md) — 선택된 이름은 ondb에 영속된다