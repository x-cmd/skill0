---
name: lovable
description: Lovable MCP aracı kullanımı — projeleri dağıt, agent'a mesaj gönder, agent-browser ile test et. Yerel repoya devrederek kredileri en aza indir.
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## Kurulum ve tam MCP referansı

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

Tam MCP referansı: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md).

- Plan — Pro/Business gerekli
- Auth — İlk çağrıda OAuth tarayıcı istemi
- İstemciler — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## Çekirdek iş akışı: önce yerel, krediden tasarruf et

```
yerel düzenleme → npm run dev (doğrula) → git push → mcp__lovable__deploy_project → agent-browser testi
```

## Kurallar

- **Proje ID'sini mutlaka doğrula** — herhangi bir eylemden önce doğru `project_id`'yi onaylamak için `list_projects query=<ad>` çağır. Hafızadan ya da önceki bağlamdan bir ID'yi **asla yeniden kullanma.** Dağıtımdan sonra 30 sn bekle, sonra başarı bildirmeden önce canlı siteyi doğrula.
- **Önce ve sonra ekran görüntüsü mutlaka al** — bir projeyi değiştirirken önce ekran görüntüsü al, değişiklikleri yap, sonra tekrar al. Niyeti onaylamak için karşılaştır. Uygun olduğunda GitHub issue'ya gönder. Yüklemeden önce **tüm gizlilik verilerini temizle** (token'lar, kişisel bilgiler, e-postalar).

## Sık kullanılan MCP çağrıları

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<ad>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<talimat>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## Kullanım senaryosu — Analitik

Hızlı genel bakış: `list_projects publish_status=published` proje başına ziyaretçi sayılarını döndürür.
Şema ile TSV/CSV olarak dışa aktar: `id, project, 24h, 7d, 30d, URL`.

Ayrıntılı analitik (sayfa görüntülemeleri, geri dönüş oranı, trafik kaynakları, cihazlar) için [ANALYTICS.md](ANALYTICS.md) dosyasına bak.

## Kullanım senaryosu — Bilgi (Lovable agent'ı için kalıcı talimatlar)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
`set`'ten önce her zaman `get` çağır — tamamen değiştirir. En fazla 10K karakter. Ayrıca: `get/set_workspace_knowledge`.

## agent-browser ile test et

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
Tam kullanım: skill0 `agent-browser` dosyasına bak.

## Sorun giderme

- Site güncellenmedi — `deploy_project`
- Kod değişikliği, yerelde var — Yerel → push → deploy
- Kod değişikliği, yerelde yok — `send_message` (yüksek kredi maliyeti)
- Mobil test — `agent-browser set device "iPhone 14"`

PWA sorunları, senkronizasyon problemleri ve daha fazlası için [TROUBLESHOOTING.md](TROUBLESHOOTING.md) dosyasına bak.

## Daha fazla bilgi için

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — tam dokümantasyon dizini
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — ürün merkezi, fiyatlandırma, rehberler, şablonlar
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack vb.
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — Notion, Linear, Jira'yı yapılandırmalarına dahil et
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — REST ile uygulamaları programatik olarak oluştur

## İlgili

- [agent-browser](../../it/agent-browser/SKILL.md) — doğrulama akışı
- [prompt](../prompt/SKILL.md) — agent ile iletişim kurma
- [devloop](../devloop/SKILL.md) — lovable projeleri devloop biçimini izler