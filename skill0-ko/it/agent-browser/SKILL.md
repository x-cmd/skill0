---
name: agent-browser
description: Chrome/Chromium CDP 를 통한 브라우저 자동화 — 열기, 스냅샷, 클릭, 스크린샷. Playwright/Puppeteer 없이 웹 앱 테스트, 모바일 레이아웃, 자동화된 상호작용을 수행합니다.
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## 설치

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # 선택 사항. 기존 Chrome 을 쓰면 생략 가능
```

## 기존 Chrome 에 연결

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## 프로필과 멀티 세션

`--profile /tmp/ab-default` 를 사용하면 한 번만 인증하고 여러 세션에서 공유할 수 있습니다.
새로운 `--user-data-dir` 마다 Chrome 인증 프롬프트가 뜨므로, 이를 피하려면 기본값을 재사용하세요.

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

세션 이름은 전역이므로, 에이전트 간 충돌을 피하려면 `<프로젝트>-<기기>` 형식을 사용하세요.
세션은 데몬을 공유하지만 완전히 격리됩니다 (쿠키, 캐시, 탭).

## 스킬과 자주 쓰는 명령

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

데이터가 계속 쌓이므로, 주기적인 정리 방법은 [CLEANUP.md](CLEANUP.md) 를 참고하세요.

## 관련 스킬

- [install](../install/SKILL.md) — x install 채널을 통한 설치/실행
- [devloop](../devloop/SKILL.md) — devloop 에서 시각적 전후 검증에 사용
- [lovable](../../life/lovable/SKILL.md) — lovable 이 웹 검증을 agent-browser 로 라우팅