---
name: wikipedia
description: |
  x wkp 로 위키백과 검색 및 읽기 — MediaWiki API 기반, API 키 불필요,
  설치 작업 없이 바로 사용; 질의, 본문 추출, 추천 검색, DDG 라우팅을 한 모듈에서.
  wiki, wikipedia, 백과사전 조회, 문서 요약 작업 시 로드.

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

출력은 평문 추출본(대략 첫 문단 + 정보 상자)입니다. 하위 명령의 동사가 출력 형태를 결정합니다 — 검색 후 요약은 `hop`, 제목이 이미 아는 경우는 `extract`, 후보 찾기는 `search`, 오타 제시는 `suggest`. 기본 사이트는 영어 위키백과이며 `--lang` / `--api-url` 로 다른 위키로 전환할 수 있습니다.

## `x wkp` 빠르게 시작하기

```bash
x wkp hop Python                      # 검색과 첫 결과 추출을 한 번에
x wkp extract OpenAI                  # 알려진 문서의 요약
x wkp search "Linux kernel"           # 제목이 확실하지 않을 때 후보 목록
x wkp suggest pythen                  # 오타 제시: 검색 전에 교정 힌트 제공
```

모든 플래그와 하위 명령은 `x wkp -h`로 확인할 수 있습니다.

## 데이터와 인접 도구

업스트림: `https://en.wikipedia.org/w/api.php` — MediaWiki action API. 형제 프로젝트(Wikidata, Wiktionary, Commons)도 같은 방식으로 접근할 수 있습니다. `--api-url` 을 해당 서브도메인으로 지정하면 됩니다.

위키텍스트 요약에서 한 단계 더 나가는 질문을 위해서는:
- `x wkp : <query>` / `x wkp ddgo <query>` — 동일한 `x wkp` 모듈을 사용하며 DuckDuckGo 의 위키백과 색인을 통해 라우팅 (모호하거나 구어적인 질의를 제목 검색보다 잘 처리)
- `x ddgo <query>` — 일반 웹 검색. 위키백과에 문서는 없지만 주제가 공개 웹에 존재할 때 유용
- 더 넓은 `x hn` / `x rfc` / `x se` 조사 도구 모음은 [knowledge](../knowledge/SKILL.md) 스킬 참고
- `x wkp open <page>` — 렌더링된 페이지 자체가 필요한 경우 브라우저로 대체 (정보 상자, 표, 이미지)