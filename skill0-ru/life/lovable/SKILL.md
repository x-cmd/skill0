---
name: lovable
description: Использование инструмента Lovable MCP — деплой проектов, сообщения агенту, тестирование через agent-browser. Снижайте расход credits, делегируя работу локальному репозиторию.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Установка и полный справочник по MCP

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Полный справочник по MCP: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — требуется Pro/Business
- Auth — при первом вызове OAuth в браузере
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Главный рабочий процесс: локально прежде всего, экономим credits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Правила

- **ОБЯЗАТЕЛЬНО проверяйте ID проекта** — перед любым действием вызовите `list_projects query=<name>`, чтобы подтвердить правильный `project_id`. **НИКОГДА не используйте повторно ID из памяти или предыдущего контекста.** После деплоя подождите 30 секунд и проверьте рабочий сайт, прежде чем сообщать об успехе.
- **ОБЯЗАТЕЛЬНО делайте скриншоты до и после** — при изменении проекта снимите скриншот «до», внесите изменения, снимите скриншот «после». Сравните, чтобы убедиться в намерении. При необходимости опубликуйте в issue на GitHub. **Перед загрузкой удалите все персональные данные** (токены, личную информацию, адреса электронной почты).

## Часто используемые вызовы MCP

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Сценарий — Analytics

Краткий обзор: `list_projects publish_status=published` возвращает количество посетителей по каждому проекту.
Экспорт в TSV/CSV со схемой: `id, project, 24h, 7d, 30d, URL`.

Для подробной аналитики (просмотры страниц, показатель отказов, источники трафика, устройства) см. [ANALYTICS.md](ANALYTICS.md).

## Сценарий — Knowledge (постоянные инструкции для агента Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Всегда сначала `get`, потом `set` — `set` заменяет содержимое целиком. Максимум 10K символов. Также: `get/set_workspace_knowledge`.

## Тестирование через agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Полное описание использования: см. skill0 `agent-browser`.

## Устранение неполадок

- Сайт не обновился — `deploy_project`
- Изменения в коде есть локально — Local → push → deploy
- Изменения в коде, локальной копии нет — `send_message` (высокий расход credits)
- Тест на мобильном устройстве — `agent-browser set device "iPhone 14"`

О проблемах PWA, проблемах синхронизации и многом другом см. [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Дополнительная информация

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — полный указатель документации
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — центр продукта, цены, руководства, шаблоны
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack и др.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — подключение Notion, Linear, Jira к сборкам
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — создание приложений программно через REST

## Связанные материалы

- [agent-browser](../../it/agent-browser/SKILL.md) — поток проверки
- [prompt](../prompt/SKILL.md) — взаимодействие с агентом
- [devloop](../devloop/SKILL.md) — проекты Lovable следуют форме devloop
