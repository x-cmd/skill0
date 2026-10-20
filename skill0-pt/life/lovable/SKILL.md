---
name: lovable
description: Uso da ferramenta MCP do Lovable — fazer deploy de projetos, enviar mensagens ao agent, testar com agent-browser. Economize créditos delegando ao repo local.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Configuração e referência completa do MCP

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Referência completa do MCP: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — exige Pro/Business
- Auth — prompt de OAuth no navegador na primeira chamada
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Workflow principal: local primeiro, economize créditos

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Regras

- **É OBRIGATÓRIO verificar o project ID** — chame `list_projects query=<name>` para confirmar o `project_id` correto antes de qualquer ação. **NUNCA reutilize um ID vindo da memória ou de um contexto anterior.** Depois do deploy, aguarde 30s e verifique o site no ar antes de reportar sucesso.
- **É OBRIGATÓRIO tirar screenshot antes e depois** — ao modificar um projeto, capture um screenshot "antes", faça as mudanças e capture um screenshot "depois". Compare para confirmar a intenção. Poste na issue do GitHub quando aplicável. **Remova todos os dados de privacidade** (tokens, informações pessoais, e-mails) antes de subir.

## Chamadas MCP comuns

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Caso de uso — Analytics

Visão rápida: `list_projects publish_status=published` retorna a contagem de visitantes por projeto.
Exporte como TSV/CSV com o schema: `id, project, 24h, 7d, 30d, URL`.

Para analytics detalhados (pageviews, taxa de rejeição, fontes de tráfego, dispositivos), veja [ANALYTICS.md](ANALYTICS.md).

## Caso de uso — Knowledge (instruções persistidas para o agent do Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Sempre use `get` antes de `set` — o set substitui tudo. Máximo de 10 mil caracteres. Também existe: `get/set_workspace_knowledge`.

## Testar com agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Uso completo: veja a skill `agent-browser` do skill0.

## Troubleshooting

- Site não atualizado — `deploy_project`
- Mudança de código, existe local — Local → push → deploy
- Mudança de código, sem local — `send_message` (custo alto de créditos)
- Teste mobile — `agent-browser set device "iPhone 14"`

Para problemas de PWA, falhas de sincronização e mais, veja [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Para mais informações

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — índice da documentação completa
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — hub do produto, preços, guias, templates
- [Integrações](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack etc.
- [Conectores de chat](https://docs.lovable.dev/integrations/mcp-servers.md) — traga Notion, Linear e Jira para os builds
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — construa apps programaticamente via REST

## Relacionados

- [agent-browser](../../it/agent-browser/SKILL.md) — fluxo de verificação
- [prompt](../prompt/SKILL.md) — como se comunicar com o agent
- [devloop](../devloop/SKILL.md) — projetos Lovable seguem o formato do devloop