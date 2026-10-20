---
name: issue
description: devloop을 위한 issue 관리 —— 목표, rule.yml, 핵심 결과, issue 생명주기에 대한 템플릿.
metadata:
  related: "devloop,repo"
---


# issue

[devloop](../devloop/SKILL.md)의 일부다.

## 새 개발 issue 템플릿

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Issue 생명주기

| 단계 | 행동 | 댓글 내용 |
|-------|--------|-----------------|
| Created | 템플릿과 함께 `gh issue create` | goal, key-results, rule.yml |
| In progress | 작업이 진행되는 동안 갱신 | 진행 기록, 중간 스크린샷 |
| Verified | `x rule check` 통과 | rule check 결과, after 스크린샷 |
| Closed | `gh issue close` | commit SHA, 최종 검증 요약 |

## 완료 댓글 템플릿

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## 규칙

- 모든 개발 issue에 `goal`과 `keyresults`를 **반드시** 포함한다 — 예외 없음
- rule.yml을 issue 본문이나 첫 댓글에 코드 블록으로 **반드시** 올린다
- 프런트엔드 변경은 변경 전/후 스크린샷을 **반드시** 찍는다
- 검증 증거 없이 issue를 닫아서는 **절대** 안 된다
- 로드맵에서 보이도록 issue를 프로젝트 보드에 연결한다

## Related

- [devloop](../devloop/SKILL.md) — 목표 주도 루프(goal/rule.yml/KRs)의 tracker
- [repo](../repo/SKILL.md) — issue는 x-repo 레이아웃의 repo에 붙는다