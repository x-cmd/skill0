---
source: lib/skill0/core/repo/doc/design.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# design rationale

本文解釋 x repo 佈局**為何**長成這樣。
SKILL.md 給出操作規則；本文講背景、威脅模型、以及 bare-in-`.bare` 分離的幾何論證。

如果你想理解推理而不僅僅是照配方做事，請讀本文。

---

## 威脅模型

最重要的一件事：**AI agent 會 rm -rf 東西**。

實際發生過的兩種失敗模式（第二種是促使本設計的典型事件）：

1. **AI 清理啓發式** —— AI 被告知"任務後清理"，然後把錯誤的目錄 rm -rf 掉了。
2. **AI 跨上下文混淆** —— AI 同時在普通 repo 和 bare+worktree repo 之間工作時被告知"清理"。AI 把 "main checkout" 與 "額外的 worktree（可安全刪除）" 混淆，rm -rf 掉了一個 VIP repo 的 main checkout。其他持有該 repo worktree 的併發 agent 丟失工作。

這些失敗不是"AI 壞了" —— 而是 AI 應用寬泛啓發式時的屬性。修復方式應當是 **幾何層面** 的，而不是"訓練 AI 更小心"。

---

## 核心思想：分離數據，而非工作流

git worktree 已經給了我們正確的原語：單個 bare repo 可以持有多個 linked working tree。問題是 **bare repo 放在哪裏** —— 那個問題就是整個設計。

### 樸素方案：bare 在項目目錄內（"poweruser" 模式）

```
project/
  .bare/                # 真實 git 數據
  main/                 # 人類主 worktree
  feat-auth/            # 額外 worktree
  fix-123/              # 額外 worktree
```

看起來挺整潔 —— 一個項目，一個地方 —— 但 AI 威脅模型告訴我們：

- AI 的 `rm -rf project/` 仍會殺掉 `.bare/`。
- AI 的"這能安全刪除嗎？"啓發式會把 `.bare/` 當作項目元數據，正是清理應當刪除的那種東西。
- 項目的所有 worktree 都在同一個目錄的爆炸半徑內。

這種模式讓保護 **依賴於 AI 不犯保護本應防禦的那個錯誤**。

### 我們的做法：bare 在獨立子樹下

```
~/.x-repo/
  .bare/                                                # bare repo，隱藏
    github.com/x/other-vip-repo.git
    github.com/x/main-repo.git
  github.com/                                           # working tree，可見
    x/other-vip-repo/                                   # main wt（linked to .bare/）
    x/other-vip-repo@feat-auth/                         # 額外 wt
    x/main-repo/                                        # main wt
    x/main-repo@feat-xxx/                               # 額外 wt
```

現在要毀掉一個 bare，攻擊者 / bug / 過度清理必須：

- **專門** 命中 `~/.x-repo/.bare/...`（沒有項目級或組織級命令能觸達它）
- 同時不把周圍工作區一起 rm -rf 掉

這就是幾何保護。它 **不** 依賴於行為人（人或 AI）是否小心。

---

## 為什麼目錄佈局是這樣

### `~/.x-repo/.bare/<provider>/<owner>/<name>.git`

- `~/.x-repo/` 已經是 x-cmd 共享 agent 狀態的約定 —— agent 已經知道別輕易動它。
- `.bare/` 是點前綴，普通的 `ls` 不會把它當成"要看的東西"或"要清理的東西"。
- 鏡像 provider/owner/name 路徑便於調試發現（`x repo bare <id>` 解析為絕對路徑）。
- `.git` 後綴是 bare repo 的標準 git 約定 —— git 工具能識別。

### `~/.x-repo/<provider>/<owner>/<name>`（默認 worktree）

- 與普通 `git clone` 落地位置一致。訓練於 `git clone github.com/foo/bar` 的 agent 與人看到的是完全相同的目錄形態。
- worktree 的 `.git` 是一個文件，內容是 `gitdir: <bare-path>` —— 一行指向 bare 的指針。99% 的工具不關心它是文件而非目錄；`git` 本身就原生支持（worktree 就是這麼實現的）。
- 這也回答了"為什麼沒有 main checkout 類別"：**默認 worktree 不特殊**。它只是眾多 linked working tree 之一。"人類主倉"的概念消解為"默認分支上的 wt"。

### `~/.x-repo/<provider>/<owner>/<name>@<branch-encoded>`（額外 worktree）

