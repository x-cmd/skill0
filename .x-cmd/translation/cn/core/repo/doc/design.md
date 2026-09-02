---
source: lib/skill0/core/repo/doc/design.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# design rationale

本文解释 x repo 布局**为何**长成这样。
SKILL.md 给出操作规则；本文讲背景、威胁模型、以及 bare-in-`.bare` 分离的几何论证。

如果你想理解推理而不仅仅是照配方做事，请读本文。

---

## 威胁模型

最重要的一件事：**AI agent 会 rm -rf 东西**。

实际发生过的两种失败模式（第二种是促使本设计的典型事件）：

1. **AI 清理启发式** —— AI 被告知"任务后清理"，然后把错误的目录 rm -rf 掉了。
2. **AI 跨上下文混淆** —— AI 同时在普通 repo 和 bare+worktree repo 之间工作时被告知"清理"。AI 把 "main checkout" 与 "额外的 worktree（可安全删除）" 混淆，rm -rf 掉了一个 VIP repo 的 main checkout。其他持有该 repo worktree 的并发 agent 丢失工作。

这些失败不是"AI 坏了" —— 而是 AI 应用宽泛启发式时的属性。修复方式应当是 **几何层面** 的，而不是"训练 AI 更小心"。

---

## 核心思想：分离数据，而非工作流

git worktree 已经给了我们正确的原语：单个 bare repo 可以持有多个 linked working tree。问题是 **bare repo 放在哪里** —— 那个问题就是整个设计。

### 朴素方案：bare 在项目目录内（"poweruser" 模式）

```
project/
  .bare/                # 真实 git 数据
  main/                 # 人类主 worktree
  feat-auth/            # 额外 worktree
  fix-123/              # 额外 worktree
```

看起来挺整洁 —— 一个项目，一个地方 —— 但 AI 威胁模型告诉我们：

- AI 的 `rm -rf project/` 仍会杀掉 `.bare/`。
- AI 的"这能安全删除吗？"启发式会把 `.bare/` 当作项目元数据，正是清理应当删除的那种东西。
- 项目的所有 worktree 都在同一个目录的爆炸半径内。

这种模式让保护 **依赖于 AI 不犯保护本应防御的那个错误**。

### 我们的做法：bare 在独立子树下

```
~/.x-repo/
  .bare/                                                # bare repo，隐藏
    github.com/x/other-vip-repo.git
    github.com/x/main-repo.git
  github.com/                                           # working tree，可见
    x/other-vip-repo/                                   # main wt（linked to .bare/）
    x/other-vip-repo@feat-auth/                         # 额外 wt
    x/main-repo/                                        # main wt
    x/main-repo@feat-xxx/                               # 额外 wt
```

现在要毁掉一个 bare，攻击者 / bug / 过度清理必须：

- **专门** 命中 `~/.x-repo/.bare/...`（没有项目级或组织级命令能触达它）
- 同时不把周围工作区一起 rm -rf 掉

这就是几何保护。它 **不** 依赖于行为人（人或 AI）是否小心。

---

## 为什么目录布局是这样

### `~/.x-repo/.bare/<provider>/<owner>/<name>.git`

- `~/.x-repo/` 已经是 x-cmd 共享 agent 状态的约定 —— agent 已经知道别轻易动它。
- `.bare/` 是点前缀，普通的 `ls` 不会把它当成"要看的东西"或"要清理的东西"。
- 镜像 provider/owner/name 路径便于调试发现（`x repo bare <id>` 解析为绝对路径）。
- `.git` 后缀是 bare repo 的标准 git 约定 —— git 工具能识别。

### `~/.x-repo/<provider>/<owner>/<name>`（默认 worktree）

- 与普通 `git clone` 落地位置一致。训练于 `git clone github.com/foo/bar` 的 agent 与人看到的是完全相同的目录形态。
- worktree 的 `.git` 是一个文件，内容是 `gitdir: <bare-path>` —— 一行指向 bare 的指针。99% 的工具不关心它是文件而非目录；`git` 本身就原生支持（worktree 就是这么实现的）。
- 这也回答了"为什么没有 main checkout 类别"：**默认 worktree 不特殊**。它只是众多 linked working tree 之一。"人类主仓"的概念消解为"默认分支上的 wt"。

