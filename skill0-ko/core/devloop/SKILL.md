---
name: devloop
description: 목표 주도 개발 루프 —— 목표를 정의하고, 핵심 결과로 규칙을 쓰고, 시각적으로 검증하고, issue tracker에 동기화한다.
metadata:
  related: "rule,score,install,agent-browser,issue,repo,prompt"
---


# devloop

## Setup

```
x rule init :ror                          # 또는 프로젝트 전용 룰셋
x env use agent-browser                   # 시각적 검증에 사용
```

## Workflow

```
goal → rule.yml → code → verify → issue
```

### 1. 목표 정의 → rule.yml 작성

코딩하기 전에, 아래 태스크를 위한 rule.yml을 만든다:

```yaml
goal: "Fix English version showing Chinese tags in Features section"
keyresults:
  - kr-1: "English mode Features tags are all English"
  - kr-2: "Chinese mode Features tags remain Chinese"
  - kr-3: "Build passes with no regressions"
rules:
  - id: kr-1-verify
    name: english-tags-no-chinese
    apply: "src/components/Features.tsx"
    level: error
    desc:
    - When language=en, all details[] items must be English
    - No Chinese characters in any tag badge in English mode
```

Rule 필드: `id`, `name`, `apply`, `level`, `desc`, `tldr`. `x rule -h`를 보라.

**반드시** `goal`과 `keyresults`를 포함해야 한다 — 모든 개발 태스크에 필수인 두 필드다.

### 2. 실행 → 시각적 검증 (프런트엔드)

```
agent-browser open <url> --session <proj> --headed
agent-browser --session <proj> screenshot /tmp/before.png
# ... 변경 ...
agent-browser --session <proj> screenshot /tmp/after.png
```

**반드시** 변경 전과 변경 후 모두 스크린샷을 찍어라. 의도와 대조해 보라:
1. AI 비전 검사: after.png가 목표와 일치하는가?
2. 불일치하면 → 반복해서 다시 스크린샷
3. 업로드 전에 **모든 개인정보를 제거하라** (토큰, 이메일, 개인 정보)

### 3. x rule로 검증

```
x rule scan <files>     # 빠름(약 1분), 내부 루프용
x rule check <files>    # 철저히(약 10분)
x rule audit <files>    # 전체 리포트(약 30분)
```

### 4. issue tracker에 동기화

[issue/SKILL.md](../issue/SKILL.md)를 보라. 최소한: 목표, 핵심 결과, rule.yml, 변경 전/후 스크린샷을 issue에 올려라.

## Agent tools

- `x rule scan` — 반복 작업 중 빠른 검사
- `x rule check` — 커밋 전 전체 준수 확인
- `agent-browser screenshot` — 변경 전/후의 시각적 증거
- `gh issue create/comment` — 목표 + rule.yml을 tracker에 동기화

## Related

- [rule](../rule/SKILL.md) — rule.yml은 검증 뼈대다
- [score](../score/SKILL.md) — KR 채점은 score 프레임워크를 쓴다
- [install](../install/SKILL.md) — 개발 환경을 구성한다
- [agent-browser](../../it/agent-browser/SKILL.md) — 변경 전/후 시각적 검증
- [issue](../issue/SKILL.md) — 목표 + KRs + 스크린샷을 issue tracker에 동기화
- [repo](../repo/SKILL.md) — repo 안에서 작업을 pull/push
- [prompt](../prompt/SKILL.md) — prompt 관례가 devloop 태스크를 자주 이끈다