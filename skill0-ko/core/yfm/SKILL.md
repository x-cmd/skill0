---
name: yfm
description: |
  어떤 마크다운 문서에도 쓰이는 YAML front matter(YFM). x-cmd 의 기본은 최상위 필드 세 개: `tags`, `description`, `memo`. 이 기본은 Agent Skills frontmatter 형태를 빌려왔다 — <https://agentskills.io/specification> 참고. yfm 모듈은 헬퍼다: `x yfm ls / init / lint`.

metadata:
  related: "skill0-writer,ontology-database"
---


# yfm — skill0

## YFM 채택하기

에이전트, 인덱스, 온톨로지 파이프라인이 훑을지도 모르는 어떤 마크다운에도 YFM 을 쓴다. **이미 쓰이는 방언(dialect)이 있으면 그걸 따른다** (Agent Skills, Obsidian, Jekyll, Hugo 등) — x-cmd 기본값은 다른 방언이 지배하지 않을 때만 적용된다.

## x-cmd 기본값: 세 개의 필드

```yaml
---
tags: [design, front-matter]
description: 이 파일을 열지 말지 결정하는 독자를 위한 한 문장 요약.
memo:
  2026-07-31T14:30:00+08:00: aliases 를 삭제하고, 세 번째 필드 이름을 memo 로 바꿨다.
---

# 제목

본문...
```

- **`tags`** — 최상위 slug 목록 `[a-z0-9-]`. 소비처: 온톨로지 인덱싱용 collector.
- **`description`** — 최상위 문자열. 한 문장. Agent Skills 의 `description:` 이 아니다 (그건 SKILL.md 전용 요구사항이며 `skill0-writer` 가 관할한다).
- **`memo:`** — 최상위 map, 파일의 수정 이력. 키는 ISO 8601 타임스탬프(`YYYY-MM-DDTHH:mm:ss±HH:mm`, 작성자의 로컬 오프셋); 값은 짧은 변경 설명. 최신순. 남길 만한 이력이 없으면 생략한다.

### 적용 범위

- `<project>/.x-cmd/story/` — `issue:` 로 확장 — [usecase/story.md](usecase/story.md) 참고.
- GitHub issue / PR 본문 — `repo:`, `number:` 로 확장 — [usecase/git-issue-pr-wiki-markdown-etc.md](usecase/git-issue-pr-wiki-markdown-etc.md) 참고.
- GitHub `README.md` — 기본 필드만.

## 모듈

yfm 모듈은 헬퍼다. 세 개의 명령:

- `x yfm ls [path]` — YFM 블록 나열; 기본값은 현재 디렉터리
- `x yfm init [path]` — path 아래 각 마크다운 파일에 x-cmd 기본 블록을 씀
- `x yfm lint [path]` — 각 YFM 블록이 유효한 YAML 이고, 자신이 주장하는 방언을 따르는지 검사

## 외부 front matter 읽기

collector 는 여러 방언을 읽어 들인다. 기본값이 빌려온 규격은 <https://agentskills.io/specification> 참고. 방언별:

- [Agent Skills](usecase/agentskills.md) — `metadata:` 는 string→string; 최상위는 닫혀 있음
- [Obsidian](usecase/obsidian.md) — `tags` / `aliases` / `cssclasses` 는 예약어
- [Jekyll](usecase/jekyll.md) — 목록 또는 **공백** 구분
- [Hugo](usecase/hugo.md) — TOML 가능; taxonomy 은 사이트 설정 따름