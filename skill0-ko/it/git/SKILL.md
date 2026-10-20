---
name: git
description: |
  Git 및 코드 호스팅 플랫폼 관리 — GitHub, GitLab, Codeberg, Forgejo.
  진입 장벽 제로 —— x-cmd 설치 후 터미널에서 저장소 관리.
  "git", "github", "gitlab", "repo", "pull request", "code hosting" 작업 시 사용.

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

명령줄에서 Git 저장소와 코드 호스팅 플랫폼을 관리합니다.

## 빠르게 시작하기

```bash
# x-cmd 설치
eval "$(curl https://get.x-cmd.com)"

# GitHub 저장소 관리
x gh repo list
x gh repo clone owner/repo

# 풀 리퀘스트 생성
x gh pr create --title "Fix bug" --body "Description"

# Git 훅 관리
x git hook
```

## 무엇을 쓸 수 있나

| 명령 | 플랫폼 | 설명 |
|---------|----------|-------------|
| `x gh` | GitHub | GitHub CLI 전체 연동 |
| `x gl` | GitLab | GitLab 프로젝트 관리 |
| `x cb` | Codeberg | Codeberg 연동 |
| `x git hook` | 로컬 | Git 훅 관리 |

## 이 skill0는 계속 확장됩니다

GitHub 기본 기능부터 시작합니다. 추가 예정:
- GitLab 워크플로
- 코드 호스팅 모범 사례
- 저장소 이전 가이드
- CI/CD 연동 팁

## 전체 기능

x-cmd 설치 후 `x git --help` 로 모든 옵션을 확인할 수 있습니다.

## 관련 스킬

- [repo](../repo/SKILL.md) — x repo 를 통해 저장소 탐색/관리