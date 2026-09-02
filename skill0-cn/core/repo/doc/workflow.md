# workflow · 通用操作流程与"清理而非删除"原则

> agent 何时、如何创建 worktree，何时删除，以及何时 **不** 删除。做重要的多仓工作前读一遍；存疑时回来查。

本文档与 SKILL.md（配方）、design.md（为什么）并列。
**SKILL** 告诉你有哪些命令；**本文** 告诉你如何在多 agent 工作流中合理使用它们；**design** 告诉你布局为何长这样。

---

## 我们要解决的真正浪费

工作流规则之前，先说明 **为什么** x repo 长这样。

我们关心的实际浪费是 **同一个 repo 被反复克隆**：

- 同一台机器上的同一用户，把 `x-bash/repo` clone 到三个不同的目录，因为每个 build 脚本自己挑路径
- 同一台宿主机上的同一用户，开新容器后把 `x-bash/repo` 再 clone 一遍 —— 一遍 —— 又一遍
- 同一用户在多台机器之间切换时，因为每台机器有自己本地副本所以重新 clone

x repo 的设计通过 **1:1 镜像 provider 路径** 来防御这一点：`github.com/x-bash/repo` 在 `~/.x-repo/github.com/x-bash/repo`，处处一致、确定。给定 URL，你（或 agent）就知道本地路径；给定本地路径，你就知道它是哪个 repo。

结果：

- **每台机器每个 repo 只有一个 clone** —— 无路径漂移、无重复 clone
- **跨宿主可移植** —— 路径到处一样，NFS 或共享家目录直接可用
- **跨容器可移植** —— 把 `~/.x-repo/` 挂载进容器，而不是重新 clone
- **从 URL 可预测** —— agent 不必查 x repo 就能算出本地路径，反之亦然

这就是为什么路径约定不是风格偏好，而是 **数据复用策略**。默认的 `~/.x-repo/<provider>/<owner>/<name>` 形态是确保同一台机器上不存在同一 repo 两个 clone 的最便宜方式。

**善用它**：

- 若有多台机器，在每台机器上设置同样的路径（NFS、共享家、脚本化设置）。你在机器 A 上做的 clone，机器 B 也能用。
- 若跨宿主机与容器工作，把 `~/.x-repo/` 挂载进容器 —— 不要重新 clone。
- 若发现自己在同一台机器上准备第三次 clone `x-bash/repo`，停下先 `x repo ls` —— 它很可能已经在那里。

这是推荐，不是规则 —— 取你场景下有用的部分。数据复用收益在多宿主机 / 多容器 / 长跑场景中最大；对单台笔记本的一次性脚本收益小一些，开销（约定）也小。

注意 **不同设备有不同磁盘预算**：大容量工作站有 TB 级可用空间、你不想填满的共享 NFS 挂载、256 GB SSD 的笔记本、小 overlay 卷的容器 —— 每种适合不同策略。网络慢或不稳定时 NFS / 共享挂载不实用；本地盘紧时全本地 clone 不实用。**挑一个贴合你设备约束的策略**，并随设备组合变化而重评。

---

## workflow

### 1. agent 独立开发：给 worktree 起名

如果你是 agent 在某个分支做独立工作，创建一个 **wtname**（`@` 之后的部分）能标识 **你** 或 **你的任务** 的 worktree，让其他人（人或 agent）一眼看清正在发生什么。wtname 可以是 **任意** 标识符 —— 分支名、agent 名、issue id、日期、任何对协作者有用的事项：

```bash
# 按 agent 名（长跑个人分支）
x repo wt x-bash/repo agent-claude/cleanup-pass

# 按 issue / ticket id（任务级分支）
x repo wt x-bash/repo fix-1234
x repo wt x-bash/repo issue-567

# 按 tag（指向特定发布）
x repo wt x-bash/repo v1.2.0

# 按短 SHA（指向特定 commit）
x repo wt x-bash/repo abc1234
```

目录最终会落到 `~/.x-repo/<provider>/<owner>/<repo>@agent-claude~cleanup-pass` 或类似 —— 编码保留层级而不破坏深度 3 布局，目录名告诉系统上所有人谁在做什么。

### 2. 准备新 repo：默认 wt 是给人用的，不是给你用的

当 `x repo prepare <repo>` 在本机不存在的 repo 上运行时，它会克隆 bare 并创建 **默认 worktree**（每个 repo 一个，在默认分支上）。该默认 wt 是 **稳定的、对人可见的视图** —— 其他 worktree 与人类会话可能依赖它。

