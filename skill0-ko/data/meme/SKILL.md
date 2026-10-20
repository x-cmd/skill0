---
name: meme
description: |
  템플릿 위에 글자를 얹어 밈 이미지 생성.
  진입 장벽 제로 —— Python + Pillow 로 동작하며 별도 프레임워크 불필요.
  템플릿은 awesome-meme 데이터 저장소에서 필요할 때 받아옵니다.
  "meme", "meme generator", "text overlay", "distracted boyfriend", "image macro" 작업 시 사용.

metadata:
  version: "0.1.0"
  category: "image"
  tags: "meme,image,text-overlay,pillow,imagemagick"
  repository: "https://github.com/edwinjhlee/awesome-meme"
  type: "skill0"
  related: "agent-browser"
---


# meme — skill0

밈 이미지를 생성합니다. 템플릿 30종 이상. 진입 장벽 제로.

AI 에이전트가 이 파일을 읽으면 밈을 만드는 방법을 알 수 있습니다. x-cmd 는 필요 없습니다.

## 빠르게 시작하기

```bash
# 의존성 설치
pip install pillow pyyaml

# 밈 생성 (템플릿을 GitHub 에서 자동 다운로드)
python3 scripts/meme_render.py distracted-boyfriend "ZIG" "ME" "RUST"
```

## 예시 더 보기

```bash
python3 scripts/meme_render.py this-is-fine "ERROR LOG" "THIS IS FINE"
python3 scripts/meme_render.py drake-hotline-bling "Write tests" "Ship it"
python3 scripts/meme_render.py expanding-brain "Copy paste" "Google it" "Read docs" "Ask AI"
```

## 옵션

| 옵션 | 값 | 기본값 | 설명 |
|--------|--------|---------|-------------|
| `--backend` | pillow, magick | pillow | 렌더링 백엔드 |
| `--layout` | chest-label, above-head, bottom-label | (스펙 기본값) | 텍스트 배치 프리셋 |
| `--output` | 파일 경로 | meme_output.jpg | 출력 파일 경로 |

## 글꼴 선택

- 영어 / 라틴 문자 — Impact (기본값)
- 중국어 / CJK — PingFang (macOS) / Noto Sans CJK (Linux)
- 혼합 — 각 슬롯을 각각 독립적으로 자동 판별

Impact 에는 CJK 글리프가 없어서 중국어 텍스트가 보이지 않습니다. 렌더러가 CJK 를 자동 판별해 시스템 글꼴로 대체합니다. Linux 에서: `apt install fonts-noto-cjk`.

## 순수 셸 (Python 없이)

```bash
bash scripts/meme_render.sh distracted-boyfriend "ZIG" "ME" "RUST"
```

## x-cmd 로 업그레이드

x-cmd 가 이미 설치되어 있다면:

```bash
eval "$(curl https://get.x-cmd.com)"
x meme distracted-boyfriend "ZIG" "ME" "RUST"
```

결과는 같으면서 x-cmd 생태계와의 연동이 더 깔끔해집니다.

## 데이터 소스

템플릿은 [awesome-meme](https://github.com/edwinjhlee/awesome-meme) 에 있습니다. 렌더러가 스펙과 이미지를 GitHub 에서 필요할 때 받아옵니다.

## 문서

- [references/INSTALL.md](references/INSTALL.md) — 의존성 (Pillow, ImageMagick, 글꼴)
- [references/PILLOW.md](references/PILLOW.md) — Pillow 백엔드 상세
- [references/IMAGE_MAGICK.md](references/IMAGE_MAGICK.md) — ImageMagick 백엔드 상세
- [references/GUIDELINES.md](references/GUIDELINES.md) — AI 에이전트 사용 가이드라인

## 관련 스킬

- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 로 밈 이미지를 렌더링하거나 출력할 수 있음