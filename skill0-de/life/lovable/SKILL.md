---
name: lovable
description: Nutzung der Lovable MCP-Werkzeuge — Projekte deployen, dem Agenten Nachrichten schicken, mit agent-browser testen. Credits sparen, indem du an das lokale Repo delegierst.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Setup & vollständige MCP-Referenz

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Vollständige MCP-Referenz: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Pro/Business erforderlich
- Auth — OAuth-Browserabfrage beim ersten Aufruf
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Kernablauf: lokal zuerst, Credits sparen

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Regeln

- **MUSS die Projekt-ID verifizieren** — rufe `list_projects query=<name>` auf, um vor jeder Aktion die richtige `project_id` zu bestätigen. **NIEMALS eine ID aus dem Gedächtnis oder einem früheren Kontext wiederverwenden.** Warte nach dem Deploy 30 Sekunden und verifiziere dann die Live-Site, bevor du Erfolg meldest.
- **MUSS vorher und nachher Screenshots machen** — wenn du ein Projekt änderst, mache einen Before-Screenshot, nimm die Änderungen vor, mache einen After-Screenshot. Vergleiche, um die Absicht zu bestätigen. Poste wenn zutreffend in ein GitHub-Issue. **Entferne alle Privatsphäre-Daten** (Tokens, persönliche Infos, E-Mails) vor dem Upload.

## Häufige MCP-Aufrufe

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Use-Case — Analytics

Schneller Überblick: `list_projects publish_status=published` liefert die Besucherzahlen pro Projekt.
Als TSV/CSV mit Schema exportieren: `id, project, 24h, 7d, 30d, URL`.

Für detaillierte Analysen (Pageviews, Absprungrate, Traffic-Quellen, Geräte) siehe [ANALYTICS.md](ANALYTICS.md).

## Use-Case — Knowledge (persistierte Instruktionen für den Lovable-Agenten)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Immer erst `get`, dann `set` — set ersetzt den gesamten Inhalt. Maximal 10K Zeichen. Außerdem: `get/set_workspace_knowledge`.

## Mit agent-browser testen

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Vollständige Nutzung: siehe skill0 `agent-browser`.

## Fehlerbehebung

- Site nicht aktualisiert — `deploy_project`
- Codeänderung, lokal vorhanden — Local → push → deploy
- Codeänderung, nichts lokal — `send_message` (hohe Credit-Kosten)
- Mobiltest — `agent-browser set device "iPhone 14"`

Für PWA-Probleme, Sync-Probleme und mehr siehe [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Weitere Informationen

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — vollständiger Dokumentationsindex
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — Produktzentrum, Preise, Anleitungen, Vorlagen
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack etc.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — Notion, Linear, Jira in Builds holen
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — Apps programmatisch per REST bauen

## Verwandt

- [agent-browser](../../it/agent-browser/SKILL.md) — Verifikationsablauf
- [prompt](../prompt/SKILL.md) — Kommunikation mit dem Agenten
- [devloop](../devloop/SKILL.md) — Lovable-Projekte folgen der devloop-Form
