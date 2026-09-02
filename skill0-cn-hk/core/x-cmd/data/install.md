# x-cmd 安裝指南

> 面向安全的 x-cmd 安裝選項。

---

## 安全警告

本 skill 便於從遠程源下載並執行軟件：
- 來自 `https://get.x-cmd.com` 的安裝腳本
- 來自 `https://github.com/x-cmd/release` 的二進制包
- 來自 `https://conda.prefix.dev` 的 conda 包

**在敏感環境中，執行前請務必審查安裝腳本。**

---

## 安裝選項（按安全等級排序）

### 選項 1：Homebrew（推薦 —— 低風險）

**適合：** 所有環境，包括生產與敏感場景。

```bash
brew install x-cmd
```

**安全屬性：**
- ✅ 加密簽名 bottle（SHA256 + Homebrew 簽名）
- ✅ Formula 由 Homebrew 維護者審查
- ✅ 無需手動審查 —— 可信供應鏈
- ✅ 自動完整性校驗

---

### 選項 2：手動安裝並審查（中等風險）

**適合：** 想要在執行前審計代碼的用户。

```bash
# 1. 下載安裝腳本
curl -fsSL https://get.x-cmd.com > /tmp/x-cmd-install.sh

# 2. 審查腳本內容（關鍵步驟）
cat /tmp/x-cmd-install.sh
# 或：less /tmp/x-cmd-install.sh

# 3. 審查滿意後再執行
sh /tmp/x-cmd-install.sh
```

**腳本做了什麼：**
1. 創建 `~/.x-cmd.root/` 目錄（用户本地）
2. 從 GitHub releases 下載 x-cmd 核心文件
3. 校驗所有下載文件的 SHA256 校驗和
4. 無系統改動，無需 sudo

---

### 選項 3：自動安裝（高風險 —— 敏感環境避免）

**⚠️ 警告：** 這會在無人工審查的情況下執行遠程代碼。

```bash
curl -fsSL https://get.x-cmd.com | sh
```

**僅在以下情況使用：**
- 環境是一次性的（容器、臨時 VM）
- 環境中沒有敏感憑據
- 用户明確接受該風險

**安全影響：**
- ❌ 沒有執行前審查代碼的機會
- ❌ 若 get.x-cmd.com 被攻破，會遭受供應鏈攻擊
- ⚠️ 校驗和驗證在初始腳本執行之後

---

## Agent 使用指南

### Agent 可安裝 x-cmd 的場景

| 場景 | 允許 | 必做動作 |
|----------|-----------|----------------|
| 用户明確請求 | ✅ 是 | 確認安裝方式偏好 |
| 一次性環境 | ✅ 是 | 優先 Homebrew，記錄安裝 |
| CI/CD 無敏感憑據 | ✅ 是 | 用 Homebrew 或手動審查 |
| 生產含敏感憑據 | ❌ 否 | 請用户手動安裝 |
| 用户未同意 | ❌ 否 | 停下並徵求許可 |

### 為新用户工作的 Agent 流程

1. **檢查是否已安裝：**
   ```bash
   [ -f "$HOME/.x-cmd.root/X" ] && echo "x-cmd installed"
   ```

2. **若未安裝，問用户：**
   > "x-cmd 未安裝。要使用本 skill，請通過以下方式安裝：
   > - `brew install x-cmd`（推薦，有簽名）
   > - 或從 https://get.x-cmd.com 下載並在執行前審查
   > 
   > 我該等你安裝，還是你想讓我直接安裝？"

3. **僅在用户明確同意時才繼續自動安裝**

---

## 安裝後驗證

```bash
# 驗證 x-cmd loader 存在
[ -f "$HOME/.x-cmd.root/X" ] || { echo "Install failed"; exit 1; }

# 驗證 x-cmd 二進制存在
[ -f "$HOME/.x-cmd.root/bin/x-cmd" ] || { echo "Incomplete install"; exit 1; }

# 測試加載
. "$HOME/.x-cmd.root/X"
x-cmd --version
```

---

## 來源與校驗

| 組件 | 來源 | 校驗 |
|-----------|--------|--------------|
| 安裝腳本 | https://get.x-cmd.com | 用户審查 + HTTPS |
| 核心二進制 | https://github.com/x-cmd/release | SHA256 校驗和 |
| Homebrew bottles | Homebrew 官方 | 加密簽名 |
| Conda 包 | https://conda.prefix.dev | Conda 簽名 |

---

## 卸載 x-cmd

x-cmd 完全包含在 `~/.x-cmd.root/` 中。卸載：

```bash
rm -rf ~/.x-cmd.root/
# 同時從 shell 配置（~/.bashrc, ~/.zshrc）中移除：
# [ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X"
```

---

父 skill：[../SKILL.md](../SKILL.md)