---
source: lib/skill0/core/repo/doc/workflow.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# workflow · 通用操作流程與"清理而非刪除"原則

> agent 何時、如何創建 worktree，何時刪除，以及何時 **不** 刪除。做重要的多倉工作前讀一遍；存疑時回來查。

本文檔與 SKILL.md（配方）、design.md（為什麼）並列。
**SKILL** 告訴你有哪些命令；**本文** 告訴你如何在多 agent 工作流中合理使用它們；**design** 告訴你佈局為何長這樣。

---

## 我們要解決的真正浪費

工作流規則之前，先説明 **為什麼** x repo 長這樣。

我們關心的實際浪費是 **同一個 repo 被反覆克隆**：

- 同一台機器上的同一用户，把 `x-bash/repo` clone 到三個不同的目錄，因為每個 build 腳本自己挑路徑
- 同一台宿主機上的同一用户，開新容器後把 `x-bash/repo` 再 clone 一遍 —— 一遍 —— 又一遍
- 同一用户在多台機器之間切換時，因為每台機器有自己本地副本所以重新 clone

x repo 的設計通過 **1:1 鏡像 provider 路徑** 來防禦這一點：`github.com/x-bash/repo` 在 `~/.x-repo/github.com/x-bash/repo`，處處一致、確定。給定 URL，你（或 agent）就知道本地路徑；給定本地路徑，你就知道它是哪個 repo。

結果：

- **每台機器每個 repo 只有一個 clone** —— 無路徑漂移、無重複 clone
- **跨宿主可移植** —— 路徑到處一樣，NFS 或共享家目錄直接可用
- **跨容器可移植** —— 把 `~/.x-repo/` 掛載進容器，而不是重新 clone
- **從 URL 可預測** —— agent 不必查 x repo 就能算出本地路徑，反之亦然

這就是為什麼路徑約定不是風格偏好，而是 **數據複用策略**。默認的 `~/.x-repo/<provider>/<owner>/<name>` 形態是確保同一台機器上不存在同一 repo 兩個 clone 的最便宜方式。

**善用它**：

- 若有多台機器，在每台機器上設置同樣的路徑（NFS、共享家、腳本化設置）。你在機器 A 上做的 clone，機器 B 也能用。
- 若跨宿主機與容器工作，把 `~/.x-repo/` 掛載進容器 —— 不要重新 clone。
- 若發現自己在同一台機器上準備第三次 clone `x-bash/repo`，停下先 `x repo ls` —— 它很可能已經在那裏。

這是推薦，不是規則 —— 取你場景下有用的部分。數據複用收益在多宿主機 / 多容器 / 長跑場景中最大；對單枱筆記本的一次性腳本收益小一些，開銷（約定）也小。

注意 **不同設備有不同磁盤預算**：大容量工作站有 TB 級可用空間、你不想填滿的共享 NFS 掛載、256 GB SSD 的筆記本、小 overlay 卷的容器 —— 每種適合不同策略。網絡慢或不穩定時 NFS / 共享掛載不實用；本地盤緊時全本地 clone 不實用。**挑一個貼合你設備約束的策略**，並隨設備組合變化而重評。

---

## workflow

### 1. agent 獨立開發：給 worktree 起名

如果你是 agent 在某個分支做獨立工作，創建一個 **wtname**（`@` 之後的部分）能標識 **你** 或 **你的任務** 的 worktree，讓其他人（人或 agent）一眼看清正在發生什麼。wtname 可以是 **任意** 標識符 —— 分支名、agent 名、issue id、日期、任何對協作者有用的事項：

```bash
# 按 agent 名（長跑個人分支）
x repo wt x-bash/repo agent-claude/cleanup-pass

# 按 issue / ticket id（任務級分支）
x repo wt x-bash/repo fix-1234
x repo wt x-bash/repo issue-567

# 按 tag（指向特定發佈）
x repo wt x-bash/repo v1.2.0

# 按短 SHA（指向特定 commit）
x repo wt x-bash/repo abc1234
```

目錄最終會落到 `~/.x-repo/<provider>/<owner>/<repo>@agent-claude~cleanup-pass` 或類似 —— 編碼保留層級而不破壞深度 3 佈局，目錄名告訴系統上所有人誰在做什麼。

### 2. 準備新 repo：默認 wt 是給人用的，不是給你用的

當 `x repo prepare <repo>` 在本機不存在的 repo 上運行時，它會克隆 bare 並創建 **默認 worktree**（每個 repo 一個，在默認分支上）。該默認 wt 是 **穩定的、對人可見的視圖** —— 其他 worktree 與人類會話可能依賴它。

