---
name: skill0-writer
description: skill0 문서의 작성 규약 — 피라미드 구조, 줄 수 상한, 레이아웃 규칙.
metadata:
  related: "yfm,naming"
---

# skill0-writer

Skill0 문서는 **피라미드 원칙**을 따른다: 에이전트는 앞 10–30 줄만 읽을 수도 있으므로, 가장 중요한 정보가 반드시 앞에 와야 한다. 30줄 이후의 세부는 보너스이지 짊어지는 짐이 아니다.

## 규칙으로 잡히지 않는 것들

- **간결함보다 명확함.** 틀린 답을 주는 짧은 문서가 맞는 답을 주는 긴 문서보다 나쁘다.
- **보안 / 안전 경고는 반드시 명시적으로** — MUST, NEVER, DO NOT 를 쓴다. 유보 사항은 괄호짜리 삽입어가 아니라 완전한 문장으로 적는다.
- **상식에 장황한 설명을 붙이지 말라.** 관례용어 한 단어에 한두 문장이면 되면 거기서 멈춰라. 독자는 YAML, git, cache 가 무엇인지 이미 안다; 컨텍스트는 이 저장소에만 있는 것에 써라. 이유는 대개 군더더기다 — 규칙이 이유 없이 이상해 보일 때만 이유를 준다. (`sw-1200`)
- **표는 진짜 행렬에만.** 3개 이상 열이 있고, 행끼리 맞춰 읽어야 하는 경우. 두 열짜리 표는 표 문법을 입은 목록이다 — 목록으로 써라. 데이터셋은 문서 옆의 외부 `.tsv` 에 두고 링크해서 `x tsv` 로 조회할 수 있게 하라. (`sw-1250`)

## YFM — `SKILL.md` 전용

```yaml
---
name: <slug>                  # 디렉터리 이름과 같아야 함
description: <1-2 sentence summary an agent uses to decide whether to load>
---
```

`name` 과 `description` 은 load-bearing 이다. 나머지는 전부 [yfm](../yfm/SKILL.md) 의 `metadata:` 블록 아래에 쉼표 구분 scalar 로 넣는다 — 선택 사항이며, 인덱싱·탐색·온톨로지 훅에 구조를 더한다.

**하위 파일에는 YFM 을 넣지 않는다.** loader 가 걸러내는 건 `SKILL.md` 뿐이므로 frontmatter 가 필요한 것도 그것뿐이다. 다른 모든 파일(`references/*`, `usecase/*`, `EXAMPLE.md`, `*.report.md` …)은 이미 열기로 결정한 에이전트가 직접 읽는다 — 거기의 YFM 은 순수한 토큰 비용이고, 제목과 첫 줄이 이미 말해주는 목적을 되풀이할 뿐이다. 그런 파일은 `#` 제목부터 시작한다. 이 규칙에서 벗어나려면 파일 안에 이유를 밝혀라.

중국어 현지화 버전은 평행하는 `SKILL.cn.md` 를 쓴다 (스킬마다 하나). 한 파일 안에서 언어를 섞지 말라.

## 기계적 검사

[skill0-writer.rule.yml](skill0-writer.rule.yml) 에 있다. `x rule lint skill0-writer.rule.yml` 과 `x rule check -r skill0-writer.rule.yml lib/skill0/` 를 실행한다. 검사 범위: YFM 존재 + name/description 필드, name 형식, 줄 수 ≤ 100 (이상적은 50), 섹션 순서 install → usage → advanced → links, 영어 전용, 도입부 없음 / 결론 없음 / 반복 없음, 고아 파일 없음.

## 절단 안전성 검사

다 쓴 뒤 30줄에서 검토한다: 여기서 멈춘 에이전트가 잘못된 이해를 품게 될까?

그렇다면 핵심 조건을 앞으로 옮긴다. 첫 30줄은 (불완전하더라도) 올바른 멘탈 모델을 줘야 한다. 30줄 이후는 세부로 확장해라 — 피라미드는 스스로를 교정한다.

## 2단 로딩: description 은 매칭용, body 는 참조용

