---
name: lovable
description: การใช้เครื่องมือ Lovable MCP — ดีพลอยโปรเจกต์ ส่งข้อความถึง agent ทดสอบด้วย agent-browser ประหยัดเครดิตโดยมอบหมายงานให้ repo ในเครื่อง
metadata:
  related: "agent-browser,prompt,devloop"
---


# Lovable

## การตั้งค่าและคู่มือ MCP ฉบับเต็ม

```
claude mcp add --transport http lovable "https://mcp.lovable.dev"
```

คู่มือ MCP ฉบับเต็ม: [lovable-mcp-server.md](https://docs.lovable.dev/integrations/lovable-mcp-server.md)

- แพ็กเกจ — ต้องใช้ Pro/Business
- การยืนยันตัวตน — มี OAuth prompt ในเบราว์เซอร์เมื่อเรียกครั้งแรก
- ไคลเอนต์ที่รองรับ — Claude Code, Claude Desktop, ChatGPT, Cursor, VS Code

## เวิร์กโฟลว์หลัก: ทำในเครื่องก่อน ประหยัดเครดิต

```
แก้ไขในเครื่อง → npm run dev (ตรวจสอบ) → git push → mcp__lovable__deploy_project → ทดสอบด้วย agent-browser
```

## กฎ

- **ต้องยืนยัน project ID** — เรียก `list_projects query=<name>` เพื่อยืนยัน `project_id` ที่ถูกต้องก่อนทำทุกอย่าง **ห้ามใช้ ID ที่จำจากความทรงจำหรือจากบริบทก่อนหน้า** หลังดีพลอย ให้รอ 30 วินาทีแล้วตรวจสอบเว็บไซต์จริงก่อนรายงานว่าสำเร็จ
- **ต้องจับภาพหน้าจอก่อนและหลัง** — เมื่อแก้ไขโปรเจกต์ ให้จับภาพก่อน แก้ไข แล้วจับภาพหลัง เทียบกันเพื่อยืนยันว่าตรงตามเจตนา โพสต์ลง GitHub issue เมื่อเหมาะสม **ลบข้อมูลส่วนตัวทั้งหมด** (token ข้อมูลส่วนบุคคล อีเมล) ก่อนอัปโหลด

## การเรียก MCP ที่พบบ่อย

```
mcp__lovable__list_workspaces
mcp__lovable__list_projects  workspace_id=<id>  query=<name>
mcp__lovable__get_project  project_id=<id>
mcp__lovable__deploy_project  project_id=<id>
mcp__lovable__send_message  project_id=<id>  message="<คำสั่ง>"  wait=true
mcp__lovable__get_diff  project_id=<id>  message_id=<msg_id>
```

## กรณีใช้งาน — Analytics

ภาพรวมแบบเร็ว: `list_projects publish_status=published` คืนจำนวนผู้เข้าชมแยกตามโปรเจกต์
ส่งออกเป็น TSV/CSV โดยใช้ schema: `id, project, 24h, 7d, 30d, URL`

สำหรับการวิเคราะห์เชิงลึก (pageview, bounce rate, แหล่งที่มาของทราฟฟิก, อุปกรณ์) ดู [ANALYTICS.md](ANALYTICS.md)

## กรณีใช้งาน — Knowledge (คำสั่งถาวรสำหรับ Lovable agent)

```
mcp__lovable__get_project_knowledge  project_id=<id>
mcp__lovable__set_project_knowledge  project_id=<id>  content="<markdown>"
```
ต้อง `get` ก่อน `set` เสมอ — เพราะมันจะแทนที่ทั้งหมด ไม่เกิน 10K ตัวอักษร นอกจากนี้ยังมี `get/set_workspace_knowledge`

## ทดสอบด้วย agent-browser

```
agent-browser --profile /tmp/ab-default open <url> --session <proj>-mobile --headed
agent-browser --session <proj>-mobile set device "iPhone 14"
agent-browser --session <proj>-mobile snapshot -i
```
วิธีใช้ทั้งหมด: ดู skill0 `agent-browser`

## การแก้ปัญหา

- เว็บไซต์ไม่อัปเดต — `deploy_project`
- แก้โค้ดแล้ว มีในเครื่อง — Local → push → deploy
- แก้โค้ดแต่ไม่มีในเครื่อง — `send_message` (กินเครดิตเยอะ)
- ทดสอบบนมือถือ — `agent-browser set device "iPhone 14"`

สำหรับปัญหาเรื่อง PWA ปัญหาการซิงก์ และอื่น ๆ ดู [TROUBLESHOOTING.md](TROUBLESHOOTING.md)

## ข้อมูลเพิ่มเติม

- [docs llms.txt](https://docs.lovable.dev/llms.txt) — ดัชนีเอกสารฉบับเต็ม
- [lovable.dev llms.txt](https://lovable.dev/llms.txt) — ฮับผลิตภัณฑ์ ราคา คู่มือ เทมเพลต
- [Integrations](https://docs.lovable.dev/integrations/introduction.md) — Stripe, Supabase, Slack ฯลฯ
- [Chat connectors](https://docs.lovable.dev/integrations/mcp-servers.md) — นำ Notion, Linear, Jira เข้ามาในงานสร้าง
- [Lovable API](https://docs.lovable.dev/integrations/lovable-api.md) — สร้างแอปด้วยโปรแกรมผ่าน REST

## ที่เกี่ยวข้อง

- [agent-browser](../../it/agent-browser/SKILL.md) — ขั้นตอนการตรวจสอบ
- [prompt](../prompt/SKILL.md) — การสื่อสารกับ agent
- [devloop](../devloop/SKILL.md) — โปรเจกต์ lovable ใช้รูปร่างเดียวกับ devloop