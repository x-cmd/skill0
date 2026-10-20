---
name: lovable
description: Usage de l'outil Lovable MCP — déployer des projets, envoyer des messages à l'agent, tester avec agent-browser. Minimisez les crédits en déléguant au repo local.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Setup & référence MCP complète

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Référence MCP complète : [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Pro/Business requis
- Auth — Prompt OAuth dans le navigateur au premier appel
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Workflow principal : local d'abord, économiser les crédits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Règles

- **DOIT vérifier l'ID du projet** — appelez `list_projects query=<name>` pour confirmer le bon `project_id` avant toute action. **NE JAMAIS réutiliser un ID depuis la mémoire ou un contexte précédent.** Après le deploy, attendez 30 s puis vérifiez le site en ligne avant de rapporter le succès.
- **DOIT capturer des screenshots avant & après** — quand vous modifiez un projet, capturez un screenshot avant, faites les changements, capturez un screenshot après. Comparez pour confirmer l'intention. Postez sur l'issue GitHub si applicable. **Anonymisez toutes les données privées** (tokens, infos personnelles, emails) avant tout upload.

## Appels MCP courants

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Cas d'usage — Analytics

Aperçu rapide : `list_projects publish_status=published` retourne le nombre de visiteurs par projet.
Exportez en TSV/CSV avec le schéma : `id, project, 24h, 7d, 30d, URL`.

Pour les analytics détaillés (pageviews, taux de rebond, sources de trafic, devices), voir [ANALYTICS.md](ANALYTICS.md).

## Cas d'usage — Knowledge (instructions persistées pour l'agent Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Toujours `get` avant `set` — remplace entièrement. Max 10K caractères. Aussi : `get/set_workspace_knowledge`.

## Tester avec agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Usage complet : voir le skill0 `agent-browser`.

## Troubleshooting

- Site non mis à jour — `deploy_project`
- Changement de code, local existe — Local → push → deploy
- Changement de code, pas de local — `send_message` (coût élevé en crédits)
- Test mobile — `agent-browser set device "iPhone 14"`

Pour les soucis PWA, problèmes de sync, et plus, voir [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Pour plus d'informations

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — index complet de la doc
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — hub produit, pricing, guides, templates
- [Intégrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack, etc.
- [Connecteurs de chat](https://docs.lovable.dev/integrations/mcp-servers.md) — amène Notion, Linear, Jira dans les builds
- [API Lovable](https://docs.lovable.dev/integrations/lovable-api.md) — construire des apps programmatiquement via REST

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — flow de vérification
- [prompt](../prompt/SKILL.md) — communiquer avec l'agent
- [devloop](../devloop/SKILL.md) — les projets lovable suivent la forme devloop
