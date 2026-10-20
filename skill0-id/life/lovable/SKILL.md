---
name: lovable
description: Penggunaan tool MCP Lovable — deploy proyek, kirim pesan ke agent, uji dengan agent-browser. Hemat kredit dengan mendelegasikan ke repo lokal.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Setup & referensi MCP lengkap

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Referensi MCP lengkap: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — butuh Pro/Business
- Auth — prompt OAuth di browser pada panggilan pertama
- Clients — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Alur kerja inti: lokal dulu, hemat kredit

```
edit lokal → npm run dev (verifikasi) → git push → mcp__lovable__deploy_project → uji dengan agent-browser
```

## Aturan

- **WAJIB verifikasi project ID** — panggil `list_projects query=<name>` untuk memastikan `project_id` yang benar sebelum tindakan apa pun. **JANGAN pernah memakai ulang ID dari ingatan atau konteks sebelumnya.** Setelah deploy, tunggu 30 detik lalu verifikasi situs live sebelum melaporkan keberhasilan.
- **WAJIB ambil screenshot sebelum & sesudah** — saat memodifikasi sebuah proyek, ambil screenshot sebelum, lakukan perubahan, lalu ambil screenshot sesudah. Bandingkan keduanya untuk memastikan maksudnya terpenuhi. Unggah ke GitHub issue bila relevan. **Hapus semua data privasi** (token, informasi pribadi, email) sebelum mengunggah.

## Panggilan MCP umum

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<instruction>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Kasus pakai — Analytics

Ikhtisar cepat: `list_projects publish_status=published` mengembalikan jumlah pengunjung per proyek.
Ekspor sebagai TSV/CSV dengan skema: `id, project, 24h, 7d, 30d, URL`.

Untuk analytics mendalam (pageview, bounce rate, sumber traffic, perangkat), lihat [ANALYTICS.md](ANALYTICS.md).

## Kasus pakai — Knowledge (instruksi persisten untuk agent Lovable)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
Selalu `get` sebelum `set` — isinya digantikan sepenuhnya. Maksimal 10K karakter. Selain itu: `get/set_workspace_knowledge`.

## Menguji dengan agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Penggunaan lengkap: lihat skill0 `agent-browser`.

## Pemecahan masalah

- Situs tidak ter-update — `deploy_project`
- Perubahan kode, ada repo lokal — Lokal → push → deploy
- Perubahan kode, tanpa repo lokal — `send_message` (biaya kredit tinggi)
- Uji di mobile — `agent-browser set device "iPhone 14"`

Untuk masalah PWA, masalah sinkronisasi, dan lainnya, lihat [TROUBLESHOOTING.md](TROUBLESHOOTING.md).

## Informasi lebih lanjut

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — indeks dokumentasi lengkap
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — pusat produk, harga, panduan, template
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack, dll.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — bring Notion, Linear, Jira ke dalam build
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — bangun aplikasi secara terprogram lewat REST

## Terkait

- [agent-browser](../../it/agent-browser/SKILL.md) — alur verifikasi
- [prompt](../prompt/SKILL.md) — berkomunikasi dengan agent
- [devloop](../devloop/SKILL.md) — proyek lovable mengikuti pola devloop