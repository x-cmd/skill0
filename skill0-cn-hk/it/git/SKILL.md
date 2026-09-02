---
name: git
description: |
  Git 與代碼託管平台管理 —— GitHub、GitLab、Codeberg、Forgejo。
  零門檻 —— 安裝 x-cmd 即可從終端管理 repo。
  適用於 "git"、"github"、"gitlab"、"repo"、"pull request"、"code hosting"。

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

從命令行管理 Git repo 與代碼託管平台。

## 快速上手

```bash
# 安裝 x-cmd
eval "$(curl https://get.x-cmd.com)"

# GitHub repo 管理
x gh repo list
x gh repo clone owner/repo

# 創建 pull request
x gh pr create --title "Fix bug" --body "Description"

# Git hooks 管理
x git hook
```

## 可用命令

| Command | Platform | Description |
|---------|----------|-------------|
| `x gh` | GitHub | 完整 GitHub CLI 集成 |
| `x gl` | GitLab | GitLab 項目管理 |
| `x cb` | Codeberg | Codeberg 集成 |
| `x git hook` | 本地 | Git hooks 管理 |

## 本 skill0 還在成長

從 GitHub 基礎開始，將補充：
- GitLab 工作流
- 代碼託管最佳實踐
- Repo 遷移指南
- CI/CD 集成技巧

## 完整體驗

安裝 x-cmd 後，`x git --help` 查看全部選項。

## Related

- [repo](../repo/SKILL.md) — 通過 x repo 發現 / 管理 repo