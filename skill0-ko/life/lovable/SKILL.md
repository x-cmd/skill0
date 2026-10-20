---
name: lovable
description: Lovable MCP 도구 사용법 — 프로젝트 배포, agent에 메시지 보내기, agent-browser로 테스트. 로컬 repo에 위임해 credits를 절약합니다.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## 설정 & 전체 MCP 레퍼런스

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

전체 MCP 레퍼런스: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Pro/Business 필요
- Auth — 첫 호출 시 브라우저 OAuth 프롬프트
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## 핵심 워크플로: 로컬 우선, credits 아끼기

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## 규칙

- **반드시 project ID 검증** — 어떤 작업이든 그 전에 `list_projects query=<name>`를 호출해 올바른 `project_id`를 확인하세요. **기억이나 이전 컨텍스트의 ID를 절대 재사용하지 마세요.** 배포 후 30초 기다린 다음, 성공을 보고하기 전에 라이브 사이트를 검증하세요.
- **반드시 변경 전후 스크린샷** — 프로젝트 수정 시, before-screenshot을 찍고, 변경한 다음, after-screenshot을 찍으세요. 의도대로 적용됐는지 비교합니다. 해당되면 GitHub issue에 게시하세요. **업로드 전 모든 개인정보**(토큰, 개인 신상, 이메일)를 반드시 스크럽하세요.

## 자주 쓰는 MCP 호출

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## 사용 사례 — Analytics

빠른 개요: `list_projects publish_status=published`는 프로젝트별 방문자 수를 반환합니다.
schema: `id, project, 24h, 7d, 30d, URL`로 TSV/CSV로 내보내세요.

자세한 분석(pageviews, bounce rate, 트래픽 소스, 기기)은 [ANALYTICS.md](ANALYTICS.md) 참고.

## 사용 사례 — Knowledge (Lovable agent에 영구 저장되는 지시)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
항상 `set` 전에 `get` — 통째로 교체됩니다. 최대 10K 글자. 참고: `get/set_workspace_knowledge`.

## agent-browser로 테스트

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
전체 사용법: skill0 `agent-browser` 참조.

## 문제 해결

- 사이트가 갱신되지 않음 — `deploy_project`
- 코드 변경, 로컬이 있음 — 로컬 → push → deploy
- 코드 변경, 로컬이 없음 — `send_message` (높은 credits 비용)
- 모바일 테스트 — `agent-browser set device "iPhone 14"`

PWA 문제, 동기화 등은 [TROUBLESHOOTING.md](TROUBLESHOOTING.md) 참조.

## 더 많은 정보

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — 전체 문서 인덱스
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — 제품 허브, 가격, 가이드, 템플릿
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack 등
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — Notion, Linear, Jira를 빌드에 연결
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — REST로 프로그래밍 방식으로 앱 빌드

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — 검증 플로우
- [prompt](../prompt/SKILL.md) — agent와 통신
- [devloop](../devloop/SKILL.md) — lovable 프로젝트는 devloop 형태를 따름
