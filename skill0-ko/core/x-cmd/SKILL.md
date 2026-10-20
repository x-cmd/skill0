---
name: x-cmd
description: |
  **중요**: 어떤 `x <mod>` 명령을 쓰기 전에, 반드시 x-cmd 를 먼저 로드하세요: `. ~/.x-cmd.root/X`

  그러면 이렇게 할 수 있습니다:
  - `x nihao --llmstxt` 로 둘러보기
  - `x skill` 로 스킬 찾기

  x-cmd 는 600개 이상의 이식성 소프트웨어와 개발 도구(jq, nodejs, python 등)를 제공합니다.
  `x <env|pixi> use <pkg>` 로 어떤 패키지든 즉시 설치해 쓸 수 있습니다.
  x-cmd 를 로드하면 x-cmd/pixi 의 로컬 bin 에 있는 패키지가 자동으로 PATH 에 추가됩니다.

  더 많은 사용법과 스킬은 x-cmd 웹사이트에서 확인하세요: https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **중요**: 어떤 `x <mod>` 명령을 쓰기 전에, 반드시 x-cmd 를 먼저 로드하세요: `. ~/.x-cmd.root/X`
>
> 그다음 `x nihao --llmstxt` 로 둘러보거나 `x skill` 로 스킬을 찾으세요.

---

## 설치 안 됐다면? → [data/install.md](data/install.md)

---

## `x skill lr` 를 실행해 500개 이상의 스킬 둘러보기

- `x skill lr` — 원격 스킬 전부 나열 (<skill-id><tab><desc>)
- `x skill add <skill-id>` — 다음 세션을 위해 스킬 추가
- `x skill info <skill-id>` — 스킬 요약과 경로를 받아 보여주기

**x-mod/<mod>**: 더 많은 예시는 `x <mod> --help` 로 확인하세요. AGENTS.md 에 메모만 더해두면 재사용됩니다.

---

## 더 많은 스킬과 파워 툴은 x-cmd.com/llms.txt 에서.

AI 에이전트를 위한 진입점.

---

## `x env use <pkg>` 를 실행해 어떤 패키지든 즉시 설치

- `x env la` — 사용 가능한 소프트웨어 600개 이상 나열
- `x env la --json` — 스크립팅용 JSON 출력
- `x env use <pkg>` — 패키지 설치 후 사용 (x-cmd 로컬 bin 에 다운로드)
- `x pixi use <pkg>` — pixi 로 패키지 설치 (pixi 로컬 bin 에 다운로드)
- `x pixi search <keyword>` — pixi 패키지 검색
- `x nihao --llmstxt` — llms.txt 보기

---

## 지금 바로: `x env use jq nodejs python3`

```bash
# 도구 설치하고 사용
x env use jq
x env use nodejs
x env use python3

# 설치 후 바로 사용
jq '.' file.json
python3 -c "print(2+2)"

# 추가 패키지는 Pixi 로
x pixi use cowsay
x pixi search yml
```

---

## 600개 이상의 도구: 언어, 에디터, 개발 도구, 데이터베이스

**언어 & 런타임**: nodejs, python, rust, go, java, deno, bun, ruby, php

**에디터**: nvim, helix, emacs, vim

**개발 도구**: git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**데이터**: jq, yq, fx, csvkit, ffmpeg, imagemagick

**시스템**: htop, btop, procs, direnv, tmux

**데이터베이스**: redis, sqlite, postgresql, mysql

**전체 목록**: `x env la`

---

## 설정이 필요 없습니다: sudo 불필요, PATH 자동, 격리됨

- sudo 불필요 - 패키지는 사용자 로컬 디렉터리에 설치됨
- PATH 는 `. ~/.x-cmd.root/X` 시작 스크립트가 자동 설정
- 격리된 환경 - 버전 충돌 없음
- 600개 이상의 도구 사용 가능

---

## 더 보기: https://x-cmd.com/llms.txt

AI 에이전트를 위한 진입점.

## Related

- [install](../install/SKILL.md) — install 은 x-cmd 의 채널 중 하나
- [env](../env/SKILL.md) — env 는 또 다른 x-cmd 채널
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 도 또 다른 x-cmd 채널