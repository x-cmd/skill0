---
name: git
description: |
  การจัดการ Git และแพลตฟอร์มโฮสต์โค้ด — GitHub, GitLab, Codeberg, Forgejo
  ไม่มีอุปสรรค ติดตั้ง x-cmd แล้วจัดการ repo ได้จากเทอร์มินัล
  ใช้เมื่อเจอคำว่า "git", "github", "gitlab", "repo", "pull request", "code hosting"

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

จัดการ Git repo และแพลตฟอร์มโฮสต์โค้ดจากบรรทัดคำสั่ง

## เริ่มใช้งาน

```bash
# ติดตั้ง x-cmd
eval "$(curl https://get.x-cmd.com)"

# จัดการ repo บน GitHub
x gh repo list
x gh repo clone owner/repo

# สร้าง pull request
x gh pr create --title "Fix bug" --body "Description"

# จัดการ git hooks
x git hook
```

## มีอะไรให้ใช้บ้าง

| คำสั่ง | แพลตฟอร์ม | คำอธิบาย |
|---------|----------|-------------|
| `x gh` | GitHub | เชื่อมต่อกับ GitHub CLI แบบครบถ้วน |
| `x gl` | GitLab | จัดการโปรเจกต์บน GitLab |
| `x cb` | Codeberg | เชื่อมต่อกับ Codeberg |
| `x git hook` | ในเครื่อง | จัดการ git hooks |

## skill0 นี้จะเติบโตขึ้น

เริ่มจากพื้นฐานของ GitHub จะเพิ่ม:
- เวิร์กโฟลว์ของ GitLab
- แนวปฏิบัติที่ดีสำหรับการโฮสต์โค้ด
- คู่มือย้าย repo
- เคล็ดลับการผสานรวมกับ CI/CD

## ได้ประสบการณ์เต็มรูปแบบ

หลังติดตั้ง x-cmd แล้ว ใช้ `x git --help` เพื่อดูตัวเลือกทั้งหมด

## ที่เกี่ยวข้อง

- [repo](../repo/SKILL.md) — ค้นพบ/จัดการ repo ผ่าน x repo