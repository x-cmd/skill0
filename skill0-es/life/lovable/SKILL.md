---
name: lovable
description: Uso de la herramienta Lovable MCP — despliega proyectos, escribe al agente, prueba con agent-browser. Minimiza los créditos delegando en el repo local.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Configuración y referencia completa del MCP

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Referencia completa del MCP: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — requiere Pro/Business
- Auth — aviso de OAuth en el navegador en la primera llamada
- Clientes — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Flujo principal: local primero, ahorra créditos

```
edición local → npm run dev (verificar) → git push → mcp__lovable__deploy_project → prueba con agent-browser
```

## Reglas

- **DEBES verificar el ID del proyecto** — llama a `list_projects query=<name>` para confirmar el `project_id` correcto antes de cualquier acción. **NUNCA reutilices un ID de memoria o del contexto anterior.** Tras el deploy, espera 30s y verifica el sitio en vivo antes de reportar éxito.
- **DEBES hacer capturas antes y después** — al modificar un proyecto, haz una captura previa, aplica los cambios, haz una captura posterior. Compara para confirmar la intención. Publícala en la incidencia de GitHub cuando aplique. **Elimina todos los datos privados** (tokens, información personal, correos) antes de subir.

## Llamadas MCP comunes

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instrucción>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Caso de uso — Analytics

Vista rápida: `list_projects publish_status=published` devuelve el número de visitantes por proyecto.
Expórtalo como TSV/CSV con este esquema: `id, project, 24h, 7d, 30d, URL`.

Para analíticas detalladas (páginas vistas, tasa de rebote, fuentes de tráfico, dispositivos), consulta [ANALYTICS.md](ANALYTICS.md).

## Caso de uso — Knowledge (instrucciones persistentes para el agente de Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Siempre haz `get` antes de `set` — reemplaza por completo. Máximo 10K caracteres. También: `get/set_workspace_knowledge`.

## Prueba con agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Uso completo: consulta la skill0 `agent-browser`.

## Resolución de problemas

- El sitio no se actualiza — `deploy_project`
- Cambio de código, existe en local — Local → push → deploy
- Cambio de código, no hay local — `send_message` (coste alto de créditos)
- Prueba móvil — `agent-browser set device "iPhone 14"`

Para problemas de PWA, problemas de sincronización y más, consulta [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Para más información

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — índice completo de la documentación
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — hub del producto, precios, guías, plantillas
- [Integraciones](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack, etc.
- [Conectores de chat](https://docs.lovable.dev/integrations/mcp-servers.md) — trae Notion, Linear, Jira a las builds
- [API de Lovable](https://docs.lovable.dev/integrations/lovable-api.md) — construye apps programáticamente vía REST

## Relacionadas

- [agent-browser](../../it/agent-browser/SKILL.md) — flujo de verificación
- [prompt](../prompt/SKILL.md) — comunicarse con el agente
- [devloop](../devloop/SKILL.md) — los proyectos de lovable siguen la forma de devloop
