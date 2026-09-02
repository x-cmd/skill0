---
source: lib/skill0/core/repo/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: repo
description: agent 克隆倉庫位置與 worktree 佈局的約定 + 工具。默認 bare repo 在 `~/.x-repo/.bare/<provider>/<owner>/<name>.git`，linked working tree 在 `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` 下。通過 `x repo ls` 發現。worktree 管理通過 `x repo wt`。適用於 "where to clone"、"git clone path"、"workspace layout"、"shared repos between agents"、"worktree path"。
metadata:
  related: "git"
---

# repo

## 為什麼

所有 clone 都在 `~/.x-repo/<provider>/<owner>/<name>` 匯聚。每個 agent、人類、CI 都用同一路徑 —— 可掛載到容器或 agent 沙箱中，共享而不必重新克隆。一個根用於備份；可通過 `x repo ls` 發現。佈局鏡像 GitHub 路徑，因此任意 worktree 下的 `../<sibling>` 都會解析到該 sibling 的默認 worktree —— 引用 sibling 的配置與腳本在 wt 與 agent 之間行為一致。

## 路徑佈局

- bare：`~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- 默認 wt：`~/.x-repo/<provider>/<owner>/<name>`
- 命名 wt：`~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` —— wtname 是該工作區的任意標識符：agent/worker 名、分支名、tag、短 SHA、issue id、自由字符串。wtname 中的 `/` 編碼為 `~`。

默認情況下，repo 為 bare 加 linked worktree —— bare 在 `.bare/`，與 worktree 分開，這樣對一個 wt 做 `rm -rf` 也無法觸達 bare。普通 `git clone` 也被接受（`x repo ls/which/update` 能識別），但沒有幾何保護。這種情況下請小心：不要 `rm -rf`，優先用 `git worktree remove`，並避開針對 `.git/` 的清理啓發式。任務中途丟失的工作無法再與原 repo 重新對齊。

## Commands

```bash
x repo <id>                      # cd 到默認 wt（缺失則自動克隆）
x repo wt <id> <wtname>          # 掛到已有分支，或基於 HEAD 新建
x repo wt ls <id>                # 列出 wt
x repo wt rm <id> <wtname>       # 優雅刪除（用這個，不要 rm -rf）
x repo update <id>               # 上游更新後刷新默認 wt
x repo ls [--raw|--tsv]          # 發現已克隆的倉庫
x repo which <id>[@<wtname>]     # 把 id 解析為絕對路徑
```

## Don't

- 不要對命名 worktree 做 `rm -rf`。它會在 bare 的 `worktrees/` 註冊表裏留下陳舊項。請用 `x repo wt rm`。如果實在要 `rm -rf`，事後跑 `git -C <bare> worktree prune`。

## Related

- [doc/path-layout.md](doc/path-layout.md) — 完整路徑語法與 worktree 命名
- [doc/workflow.md](doc/workflow.md) — 操作流程與"清理不刪除"原則
- [doc/design.md](doc/design.md) — 為什麼佈局要這樣設計