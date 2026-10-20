---
name: knowledge
description: |
  Hacker News, Wikipedia, DuckDuckGo, RFC 문서, Stack Exchange를 명령줄에서 검색.
  진입 장벽 제로 —— x-cmd 설치 후 바로 검색 시작.
  "search", "hn", "hacker news", "wikipedia", "ddgo", "duckduckgo", "rfc", "stack overflow" 작업 시 사용.

metadata:
  version: "0.1.0"
  category: "knowledge"
  tags: "search,hn,wikipedia,ddgo,duckduckgo,rfc,stack-overflow,knowledge"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# knowledge — skill0

인터넷의 지식 소스를 명령줄에서 검색합니다.

## 빠르게 시작하기

```bash
# x-cmd 설치
eval "$(curl https://get.x-cmd.com)"

# Hacker News 인기 게시물
x hn top

# 위키백과 검색
x wkp "artificial intelligence"

# DuckDuckGo 검색
x ddgo "rust programming language"

# RFC 문서
x rfc 2616

# Stack Exchange 검색
x se "how to exit vim"
```

## 무엇을 쓸 수 있나

| 명령 | 소스 | 예시 |
|---------|--------|---------|
| `x hn top` | Hacker News | 인기 게시물 Top 10 |
| `x hn new` | Hacker News | 최신 제출 글 |
| `x wkp <query>` | Wikipedia | 문서 검색 |
| `x ddgo <query>` | DuckDuckGo | 웹 검색 |
| `x rfc <number>` | RFC 문서 | RFC 규격 읽기 |
| `x se <query>` | Stack Exchange | Q&A 검색 |

## 이 skill0는 계속 확장됩니다

핵심 기능부터 시작합니다. 추가 예정:
- 더 많은 소스 (Project Gutenberg, arxiv)
- 고급 검색 패턴
- 결과 필터링과 서식 팁

## 전체 기능

x-cmd 설치 후 `x knowledge --help` 로 모든 옵션을 확인할 수 있습니다.

## 관련 스킬