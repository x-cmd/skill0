---
name: lovable
description: Lovable MCP ツールの使い方 —— プロジェクトのデプロイ、agent へのメッセージ送信、agent-browser でのテスト。ローカル repo に委譲して credits の消費を最小限に抑える。
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## セットアップと MCP 完全リファレンス

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

MCP の完全リファレンス：[lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)。

- Plan —— Pro/Business が必要
- Auth —— 初回呼び出し時にブラウザで OAuth 認証
- Clients —— Claude Code、Claude Desktop、ChatGPT、Cursor、VS Code

## 中核ワークフロー：ローカル優先で credits を節約

```
local edit → npm run dev (verify) → git push → mcp__lovable__deploy_project → agent-browser test
```

## ルール

- **MUST プロジェクト ID を検証する** —— どの操作より前に `list_projects query=<name>` を呼び出し、正しい `project_id` を確認すること。**NEVER 記憶や以前のコンテキストにある ID を再利用しないこと。** デプロイ後は 30 秒待ってから公開サイトを検証し、成功を報告すること。
- **MUST 変更前後のスクリーンショットを取る** —— プロジェクトを変更する際は、変更前のスクリーンショットを取得し、変更を行い、変更後のスクリーンショットを取得する。両者を比較して意図を確かめる。該当する場合は GitHub issue に投稿する。**アップロード前にプライバシー情報をすべて削除すること**（トークン、個人情報、メール）。

## よく使う MCP 呼び出し

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## ユースケース —— Analytics

サマリー：`list_projects publish_status=published` でプロジェクトごとの訪問者数が返る。
スキーマ `id, project, 24h, 7d, 30d, URL` で TSV/CSV にエクスポートできる。

詳細な分析（pageviews、bounce rate、トラフィック元、デバイス）は [ANALYTICS.md](ANALYTICS.md) を参照。

## ユースケース —— Knowledge（Lovable agent に永続させる指示）

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
必ず `set` の前に `get` すること —— `set` は丸ごと置き換える。最大 10K 文字。ほかに `get/set_workspace_knowledge` もある。

## agent-browser でテスト

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
使い方は skill0 の `agent-browser` を参照。

## トラブルシューティング

- サイトが更新されない —— `deploy_project`
- コード変更、ローカルに存在する —— ローカル → push → deploy
- コード変更、ローカルにない —— `send_message`（credits 消費が大きい）
- モバイルでのテスト —— `agent-browser set device "iPhone 14"`

PWA の問題や同期の問題などは [TROUBLESHOOTING.md](TROUBLESHOOTING.md) を参照。

## さらに詳しく

- [docs llms.txt](https://docs.lovable.dev/llms.txt) —— 完全なドキュメント索引
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) —— 製品情報、料金、ガイド、テンプレート
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) —— Stripe、Supabase、Slack など
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) —— Notion、Linear、Jira をビルドに取り込む
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) —— REST 経由でアプリをプログラムから構築する

## Related

- [agent-browser](../../it/agent-browser/SKILL.md) —— 検証の流れ
- [prompt](../prompt/SKILL.md) —— agent とのやり取り
- [devloop](../devloop/SKILL.md) —— lovable プロジェクトは devloop の形に従う