作為 agent，**不要** 在 default wt 中開工。創建你自己的：

```bash
# 這只是把 x-bash/repo 拉到你的機器
x repo prepare x-bash/repo x-bash/wsl
# /Users/l/.x-repo/github.com/x-bash/repo       <- 默認 wt，for humans
# /Users/l/.x-repo/github.com/x-bash/wsl        <- 默認 wt，for humans

# 申請你自己的工作區
x repo wt x-bash/repo feat/my-task
x repo wt x-bash/wsl feat/my-task
# ~/.x-repo/.../x-bash/repo@feat~my-task
# ~/.x-repo/.../x-bash/wsl@feat~my-task
```

這樣做的好處：

- 默認 wt 保持乾淨（沒有阻塞人類的進行中編輯）
- 你的工作是隔離的，可作為一個整體被移除
- `../<sibling>` 引用在你的 wt 之間生效（都在深度 3）

### 3. 成功合併後：刷新默認 wt

當你的 PR 合併進 main，默認 wt 現在已過時 —— 它還指向合併前的 commit。更新它，讓任何 `cd` 進去的人（你、人類、其他 agent）看到的是當前 main：

```bash
x repo update x-bash/repo    # 在默認 wt 中 fetch + ff-merge
```

這是 agent 任務結束時的 **職責**。成本很低（一次 fetch、一次 ff-merge），並保持工作區誠實。

如果跳過這一步而別人先更新了默認 wt，那沒關係 —— 操作是冪等的。只是不要成為那種讓默認 wt 指向合併前 commit 持續好幾天的人。

---

## cleanup · 不要急着刪，刪時要謹慎

任務結束後的本能是"清理我創建的所有東西"。對 worktree 來説，這種本能 **部分錯誤** 且 **部分昂貴**。

### 1. 別急着刪 worktree —— build 緩存很貴

現代 repo 有沉重的 build 緩存：

- node_modules / venv / cargo target / go build 緩存 —— **數 GB**
- 增量編譯緩存 —— 重新下載 + 重建是 **數分鐘**
- language server 分析緩存 —— 重新索引是 **CPU + 內存密集**

worktree 與 repo 其餘部分在 OS 層共享 build 緩存（硬鏈接、寫時複製、或直接共享緩存目錄），所以 **刪除一個 worktree 通常不會讓任何東西失效**。緩存仍在。

但如果你刪得太急且緩存確實被清理了（有些 `cargo clean` / `rm -rf node_modules` 工作流會激進地清理），下一個任務要在全新 worktree 上付出完整重建的代價。

**默認**：保留 worktree 直到結果穩定（PR 合併、上游分支被刪、或你確定不會再迭代）。磁盤成本通常遠小於重建成本。

### 2. 任務完成時：刪除你的 worktree，**不要刪** 默認 wt

當你確定不再需要某個 worktree 時：

```bash
x repo wt rm x-bash/repo feat/my-task    # 優雅，註冊表保持同步
```

**一定不要** 刪除：

- 默認 worktree（`~/.x-repo/<provider>/<owner>/<name>` —— 不帶 `@`）
- bare repo（`~/.x-repo/.bare/<provider>/<owner>/<name>.git`）

這兩者都是 **共享基礎設施**：

- 默認 wt 是人對 repo 的穩定視圖；其他 agent 與人類會話可能正在打開它
- bare 持有 git 歷史與 `worktrees/` 註冊表；它若沒了，這個 repo 的所有其他 wt 都會壞

bare 是整個幾何保護設計圍繞的對象。把它當作持久記錄。不要在任務完成時刪它；只有在 repo 真的不再被關注時才刪（即便那時也優先 `x repo rm <id>`（若存在），它會原子地刪除 bare 和默認 wt —— 查看 help 輸出確認當前行為）。

### 3. 如果你真的必須刪：先審計

如果你處於"全都清理一遍"的心情，且想刪的不止自己的 worktree：

```bash
x repo wt ls <id>          # 該 repo 有哪些 worktree？
x repo ls --tsv            # 本機所有 repo
```

對於可能刪除的每一項，問：

- 還有別人在用嗎？（`x repo wt ls` 顯示路徑；檢查最近 mtime）
- 這是某 repo 的默認 wt 嗎？**不要刪**
- 這是 bare 嗎？**不要刪**（除非你要刪除整個 repo）
- 這是你已完成任務的 worktree 嗎？通過 `x repo wt rm` 安全刪除

