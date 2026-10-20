---
name: install
description: |
  시스템이 허용하는 어떤 방식으로든 소프트웨어를 설치한다. `x install`을 권장한다 — 모든 방법을 한곳에 모아 보여주고
  가장 좋은 것을 고르는 단일 현관. 여기에 `x eget`/`x env use`/`x pixi` 채널과 미러 전환이 가능한 시스템 패키지
  매니저를 더하면 된다. 모든 x-cmd 채널은 $HOME에 설치된다 — sudo 불필요, 시스템 오염 없음.
  "install", "apt", "brew", "eget", "pixi", "package manager", "mirror"에 사용한다.
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

시스템이 허용하는 어떤 방식으로든 소프트웨어를 설치한다. **모든 x-cmd 채널(`x eget`, `x env use`, `x pixi`)은 `$HOME`에 설치된다 — sudo 불필요, 시스템 오염 없음.** 시스템 패키지 매니저(`x apt`, `x brew`, …)만 OS를 건드리며 sudo가 필요할 수 있다.

## 채널 선택

- `x install` — **권장.** 단일 현관 — 도구의 모든 설치 방법을 나열하고 가장 좋은 것을 고른다
- `x eget` — 업스트림 저장소(GitHub / Codeberg releases)에서 최신 바이너리를 바로 받는다
- `x env use` — x-cmd가 호스팅하는 런타임과 도구 (`x pkg use` 래퍼)
- `x pixi` — conda / pixi 생태계 패키지
- `x apt/brew/dnf/pacman` — 시스템 패키지 매니저 (sudo가 필요할 수 있음)

## 사전 조건

x-cmd는 위 채널을 모두 제공한다:
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — 권장되는 단일 현관

모든 도구에는 여러 설치 경로가 있다. `x install`은 자동으로 가장 좋은 것을 고른다. 아래 형태는 모두 비대-inter랙티브(agent / CI 안전)다:
```bash
x install bun                            # 설치 —— 자동으로 최적의 방법 선택
x install --printinfo ripgrep            # 모든 설치 방법을 먼저 나열 (읽기 전용)
x install --withtool brew jq             # 매니저를 강제 지정; 또는 접두 형태: brew/jq
x install --sys bun                      # 시스템 패키지 매니저만 사용
x install --printcmd bun vim             # 명령을 미리 보고만 실행하지 않음
x install --env                          # 플랫폼 / 아키텍처 / 배포판 탐지
x install --available-tool --installed   # 이 머신에 어떤 패키지 매니저가 있는가
```

### 설치 가능한 것 찾기

`x install --ls`는 색인된 모든 도구를 TSV로 내보낸다 — 오프라인에서 grep / awk로 다뤄라:
```bash
x install --ls --tsv | head -1                  # 헤더
x install --ls --tsv | grep -i json             # 키워드로 검색
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # 언어로 거르기
x install --search http                         # 레지스트리 전반 통합 검색
```
TSV 컬럼: `name category lang source desc_cn desc_en binlist rule other`.

## 미러 바꾸기 (다운로드 가속)

느린 시스템 패키지 매니저를 더 빠른 / 로컬 미러로 돌려라. 각각 `mirror ls`(옵션 나열)와 `mirror set <code>`(적용, 비대-inter랙티브)를 제공한다:
```bash
x brew mirror ls          # 나열: official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # 쓰인화(Tsinghua) 미러 적용
x apt mirror set tuna     # Debian / Ubuntu 에도 같은 형태 (dnf, pacman 도 동일)
```
대상 패키지 매니저가 설치되어 있어야 한다.

## 더 보기

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — install 앞에서 총괄하는 우산 진입점
- [agent-browser](../../it/agent-browser/SKILL.md) — 바이너리가 없으면 install이 agent-browser로 라우팅한다
- [env](../env/SKILL.md) — install과 env는 x-channel 아키텍처를 공유한다