---
name: lovable
description: Użycie narzędzi Lovable MCP — wdrażanie projektów, wysyłanie wiadomości do agenta, testowanie za pomocą agent-browser. Ograniczaj kredyty, delegując pracę do lokalnego repozytorium.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Konfiguracja i pełna referencja MCP

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Pełna referencja MCP: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — wymagany Pro/Business
- Autoryzacja — monit przeglądarki OAuth przy pierwszym wywołaniu
- Klienci — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Główny przepływ: najpierw lokalnie, oszczędzaj kredyty

```
edycja lokalna → npm run dev (weryfikacja) → git push → mcp__lovable__deploy_project → test agent-browser
```

## Reguły

- **MUST zweryfikować ID projektu** — wywołaj `list_projects query=<nazwa>`, aby potwierdzić właściwe `project_id` przed jakąkolwiek akcją. **NIGDY nie używaj ponownie ID zapamiętanego z pamięci lub poprzedniego kontekstu.** Po wdrożeniu odczekaj 30 s, potem zweryfikuj działającą witrynę, zanim zgłosisz sukces.
- **MUST zrobić zrzut ekranu przed i po** — modyfikując projekt, zrób zrzut „przed", wprowadź zmiany, zrób zrzut „po". Porównaj, aby potwierdzić intencję. W razie potrzeby wklej do issue na GitHubie. **Usuń wszystkie dane prywatne** (tokeny, dane osobowe, adresy e-mail) przed wgraniem.

## Typowe wywołania MCP

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<nazwa>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instrukcja>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Zastosowanie — analityka

Szybki przegląd: `list_projects publish_status=published` zwraca liczbę odwiedzających dla każdego projektu.
Eksport jako TSV/CSV ze schematem: `id, project, 24h, 7d, 30d, URL`.

Szczegółową analitykę (odsłony stron, współczynnik odrzuceń, źródła ruchu, urządzenia) znajdziesz w [ANALYTICS.md](ANALYTICS.md).

## Zastosowanie — wiedza (trwałe instrukcje dla agenta Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Zawsze najpierw `get`, potem `set` — operacja zastępuje treść w całości. Maks. 10 tys. znaków. Dostępne też: `get/set_workspace_knowledge`.

## Testuj za pomocą agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Pełne użycie: zobacz skill0 `agent-browser`.

## Rozwiązywanie problemów

- Witryna nie zaktualizowana — `deploy_project`
- Zmiana kodu, jest lokalna — Lokalnie → push → deploy
- Zmiana kodu, nie ma lokalnej — `send_message` (duży koszt kredytów)
- Test mobilny — `agent-browser set device "iPhone 14"`

Problemy z PWA, problemy z synchronizacją i więcej znajdziesz w [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Więcej informacji

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — pełny indeks dokumentacji
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — centrum produktu, cennik, przewodniki, szablony
- [Integracje](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack itd.
- [Łączniki czatu](https://docs.lovable.dev/integrations/mcp-servers.md) — wciągaj Notion, Linear, Jira do swoich projektów
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — buduj aplikacje programistycznie przez REST

## Powiązane

- [agent-browser](../../it/agent-browser/SKILL.md) — przepływ weryfikacji
- [prompt](../prompt/SKILL.md) — komunikacja z agentem
- [devloop](../devloop/SKILL.md) — projekty lovable podążają za kształtem devloop