如果不能自信地説"沒人用這個"，就別碰。留着 worktree 的磁盤成本很小；破壞另一個 agent 工作狀態的成本是真實的。

---

## 總結

| action | who | when | how |
|---|---|---|---|
| 準備多倉工作區 | agent 或人 | 任務開始 | `x repo prepare <id>...` |
| 創建自己的 worktree | agent | 自己工作開始 | `x repo wt <id> <branch>` |
| 合併後刷新默認 wt | 合併的 agent | 任務結束 | `x repo update <id>` |
| 刪除自己已完成的 worktree | agent | 結果穩定後 | `x repo wt rm <id> <branch>` |
| **絕不** | 任何人 | — | `rm -rf` worktree 目錄（破壞註冊表） |
| **絕不** | 任何人 | — | 直接刪除 bare 或默認 wt |

---

## 端到端示例

**場景**：agent 被要求在 `x-bash/repo` 中修 issue #1234。該修復也要改 `x-bash/wsl` —— `x-bash/repo` 通過硬編碼 `../wsl` 引用消費 `x-bash/wsl`。agent 名 `claude`，工作在分支 `fix-1234`。

### step 1 — 準備

```bash
x repo prepare x-bash/repo x-bash/wsl
# /Users/l/.x-repo/github.com/x-bash/repo
# /Users/l/.x-repo/github.com/x-bash/wsl
```

之後，磁盤佈局為：

```
~/.x-repo/
  .bare/
    github.com/x-bash/repo.git
    github.com/x-bash/wsl.git
  github.com/x-bash/
    repo/                          # repo 的默認 wt
    wsl/                           # wsl 的默認 wt
```

agent 讀兩條打印的路徑，並確認 `../wsl` 將解析到 `x-bash/wsl` 的默認 wt。**默認 wt 是給人用的**，不是 agent 的工作區。

### step 2 — 申請自己的 worktree

```bash
x repo wt x-bash/repo claude/fix-1234
x repo wt x-bash/wsl claude/fix-1234
# 兩條分支都是新的，所以各自得到 `-b <branch> HEAD`
```

之後：

```
~/.x-repo/github.com/x-bash/
  repo/                          # 默認 wt，未動
  repo@claude~fix-1234/          # agent 對 repo 的 wt
  wsl/                           # 默認 wt，未動
  wsl@claude~fix-1234/           # agent 對 wsl 的 wt
```

agent `cd` 進 `repo@claude~fix-1234/` 並修改。build 配置中硬編碼的 `../wsl` 現在指向 `wsl@claude~fix-1234/` —— 正是 agent 想測的 wsl 快照。

### step 3 — 幹活、push、開 PR

在 wt 內標準 git 工作流：

```bash
cd ~/.x-repo/github.com/x-bash/repo@claude~fix-1234
git add ... && git commit -m "fix: ..."
git push -u origin claude/fix-1234
# 用 gh / web / 任何方式開 PR
```

agent 工作期間 **不** 觸碰默認 wt `repo/`。默認 wt 保持乾淨 main，給任何 `cd` 進來的人（人或 agent）可用。

### step 4 — PR 已合併，刷新默認 wt

PR 上游合併後：

```bash
x repo update x-bash/repo    # fetch + ff-merge 默認 wt
x repo update x-bash/wsl     # 同時刷新 wsl 默認
```

現在 `~/.x-repo/github.com/x-bash/repo/` 反映合併後的 main。任何打開默認 wt 的人看到的是當前狀態，而不是過時的合併前 commit。

### step 5 — 等等，然後清理

agent 等到確定不再迭代（一兩天，或下一個任務來時）：

```bash
x repo wt rm x-bash/repo claude/fix-1234
x repo wt rm x-bash/wsl  claude/fix-1234
```

默認 wt `repo/`、`wsl/` 與兩個 `.bare/*.git` bare **未被觸碰** —— 它們作為共享基礎設施與工作的持久記錄保留。

### 在本場景中 **不該** 做的事

- ❌ 用 `rm -rf repo@claude~fix-1234` 代替 `x repo wt rm` —— 破壞 bare 的 `worktrees/` 註冊表
- ❌ 直接在 `repo/`（默認 wt）中編輯 —— 那是人的視圖，留給他們
- ❌ `rm -rf ~/.x-repo/.bare/...` 來"省空間" —— bare 才是數據，刪它會殺掉該 repo 的所有其他 wt
- ❌ 因"我想要乾淨狀態"而從頭重新 clone `x-bash/repo` —— 先 `x repo wt ls x-bash/repo`；數據是共享的，你不需要第二份