---
name: lovable
description: Folosirea uneltelor Lovable MCP — deploy proiecte, mesaje către agent, testare cu agent-browser. Minimalizează creditele delegând către repo-ul local.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Setup și referință MCP completă

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Referință MCP completă: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Pro/Business necesare
- Auth — prompt OAuth în browser la prima apelare
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Workflow principal: local întâi, economisește creditele

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Rules

- **TREBUIE să verifici project ID-ul** — apelează `list_projects query=<name>` ca să confirmi `project_id`-ul corect înainte de orice acțiune. **NICIODATĂ** nu reutiliza un ID din memorie sau din contextul anterior. După deploy, așteaptă 30s apoi verifică site-ul live înainte de a raporta succesul.
- **TREBUIE capturi de ecran înainte și după** — când modifici un proiect, fă o captură înainte, fă modificările, fă o captură după. Compară-le ca să confirmi intenția. Postează în issue-ul de GitHub când e cazul. **Șterge toate datele private** (token-uri, informații personale, e-mailuri) înainte de upload.

## Apeluri MCP uzuale

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Usecase — Analytics

Privire rapidă: `list_projects publish_status=published` întoarce numărul de vizitatori per proiect.
Exportă ca TSV/CSV cu schema: `id, project, 24h, 7d, 30d, URL`.

Pentru analitice detaliate (pageviews, bounce rate, surse de trafic, dispozitive), vezi [ANALYTICS.md](ANALYTICS.md).

## Usecase — Knowledge (instrucțiuni persistate pentru agentul Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Fă întotdeauna `get` înainte de `set` — înlocuiește complet. Max 10K caractere. Și: `get/set_workspace_knowledge`.

## Testează cu agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Utilizare completă: vezi skill0 `agent-browser`.

## Depanare

- Site neactualizat — `deploy_project`
- Modificare de cod, există local — Local → push → deploy
- Modificare de cod, nu există local — `send_message` (cost mare de credite)
- Testare pe mobil — `agent-browser set device "iPhone 14"`

Pentru probleme PWA, probleme de sincronizare și altele, vezi [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Pentru mai multe informații

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — index complet al documentației
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — hub de produse, prețuri, ghiduri, șabloane
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack etc.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — aduce Notion, Linear, Jira în build-uri
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — construiește aplicații programatic prin REST

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — fluxul de verificare
- [prompt](../prompt/SKILL.md) — comunicarea cu agentul
- [devloop](../devloop/SKILL.md) — proiectele lovable urmează forma devloop