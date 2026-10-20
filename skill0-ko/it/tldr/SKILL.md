---
name: tldr
description: |
  tldr-pages 프로젝트의 실용적 예제가 담긴 명령 레퍼런스.
  진입 장벽 없음 — x-cmd, curl 또는 어떤 tldr 클라이언트로든 사용.
  "tldr", "cheatsheet", "command help", "examples", "how to"에 활용.

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

실제 예제가 곁들여진 빠른 명령 레퍼런스. "이 명령 어떻게 쓰지?"에 대해 man 페이지보다 낫습니다.

## 빠른 시작

```bash
# x-cmd 사용
x tldr git                    # Git 사용 예시
x tldr --lang zh python       # 중국어 문서
x tldr --fz                   # 대화형 검색

# x-cmd 없이 — curl 사용
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# 또는 tldr 클라이언트 설치
pip install tldr
npm install -g tldr
tldr tar
```

## 사용 가능 명령

- `x tldr <cmd>` — 명령의 예시 표시
- `x tldr --lang zh <cmd>` — 중국어
- `x tldr --fz` — 대화형 fzf 검색
- `x tldr --cat <cmd>` — 원본 markdown 표시
- `x tldr --ls` — 사용 가능한 모든 명령 나열
- `x tldr --update` — 페이지 캐시 갱신

## 단독 대안

- 온라인: https://tldr.sh
- Python: `pip install tldr`
- Node: `npm install -g tldr`
- 원본 페이지: github.com/tldr-pages/tldr

## 이 skill0는 성장 중

핵심부터 시작합니다. 앞으로 추가될 내용:
- 자주 쓰는 명령 패턴
- 플랫폼별 주의사항
- agent 워크플로와의 통합

## Related

- [git](../git/SKILL.md) — 자주 쓰는 git 서브명령 tldr
- [install](../install/SKILL.md) — install 서브명령 tldr
