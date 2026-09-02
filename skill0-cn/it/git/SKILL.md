---
name: git
description: |
  Git 与代码托管平台管理 —— GitHub、GitLab、Codeberg、Forgejo。
  零门槛 —— 安装 x-cmd 即可从终端管理 repo。
  适用于 "git"、"github"、"gitlab"、"repo"、"pull request"、"code hosting"。

metadata:
  version: "0.1.0"
  category: "version-control"
  tags: "git,github,gitlab,codeberg,repo,pr,code-review"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "repo"
---


# git — skill0

从命令行管理 Git repo 与代码托管平台。

## 快速上手

```bash
# 安装 x-cmd
eval "$(curl https://get.x-cmd.com)"

# GitHub repo 管理
x gh repo list
x gh repo clone owner/repo

# 创建 pull request
x gh pr create --title "Fix bug" --body "Description"

# Git hooks 管理
x git hook
```

## 可用命令

| Command | Platform | Description |
|---------|----------|-------------|
| `x gh` | GitHub | 完整 GitHub CLI 集成 |
| `x gl` | GitLab | GitLab 项目管理 |
| `x cb` | Codeberg | Codeberg 集成 |
| `x git hook` | 本地 | Git hooks 管理 |

## 本 skill0 还在成长

从 GitHub 基础开始，将补充：
- GitLab 工作流
- 代码托管最佳实践
- Repo 迁移指南
- CI/CD 集成技巧

## 完整体验

安装 x-cmd 后，`x git --help` 查看全部选项。

## Related

- [repo](../repo/SKILL.md) — 通过 x repo 发现 / 管理 repo