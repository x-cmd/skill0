---
source: lib/skill0/core/repo/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: repo
description: agent 克隆仓库位置与 worktree 布局的约定 + 工具。默认 bare repo 在 `~/.x-repo/.bare/<provider>/<owner>/<name>.git`，linked working tree 在 `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` 下。通过 `x repo ls` 发现。worktree 管理通过 `x repo wt`。适用于 "where to clone"、"git clone path"、"workspace layout"、"shared repos between agents"、"worktree path"。
metadata:
  related: "git"
---

# repo

## 为什么

所有 clone 都在 `~/.x-repo/<provider>/<owner>/<name>` 汇聚。每个 agent、人类、CI 都用同一路径 —— 可挂载到容器或 agent 沙箱中，共享而不必重新克隆。一个根用于备份；可通过 `x repo ls` 发现。布局镜像 GitHub 路径，因此任意 worktree 下的 `../<sibling>` 都会解析到该 sibling 的默认 worktree —— 引用 sibling 的配置与脚本在 wt 与 agent 之间行为一致。

## 路径布局

- bare：`~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- 默认 wt：`~/.x-repo/<provider>/<owner>/<name>`
- 命名 wt：`~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` —— wtname 是该工作区的任意标识符：agent/worker 名、分支名、tag、短 SHA、issue id、自由字符串。wtname 中的 `/` 编码为 `~`。

默认情况下，repo 为 bare 加 linked worktree —— bare 在 `.bare/`，与 worktree 分开，这样对一个 wt 做 `rm -rf` 也无法触达 bare。普通 `git clone` 也被接受（`x repo ls/which/update` 能识别），但没有几何保护。这种情况下请小心：不要 `rm -rf`，优先用 `git worktree remove`，并避开针对 `.git/` 的清理启发式。任务中途丢失的工作无法再与原 repo 重新对齐。

## Commands

```bash
x repo <id>                      # cd 到默认 wt（缺失则自动克隆）
x repo wt <id> <wtname>          # 挂到已有分支，或基于 HEAD 新建
x repo wt ls <id>                # 列出 wt
x repo wt rm <id> <wtname>       # 优雅删除（用这个，不要 rm -rf）
x repo update <id>               # 上游更新后刷新默认 wt
x repo ls [--raw|--tsv]          # 发现已克隆的仓库
x repo which <id>[@<wtname>]     # 把 id 解析为绝对路径
```

## Don't

- 不要对命名 worktree 做 `rm -rf`。它会在 bare 的 `worktrees/` 注册表里留下陈旧项。请用 `x repo wt rm`。如果实在要 `rm -rf`，事后跑 `git -C <bare> worktree prune`。

## Related

- [doc/path-layout.md](doc/path-layout.md) — 完整路径语法与 worktree 命名
- [doc/workflow.md](doc/workflow.md) — 操作流程与"清理不删除"原则
- [doc/design.md](doc/design.md) — 为什么布局要这样设计