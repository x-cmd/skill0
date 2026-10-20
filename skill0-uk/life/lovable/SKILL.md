---
name: lovable
description: Використання інструментів Lovable MCP — деплой проєктів, повідомлення agent'у, тестування через agent-browser. Зводьте витрату credits до мінімуму, делегуючи роботу локальному repo.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Налаштування та повний MCP-довідник

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Повний MCP-довідник: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — потрібен Pro/Business
- Auth — OAuth-запит у браузері при першому виклику
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Основний робочий процес: спочатку локально, економимо credits

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## Правила

- **ОБОВ'ЯЗКОВО перевіряйте project ID** — викличте `list_projects query=<name>`, щоб підтвердити правильний `project_id`, перед будь-якою дією. **НІКОЛИ не використовуйте ID з пам'яті чи попереднього контексту.** Після деплою зачекайте 30 секунд і перевірте живий сайт, перш ніж повідомляти про успіх.
- **ОБОВ'ЯЗКОВО робіть скріншоти до та після** — коли змінюєте проєкт, зробіть скріншот «до», внесіть зміни, зробіть скріншот «після». Порівняйте, щоб підтвердити задум. За потреби опублікуйте в GitHub issue. **Перед завантаженням вилучіть усі приватні дані** (токени, персональну інформацію, електронні пошти).

## Поширені виклики MCP

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Usecase — Analytics

Швидкий огляд: `list_projects publish_status=published` повертає кількість відвідувачів для кожного проєкту.
Експорт у TSV/CSV зі схемою: `id, project, 24h, 7d, 30d, URL`.

Детальну аналітику (перегляди сторінок, показник відскоків, джерела трафіку, пристрої) див. [ANALYTICS.md](ANALYTICS.md).

## Usecase — Knowledge (постійні інструкції для Lovable agent)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Завжди спочатку `get`, потім `set` — set замінює вміст повністю. Максимум 10K символів. Також: `get/set_workspace_knowledge`.

## Тестування за допомогою agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Повний опис використання: див. skill0 `agent-browser`.

## Налагодження

- Сайт не оновився — `deploy_project`
- Змінили код, є локальна копія — локально → push → deploy
- Змінили код, локальної копії немає — `send_message` (висока витрата credits)
- Тест на мобільному — `agent-browser set device "iPhone 14"`

Щодо проблем із PWA, проблем синхронізації тощо див. [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Більше інформації

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — повний індекс документації
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — продуктовий хаб, ціни, посібники, шаблони
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack тощо
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — підключити Notion, Linear, Jira до збірок
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — створювати застосунки програмно через REST

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) — процес перевірки
- [prompt](../prompt/SKILL.md) — комунікація з agent'ом
- [devloop](../devloop/SKILL.md) — lovable-проєкти мають форму devloop