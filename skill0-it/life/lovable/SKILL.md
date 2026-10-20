---
name: lovable
description: Uso degli strumenti Lovable MCP — deploy dei progetti, messaggi all'agente, test con agent-browser. Minimizza i crediti delegando al repo locale.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Configurazione e riferimento MCP completo

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Riferimento MCP completo: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Piano — richiesto Pro/Business
- Auth — prompt OAuth nel browser alla prima chiamata
- Client — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Workflow principale: prima in locale, poi risparmia crediti

```
modifica in locale → npm run dev (verifica) → git push → mcp__lovable__deploy_project → test con agent-browser
```

## Regole

- **DEVI verificare il project ID** — chiama `list_projects query=<nome>` per confermare il `project_id` corretto prima di qualsiasi azione. **NON riutilizzare MAI un ID dalla memoria o dal contesto precedente.** Dopo il deploy, attendi 30 secondi poi verifica il sito live prima di riferire il successo.
- **DEVI fare uno screenshot prima e dopo** — quando modifichi un progetto, cattura uno screenshot prima, fai le modifiche, cattura uno screenshot dopo. Confrontali per confermare l'intento. Pubblicalo sull'issue GitHub quando applicabile. **Rimuovi tutti i dati privati** (token, informazioni personali, email) prima di caricare.

## Chiamate MCP comuni

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Caso d'uso — Analytics

Panoramica rapida: `list_projects publish_status=published` restituisce il numero di visitatori per progetto.
Esporta in TSV/CSV con questo schema: `id, project, 24h, 7d, 30d, URL`.

Per analisi dettagliate (pageview, bounce rate, sorgenti di traffico, dispositivi), vedi [ANALYTICS.md](ANALYTICS.md).

## Caso d'uso — Knowledge (istruzioni persistenti per l'agente Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Fai sempre `get` prima di `set` — sostituisce tutto. Massimo 10K caratteri. Inoltre: `get/set_workspace_knowledge`.

## Testa con agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Per l'uso completo vedi skill0 `agent-browser`.

## Risoluzione dei problemi

- Sito non aggiornato — `deploy_project`
- Modifica al codice, esiste in locale — Locale → push → deploy
- Modifica al codice, senza locale — `send_message` (costo in crediti elevato)
- Test mobile — `agent-browser set device "iPhone 14"`

Per i problemi con le PWA, i problemi di sincronizzazione e altro, vedi [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Per maggiori informazioni

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — indice completo della documentazione
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — hub del prodotto, prezzi, guide, template
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack, ecc.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — porta Notion, Linear, Jira dentro le build
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — costruisci app programmaticamente via REST

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — flusso di verifica
- [prompt](../prompt/SKILL.md) — comunicare con l'agente
- [devloop](../devloop/SKILL.md) — i progetti lovable seguono la forma del devloop