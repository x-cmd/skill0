---
name: env
description: |
  소프트웨어 패키지, 언어 런타임, CLI 도구를 즉시 설치하고 관리.
  진입 장벽 제로 —— x-cmd 설치 후 몇 초 안에 원하는 도구를 준비. sudo 불필요.
  "install", "package", "python", "node", "jq", "runtime", "tool" 작업 시 사용.

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

어떤 소프트웨어든 즉시 설치합니다. sudo 불필요. 시스템 오염 없음.

## 빠르게 시작하기

```bash
# x-cmd 설치
eval "$(curl https://get.x-cmd.com)"

# Python 설치
x env use python

# Node.js 설치
x env use node

# CLI 도구 설치
x env use jq
x env use fzf

# 영구 설치 없이 먼저 시도해보기
x env try python3 script.py
```

## 무엇을 쓸 수 있나

600개 이상의 패키지:

- 언어 — python, node, go, bun, java, rust
- CLI 도구 — jq, yq, fzf, himalaya
- 개발 도구 — claude-code, code-server

## 핵심 기능

- **sudo 불필요** — 사용자 디렉터리에 설치
- **버전 관리** — 버전을 설치하고 전환
- **설치 전 체험** — `x env try` 로 임시 사용
- **정리** — `x env clean` 이 사용하지 않는 패키지 제거

## 이 skill0는 계속 확장됩니다

핵심 기능부터 시작합니다. 추가 예정:
- 자주 쓰는 설치 패턴
- 버전 고정 팁
- 다중 언어 프로젝트 설정 가이드

## 전체 기능

x-cmd 설치 후 `x env --help` 로 모든 옵션을 확인할 수 있습니다.

## 관련 스킬

- [install](../install/SKILL.md) — x env use 는 install 의 채널 중 하나
- [x-cmd](../x-cmd/SKILL.md) — env 의 상위 진입점