스킬 로더(Claude Code, Cursor, Continue 등)는 SKILL.md 를 두 단계로 로드한다:

  1. **YFM `description:`** — 매칭을 위해 에이전트의 카탈로그에 자동 로드된다.
     에이전트가 description 을 읽어 스킬을 로드할지 결정한다.
  2. **Body** — 매칭된 뒤 필요할 때 로드된다. 참조 자료.

함의:

- **Description** = *무엇인지 + 언제 로드할지* — 키워드 촘촘,
  트리거 풍부, 간결하게.
- **Body** = *어떻게 쓰는지 + 참조* — 예시, 스키마, 엣지
  케이스, 더 깊은 문서로 가는 링크.

**두 층 사이에 내용을 중복시키지 말라.** description 이 전하는 것을 body 는 같은 면을 되풀이하지 말고 *확장*해야 한다. 특히 body 의 첫 문단은 description 과 같은 기능 목록을 나열해서는 안 된다 — body 는 참조로 시작하지, 두 번째 요약으로 시작하지 않는다.

실용적 검사: description 을 완전히 지우고 body 의 앞 30줄만 읽어도, 에이전트가 그 스킬이 무엇을 하는지 언제 로드할지 여전히 보여야 한다. 그 정보가 description 에만 있다면 body 맨 위에는 더할 것이 없다 — 설명을 body 안으로 옮기고 description 은 headline 만 지니게 하라.

## 스킬은 튜토리얼이 아니라 지식 팩이다

스킬 body 는 초보자용 코스가 아니라 **LLM 을 위한 브리핑**이다.

- **능력**은 LLM 안에 있다. body 는 가르치지 않는다.
- **지식**은 x-cmd 데이터 도구(`x wkp` / `x rfc` / `x cve`, NVD / MITRE / GHSA)와 외부 소스에 있다. body 는 가리키기만 하고, 에이전트가 다시 가져온다.
- **프레이밍**은 스킬의 일이다: 문제의 형태, 관례, 구조화된 출력, 사용할 x-cmd 도구를 명명한다.

스킬이 담는 것은 해결 관점, 관례, 출력 형태, 소스 포인터다. **담지 않는** 것은 능력(LLM 에 이미 있다), 정적 데이터(곧 낡는다), 튜토리얼(sidecar 를 쓰라)이다.

세부사항이 너무 깊거나 너무 시의성적이면 sidecar(`references/`, `ANALYTICS.md`)나 항상 갱신되는 외부 문서로 밀어라.

## 외부 링크

두 종류를 모아라: **root links**(`llms.txt`, 문서 인덱스 같은 진입점)와 **useful links**(사용 사례 80%를 덮는 20% 문서에 대한 타깃 링크). root 를 앞에, useful 을 뒤에 둔다 — AI 는 순서를 이해한다. **중복 금지**, 다만 강조가 결정적으로 중요한 경우는 예외.

## 소프트 유보 사항(판단이 필요한 것)

- **하위 파일(CLEANUP.md, references/*)** 은 SKILL.md 보다 길어도 되지만 앞 20줄은 여전히 짊어진다 (같은 피라미드).
- **MUST** 모든 하위 파일을 부모 SKILL.md 에서 링크하라 (정방향 링크 필수). 하위 파일에서 부모 SKILL.md 로 되돌아가는 링크는 **선택 사항**이다 — usecase 파일은 경로로 부모를 암묵적으로 가리킨다. [skill0-writer.rule.yml](skill0-writer.rule.yml) 의 `sw-1000-no-orphan-docs` 가 강제한다.
- **추측** — 검증된 사실을 쓸지, "untested" 라고 표시하라.
- **이모지** — 스킬 주제가 요구하지 않는 한 쓰지 말라.

## Related

- [yfm](../yfm/SKILL.md) — skill0-writer 가 1층에 강제하는 YFM 관례
- [naming](../naming/SKILL.md) — 명명도 writer 규칙을 따른다
- [skill0-writer.rule.yml](skill0-writer.rule.yml) — 기계적 강제