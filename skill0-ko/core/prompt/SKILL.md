---
name: prompt
description: x-cmd를 위한 prompt 엔지니어링 관례 — 템플릿 변수로 재사용, 구조 규칙, 안전 강제 패턴.
metadata:
  related: "devloop,rule"
---


# Prompt

## 핵심 원칙: 복붙하지 말고 재사용하라

x-cmd의 prompt는 재사용 가능한 조각을 조립해서 만들어지며, monolith로 쓰이지 않는다. prompt 템플릿에는 런타임에 shell 모듈이 해석하는 `<PLACEHOLDER>` 변수가 들어간다.

`claw`의 예시:
```
first_contact.md          # 독립 문서 — <FIRST_CONTACT_PROMPT>에 로드됨
msg_telegram.md           # 조립: <FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # 같은 조각, 다른 플랫폼 어댑터
heartbeat.md              # 다른 워크플로지만 <CHECK_PROMPT>는 공유
```

**이유**: 한 곳을 고치면 어디에나 전파된다. 플랫폼 어댑터(Telegram, Feishu, WeChat)는 행동 규칙은 공유하지만 전송 명령과 포맷 제한은 다르다.

자세한 재사용 패턴은 [reusing.md](reusing.md)를 보라.

## 구조 규칙

- prompt 파일 하나는 한 시나리오에 대한 완전하고 자립적인 지시 세트다
- 변수에는 `<UPPER_CASE>` 자리표시자를 쓴다 — 실제 데이터를 인라인으로 넣지 않는다
- 자리표시자는 prompt 자신이 아니라 호출하는 모듈이 해석한다
- Fragment = function(로직과 흐름), 데이터는 런타임에 덧붙인다(인자를 설정하듯)

## 안전 강제 패턴

안전과 행동 규칙은 **반드시** 명시적이고 강하게 써야 한다:

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

MUST, NEVER, DO NOT를 쓴다. 보안 언어 규칙은 [skill0-writer](../skill0-writer/SKILL.md)를 보라.

## 포맷 가이드 패턴

prompt가 포맷 능력 제각각인 여러 플랫폼을 겨냥할 때:

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## 실제 예시

prompt 조각은 현재 각 모듈의 `lib/data/prompt/`에 있다 (예: `claw/lib/data/prompt/`).
앞으로 `skill0/lib/skill0/<subskill>/`로 옮겨진다 — 구조는 같고, 정규 위치다.

현재 `claw/lib/data/prompt/`의 예시:
- `first_contact.md` — 새 워크스페이스 인사말, 재사용 가능한 조각
- `heartbeat.md` — 백그라운드 agent, 워크스페이스 상태를 읽음
- `msg_<platform>.md` — 플랫폼별 메시지 핸들러, 공통 조각 공유

## Related

- [devloop](../devloop/SKILL.md) — prompt가 devloop 태스크를 자주 이끌고 간다
- [rule](../rule/SKILL.md) — prompt 구조 규칙은 x rule이 강제한다