作为 agent，**不要** 在 default wt 中开工。创建你自己的：

```bash
# 这只是把 x-bash/repo 拉到你的机器
x repo prepare x-bash/repo x-bash/wsl
# /Users/l/.x-repo/github.com/x-bash/repo       <- 默认 wt，for humans
# /Users/l/.x-repo/github.com/x-bash/wsl        <- 默认 wt，for humans

# 申请你自己的工作区
x repo wt x-bash/repo feat/my-task
x repo wt x-bash/wsl feat/my-task
# ~/.x-repo/.../x-bash/repo@feat~my-task
# ~/.x-repo/.../x-bash/wsl@feat~my-task
```

这样做的好处：

- 默认 wt 保持干净（没有阻塞人类的进行中编辑）
- 你的工作是隔离的，可作为一个整体被移除
- `../<sibling>` 引用在你的 wt 之间生效（都在深度 3）

### 3. 成功合并后：刷新默认 wt

当你的 PR 合并进 main，默认 wt 现在已过时 —— 它还指向合并前的 commit。更新它，让任何 `cd` 进去的人（你、人类、其他 agent）看到的是当前 main：

```bash
x repo update x-bash/repo    # 在默认 wt 中 fetch + ff-merge
```

这是 agent 任务结束时的 **职责**。成本很低（一次 fetch、一次 ff-merge），并保持工作区诚实。

如果跳过这一步而别人先更新了默认 wt，那没关系 —— 操作是幂等的。只是不要成为那种让默认 wt 指向合并前 commit 持续好几天的人。

---

## cleanup · 不要急着删，删时要谨慎

任务结束后的本能是"清理我创建的所有东西"。对 worktree 来说，这种本能 **部分错误** 且 **部分昂贵**。

### 1. 别急着删 worktree —— build 缓存很贵

现代 repo 有沉重的 build 缓存：

- node_modules / venv / cargo target / go build 缓存 —— **数 GB**
- 增量编译缓存 —— 重新下载 + 重建是 **数分钟**
- language server 分析缓存 —— 重新索引是 **CPU + 内存密集**

worktree 与 repo 其余部分在 OS 层共享 build 缓存（硬链接、写时复制、或直接共享缓存目录），所以 **删除一个 worktree 通常不会让任何东西失效**。缓存仍在。

但如果你删得太急且缓存确实被清理了（有些 `cargo clean` / `rm -rf node_modules` 工作流会激进地清理），下一个任务要在全新 worktree 上付出完整重建的代价。

**默认**：保留 worktree 直到结果稳定（PR 合并、上游分支被删、或你确定不会再迭代）。磁盘成本通常远小于重建成本。

### 2. 任务完成时：删除你的 worktree，**不要删** 默认 wt

当你确定不再需要某个 worktree 时：

```bash
x repo wt rm x-bash/repo feat/my-task    # 优雅，注册表保持同步
```

**一定不要** 删除：

- 默认 worktree（`~/.x-repo/<provider>/<owner>/<name>` —— 不带 `@`）
- bare repo（`~/.x-repo/.bare/<provider>/<owner>/<name>.git`）

这两者都是 **共享基础设施**：

- 默认 wt 是人对 repo 的稳定视图；其他 agent 与人类会话可能正在打开它
- bare 持有 git 历史与 `worktrees/` 注册表；它若没了，这个 repo 的所有其他 wt 都会坏

bare 是整个几何保护设计围绕的对象。把它当作持久记录。不要在任务完成时删它；只有在 repo 真的不再被关注时才删（即便那时也优先 `x repo rm <id>`（若存在），它会原子地删除 bare 和默认 wt —— 查看 help 输出确认当前行为）。

### 3. 如果你真的必须删：先审计

如果你处于"全都清理一遍"的心情，且想删的不止自己的 worktree：

```bash
x repo wt ls <id>          # 该 repo 有哪些 worktree？
x repo ls --tsv            # 本机所有 repo
```

对于可能删除的每一项，问：

- 还有别人在用吗？（`x repo wt ls` 显示路径；检查最近 mtime）
- 这是某 repo 的默认 wt 吗？**不要删**
- 这是 bare 吗？**不要删**（除非你要删除整个 repo）
- 这是你已完成任务的 worktree 吗？通过 `x repo wt rm` 安全删除