### `~/.x-repo/<provider>/<owner>/<name>@<branch-encoded>`（额外 worktree）

- 默认 worktree 的同级，相同深度，相同父目录。
- `@` 分隔符被保留：GitHub/GitLab 禁止仓库名含 `@`，`git check-ref-format` 允许但不鼓励分支名含 `@`（实际很少冲突）。看到分支名含 `@` 时，我们按 **第一个** `@` 切分消歧。
- 分支名的 `/` 段被编码为 `~`：

  | branch | directory segment |
  |---|---|
  | `main` | `main` |
  | `feat/auth` | `feat~auth` |
  | `fix/123` | `fix~123` |

  这样每个 worktree 都保持在深度 3。若让 `/` 通过，`feat/auth` 会产生 `repo/feat/auth/` —— 深度 4 —— 任何硬编码 `../sibling` 从一个 wt 到 sibling 的代码都会静默失效，因为父目录变成了 repo 而不是 namespace。

  git 禁止分支名含 `~`，所以编码是 **无损** 的：目录中出现的每个 `~` 都来自我们对 `/` 的编码。

### 为什么深度是 3（且不再深）

- `github.com/x-bash/repo` 从 `~/.x-repo/` 起算深度 3。任何 wt 中硬编码的 `../<sibling>` 都能用，因为它们共享同一个父。
- 深度 4 会让 agent worktree 嵌进项目 —— `repo@feat/` 或更糟 `repo@feat/auth/` —— 每个跨仓的相对引用都会断。

---

## 为什么 `x repo wt` 存在

早期设计草案主张"x repo 是路径管理器，不是 git 包装"，推动它们让 agent 直接用原生 `git worktree add`，bare 路径由 helper 给出。该方法迫使 agent 必须知道：

- 存在一个独立的 `.bare/` 树
- `/` → `~` 分支编码
- `@<branch>` 后缀
- 精确的 `git worktree add` 念咒（含 `-b` / 不含 `-b` 的切换）

每一条都是 agent 必须记住的实现细节。记住的成本随 agent 创建的 worktree 数线性增长；一次失误（如 `cd wt && git worktree add ../foo`，因为父 wt 的 `.git` 是文件，会静默生成一个损坏的 worktree）就能丢数据。

`x repo wt <id> <branch>` / `wt ls` / `wt rm` 把这一切压缩成三个动词。路径编码、bare 查找、attach-vs-create 检测、清理语义都集中在一处。

原则是 **封装成本由其隐藏的复杂度所证明**。老规矩"不要包装 git"是准则，不是法律 —— 当用户面接口变简单时，包装。

---

## 三层防御

抵御 AI 误删的层。它们 **独立且互补** —— 任意一层失败都会被下一层捕获。

| # | 层 | 性质 | 防御对象 |
|---|---|---|---|
| 1 | skill：AI 只在 worktree 中行动 | 行为层 | 把 AI 误删爆炸半径限制在单个 wt |
| 2 | bare 在独立子树下 | 几何层 | 一个 wt 的误删不会触达 bare 或其他 wt |
| 3 | `x repo wt rm`（优雅） | 工作流层 | 保持 bare 的 `worktrees/` 注册表与现实同步 |

早期设计草案把"ls/util 用 git 元数据"与"无 x repo wt 子命令"也算作防御层；它们现归类为 **实现质量** 而非防御。它们让系统更稳健，但并不直接对抗 AI 误删。

`x repo wt rm` 实际上是第 3 层：当 agent 用完一个 wt，最省事的路径是优雅的 `wt rm`（一条命令，把清理登记给 git），而不是 `rm -rf`（静默破坏注册表）。所以 SKILL.md 说"永远不要 rm -rf worktree" —— 这不是正确性问题，而是为了保留整个设计所依赖的不变量。

---

## 本设计 **没有** 解决的问题

诚实设定期望：

- **AI 幻觉本身** 未解。我们只能让事故更难发生、更易恢复。
- **`wt rm` 期间的 force-push 与 dirty worktree** 会响亮地失败 —— 那是 git 的事，不是我们的事。
- **用户必须懂得用 `x repo`**。在 x repo 触及范围之外，用户得靠自己。这是设计如此：x repo 只能修复它拥有的命名空间内的事情。