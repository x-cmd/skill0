---
name: lovable
description: Používání Lovable MCP nástrojů — nasazení projektů, zprávy agentovi, testování přes agent-browser. Kredit šetříš delegováním na lokální repozitář.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Nastavení & úplný MCP přehled

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Úplný MCP přehled: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plán — vyžaduje Pro/Business
- Auth — při prvním volání výzva OAuth v prohlížeči
- Klienti — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Základní postup: nejdřív lokálně, šetři kredity

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Pravidla

- **MUSÍ ověřit ID projektu** — zavolej `list_projects query=<name>` a před jakoukoli akcí potvrď správné `project_id`. **NIKDY nepoužij ID z paměti nebo předchozího kontextu.** Po nasazení počkej 30 s, pak ověř živý web, než nahlásíš úspěch.
- **MUSÍ pořídit snímky před i po** — když projekt upravuješ, pořiď snímek před změnou, proveď změny, pořiď snímek po změně. Porovnáním ověř, že je to zamýšlený výsledek. Následně zveřejni v GitHub issue, když je to relevantní. **Před nahráním odstraň všechna osobní data** (tokeny, osobní údaje, e-maily).

## Běžná volání MCP

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Případ použití — analytika

Rychlý přehled: `list_projects publish_status=published` vrátí počty návštěvníků podle projektů.
Exportuj jako TSV/CSV se schématem: `id, project, 24h, 7d, 30d, URL`.

Pro podrobnou analytiku (zobrazení stránek, bounce rate, zdroje návštěvnosti, zařízení) se podívej na [ANALYTICS.md](ANALYTICS.md).

## Případ použití — znalosti (trvale uložené pokyny pro Lovable agenta)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Vždy nejdřív `get`, pak `set` — nastavení celý obsah nahradí. Max. 10K znaků. K dispozici je také `get/set_workspace_knowledge`.

## Testování přes agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Úplné použití: podívej se na skill0 `agent-browser`.

## Řešení problémů

- Web není aktualizovaný — `deploy_project`
- Změna kódu, lokální verze existuje — lokálně → push → deploy
- Změna kódu, lokální verze není — `send_message` (vysoká spotřeba kreditů)
- Mobilní test — `agent-browser set device "iPhone 14"`

Pro problémy s PWA, problémy se synchronizací a další viz [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Další informace

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — úplný index dokumentace
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — centrum produktu, ceníky, průvodci, šablony
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack atd.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — zapoj Notion, Linear, Jira do buildu
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — programové tvorbu aplikací přes REST

## Související

- [agent-browser](../../it/agent-browser/SKILL.md) — postup ověřování
- [prompt](../prompt/SKILL.md) — komunikace s agentem
- [devloop](../devloop/SKILL.md) — projekty v lovable sledují strukturu devloopu