如果不能自信地说"没人用这个"，就别碰。留着 worktree 的磁盘成本很小；破坏另一个 agent 工作状态的成本是真实的。

---

## 总结

| action | who | when | how |
|---|---|---|---|
| 准备多仓工作区 | agent 或人 | 任务开始 | `x repo prepare <id>...` |
| 创建自己的 worktree | agent | 自己工作开始 | `x repo wt <id> <branch>` |
| 合并后刷新默认 wt | 合并的 agent | 任务结束 | `x repo update <id>` |
| 删除自己已完成的 worktree | agent | 结果稳定后 | `x repo wt rm <id> <branch>` |
| **绝不** | 任何人 | — | `rm -rf` worktree 目录（破坏注册表） |
| **绝不** | 任何人 | — | 直接删除 bare 或默认 wt |

---

## 端到端示例

**场景**：agent 被要求在 `x-bash/repo` 中修 issue #1234。该修复也要改 `x-bash/wsl` —— `x-bash/repo` 通过硬编码 `../wsl` 引用消费 `x-bash/wsl`。agent 名 `claude`，工作在分支 `fix-1234`。

### step 1 — 准备

```bash
x repo prepare x-bash/repo x-bash/wsl
# /Users/l/.x-repo/github.com/x-bash/repo
# /Users/l/.x-repo/github.com/x-bash/wsl
```

之后，磁盘布局为：

```
~/.x-repo/
  .bare/
    github.com/x-bash/repo.git
    github.com/x-bash/wsl.git
  github.com/x-bash/
    repo/                          # repo 的默认 wt
    wsl/                           # wsl 的默认 wt
```

agent 读两条打印的路径，并确认 `../wsl` 将解析到 `x-bash/wsl` 的默认 wt。**默认 wt 是给人用的**，不是 agent 的工作区。

### step 2 — 申请自己的 worktree

```bash
x repo wt x-bash/repo claude/fix-1234
x repo wt x-bash/wsl claude/fix-1234
# 两条分支都是新的，所以各自得到 `-b <branch> HEAD`
```

之后：

```
~/.x-repo/github.com/x-bash/
  repo/                          # 默认 wt，未动
  repo@claude~fix-1234/          # agent 对 repo 的 wt
  wsl/                           # 默认 wt，未动
  wsl@claude~fix-1234/           # agent 对 wsl 的 wt
```

agent `cd` 进 `repo@claude~fix-1234/` 并修改。build 配置中硬编码的 `../wsl` 现在指向 `wsl@claude~fix-1234/` —— 正是 agent 想测的 wsl 快照。

### step 3 — 干活、push、开 PR

在 wt 内标准 git 工作流：

```bash
cd ~/.x-repo/github.com/x-bash/repo@claude~fix-1234
git add ... && git commit -m "fix: ..."
git push -u origin claude/fix-1234
# 用 gh / web / 任何方式开 PR
```

agent 工作期间 **不** 触碰默认 wt `repo/`。默认 wt 保持干净 main，给任何 `cd` 进来的人（人或 agent）可用。

### step 4 — PR 已合并，刷新默认 wt

PR 上游合并后：

```bash
x repo update x-bash/repo    # fetch + ff-merge 默认 wt
x repo update x-bash/wsl     # 同时刷新 wsl 默认
```

现在 `~/.x-repo/github.com/x-bash/repo/` 反映合并后的 main。任何打开默认 wt 的人看到的是当前状态，而不是过时的合并前 commit。

### step 5 — 等等，然后清理

agent 等到确定不再迭代（一两天，或下一个任务来时）：

```bash
x repo wt rm x-bash/repo claude/fix-1234
x repo wt rm x-bash/wsl  claude/fix-1234
```

默认 wt `repo/`、`wsl/` 与两个 `.bare/*.git` bare **未被触碰** —— 它们作为共享基础设施与工作的持久记录保留。

### 在本场景中 **不该** 做的事

- ❌ 用 `rm -rf repo@claude~fix-1234` 代替 `x repo wt rm` —— 破坏 bare 的 `worktrees/` 注册表
- ❌ 直接在 `repo/`（默认 wt）中编辑 —— 那是人的视图，留给他们
- ❌ `rm -rf ~/.x-repo/.bare/...` 来"省空间" —— bare 才是数据，删它会杀掉该 repo 的所有其他 wt
- ❌ 因"我想要干净状态"而从头重新 clone `x-bash/repo` —— 先 `x repo wt ls x-bash/repo`；数据是共享的，你不需要第二份