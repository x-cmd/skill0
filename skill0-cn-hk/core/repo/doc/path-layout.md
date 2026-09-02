---
source: lib/skill0/core/repo/doc/path-layout.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# path layout

x repo 管理的三類路徑的詳細目錄結構。SKILL.md 給出操作規則；本文是其背後的完整語法。

## 三類

| kind | path | purpose |
|---|---|---|
| **bare** | `~/.x-repo/.bare/<provider>/<owner>/<name>.git` | git 歷史 + worktree 註冊表。隱藏在 `.bare/` 下。 |
| **default worktree** | `~/.x-repo/<provider>/<owner>/<name>` | 由 `x repo update <id>` 自動創建。默認分支。**人的視圖** —— 留給人用。 |
| **designed worktree** | `~/.x-repo/<provider>/<owner>/<name>@<wtname>` | 按需通過 `x repo wt <id> <wtname>` 創建。每個標識符 / agent 一個。**agent 的工作區**。 |

## 佈局示意

```
~/.x-repo/
  .bare/                                          # bare git 數據，隱藏
    github.com/x-bash/repo.git
    github.com/x-bash/skill0.git
  github.com/                                     # working tree，可見
    x-bash/repo/                                  # 默認 worktree（自動創建）
    x-bash/repo@feat-auth/                        # feat/auth 上的命名 worktree
```

## 深度 3 不變量

所有路徑在 `~/.x-repo/` 下都恰好 **3 層**（`<provider>/<owner>/<name>`）。

- `github.com/x-bash/repo` → 3 層（`github.com` / `x-bash` / `repo`）
- `github.com/x-bash/repo@feat~auth` → 仍是 3 層（`github.com` / `x-bash` / `repo@feat~auth`）

該不變量讓任何 worktree 下的 `../<sibling>` 都一致解析到 sibling 的默認 worktree —— 不管你身處默認 wt、命名 wt、還是普通 clone。

## 普通 git clone

普通 `git clone`（無 bare、無 worktree 管理） **能工作** —— 把它放到 `~/.x-repo/<provider>/<owner>/<name>` 或任何符合佈局的路徑下，`x repo ls`、`x repo which`、`x repo update` 會把它與 bare+wt repo 一併識別。

靠的是深度 3 不變量：只要路徑匹配，x repo 就以相同方式解析。

權衡：普通 clone 沒有 `.bare/` 分離。對該目錄 `rm -rf` 會同時刪掉 `.git/` 和 working tree。這是用户在選普通 clone 時接受的代價；x repo 所有命令對此都能繼續工作。

## wtname 編碼

wtname 可以是任意字符串。唯一的轉換是 `/` → `~`：

- `feat/auth` → `feat~auth`
- `fix/123/bug` → `fix~123~bug`
- 任何不含 `/` 的字符串原樣通過

可逆：目錄名中的每個 `~` 都來自我們對 `/` 的編碼（git ref 名禁止 `~`）。

## 用 X_REPO_ROOT 覆蓋根

需要換根的高級用户 —— 見 [design.md](./design.md) 與 x-bash/repo 中的高級定製 story，那裏記錄了唯一支持的後門（`X_REPO_ROOT`）。默認 skill 不文檔化，因為它不是推薦路徑。