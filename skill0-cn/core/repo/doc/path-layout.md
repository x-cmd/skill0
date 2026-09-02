# path layout

x repo 管理的三类路径的详细目录结构。SKILL.md 给出操作规则；本文是其背后的完整语法。

## 三类

| kind | path | purpose |
|---|---|---|
| **bare** | `~/.x-repo/.bare/<provider>/<owner>/<name>.git` | git 历史 + worktree 注册表。隐藏在 `.bare/` 下。 |
| **default worktree** | `~/.x-repo/<provider>/<owner>/<name>` | 由 `x repo update <id>` 自动创建。默认分支。**人的视图** —— 留给人用。 |
| **designed worktree** | `~/.x-repo/<provider>/<owner>/<name>@<wtname>` | 按需通过 `x repo wt <id> <wtname>` 创建。每个标识符 / agent 一个。**agent 的工作区**。 |

## 布局示意

```
~/.x-repo/
  .bare/                                          # bare git 数据，隐藏
    github.com/x-bash/repo.git
    github.com/x-bash/skill0.git
  github.com/                                     # working tree，可见
    x-bash/repo/                                  # 默认 worktree（自动创建）
    x-bash/repo@feat-auth/                        # feat/auth 上的命名 worktree
```

## 深度 3 不变量

所有路径在 `~/.x-repo/` 下都恰好 **3 层**（`<provider>/<owner>/<name>`）。

- `github.com/x-bash/repo` → 3 层（`github.com` / `x-bash` / `repo`）
- `github.com/x-bash/repo@feat~auth` → 仍是 3 层（`github.com` / `x-bash` / `repo@feat~auth`）

该不变量让任何 worktree 下的 `../<sibling>` 都一致解析到 sibling 的默认 worktree —— 不管你身处默认 wt、命名 wt、还是普通 clone。

## 普通 git clone

普通 `git clone`（无 bare、无 worktree 管理） **能工作** —— 把它放到 `~/.x-repo/<provider>/<owner>/<name>` 或任何符合布局的路径下，`x repo ls`、`x repo which`、`x repo update` 会把它与 bare+wt repo 一并识别。

靠的是深度 3 不变量：只要路径匹配，x repo 就以相同方式解析。

权衡：普通 clone 没有 `.bare/` 分离。对该目录 `rm -rf` 会同时删掉 `.git/` 和 working tree。这是用户在选普通 clone 时接受的代价；x repo 所有命令对此都能继续工作。

## wtname 编码

wtname 可以是任意字符串。唯一的转换是 `/` → `~`：

- `feat/auth` → `feat~auth`
- `fix/123/bug` → `fix~123~bug`
- 任何不含 `/` 的字符串原样通过

可逆：目录名中的每个 `~` 都来自我们对 `/` 的编码（git ref 名禁止 `~`）。

## 用 X_REPO_ROOT 覆盖根

需要换根的高级用户 —— 见 [design.md](./design.md) 与 x-bash/repo 中的高级定制 story，那里记录了唯一支持的后门（`X_REPO_ROOT`）。默认 skill 不文档化，因为它不是推荐路径。