- 默認 worktree 的同級，相同深度，相同父目錄。
- `@` 分隔符被保留：GitHub/GitLab 禁止倉庫名含 `@`，`git check-ref-format` 允許但不鼓勵分支名含 `@`（實際很少衝突）。看到分支名含 `@` 時，我們按 **第一個** `@` 切分消歧。
- 分支名的 `/` 段被編碼為 `~`：

  | branch | directory segment |
  |---|---|
  | `main` | `main` |
  | `feat/auth` | `feat~auth` |
  | `fix/123` | `fix~123` |

  這樣每個 worktree 都保持在深度 3。若讓 `/` 通過，`feat/auth` 會產生 `repo/feat/auth/` —— 深度 4 —— 任何硬編碼 `../sibling` 從一個 wt 到 sibling 的代碼都會靜默失效，因為父目錄變成了 repo 而不是 namespace。

  git 禁止分支名含 `~`，所以編碼是 **無損** 的：目錄中出現的每個 `~` 都來自我們對 `/` 的編碼。

### 為什麼深度是 3（且不再深）

- `github.com/x-bash/repo` 從 `~/.x-repo/` 起算深度 3。任何 wt 中硬編碼的 `../<sibling>` 都能用，因為它們共享同一個父。
- 深度 4 會讓 agent worktree 嵌進項目 —— `repo@feat/` 或更糟 `repo@feat/auth/` —— 每個跨倉的相對引用都會斷。

---

## 為什麼 `x repo wt` 存在

早期設計草案主張"x repo 是路徑管理器，不是 git 包裝"，推動它們讓 agent 直接用原生 `git worktree add`，bare 路徑由 helper 給出。該方法迫使 agent 必須知道：

- 存在一個獨立的 `.bare/` 樹
- `/` → `~` 分支編碼
- `@<branch>` 後綴
- 精確的 `git worktree add` 唸咒（含 `-b` / 不含 `-b` 的切換）

每一條都是 agent 必須記住的實現細節。記住的成本隨 agent 創建的 worktree 數線性增長；一次失誤（如 `cd wt && git worktree add ../foo`，因為父 wt 的 `.git` 是文件，會靜默生成一個損壞的 worktree）就能丟數據。

`x repo wt <id> <branch>` / `wt ls` / `wt rm` 把這一切壓縮成三個動詞。路徑編碼、bare 查找、attach-vs-create 檢測、清理語義都集中在一處。

原則是 **封裝成本由其隱藏的複雜度所證明**。老規矩"不要包裝 git"是準則，不是法律 —— 當用户面接口變簡單時，包裝。

---

## 三層防禦

抵禦 AI 誤刪的層。它們 **獨立且互補** —— 任意一層失敗都會被下一層捕獲。

| # | 層 | 性質 | 防禦對象 |
|---|---|---|---|
| 1 | skill：AI 只在 worktree 中行動 | 行為層 | 把 AI 誤刪爆炸半徑限制在單個 wt |
| 2 | bare 在獨立子樹下 | 幾何層 | 一個 wt 的誤刪不會觸達 bare 或其他 wt |
| 3 | `x repo wt rm`（優雅） | 工作流層 | 保持 bare 的 `worktrees/` 註冊表與現實同步 |

早期設計草案把"ls/util 用 git 元數據"與"無 x repo wt 子命令"也算作防禦層；它們現歸類為 **實現質量** 而非防禦。它們讓系統更穩健，但並不直接對抗 AI 誤刪。

`x repo wt rm` 實際上是第 3 層：當 agent 用完一個 wt，最省事的路徑是優雅的 `wt rm`（一條命令，把清理登記給 git），而不是 `rm -rf`（靜默破壞註冊表）。所以 SKILL.md 説"永遠不要 rm -rf worktree" —— 這不是正確性問題，而是為了保留整個設計所依賴的不變量。

---

## 本設計 **沒有** 解決的問題

誠實設定期望：

- **AI 幻覺本身** 未解。我們只能讓事故更難發生、更易恢復。
- **`wt rm` 期間的 force-push 與 dirty worktree** 會響亮地失敗 —— 那是 git 的事，不是我們的事。
- **用户必須懂得用 `x repo`**。在 x repo 觸及範圍之外，用户得靠自己。這是設計如此：x repo 只能修復它擁有的命名空間內的事情。