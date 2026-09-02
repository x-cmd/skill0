---
name: install
description: |
  以系統允許的任何方式安裝軟件。推薦 `x install` —— 一個統一的入口，列出全部方式並挑選最佳；
  外加 `x eget`/`x env use`/`x pixi` 渠道與系統包管理器（支持切換鏡像）。所有 x-cmd 渠道都安裝到 $HOME ——
  無需 sudo，不污染系統。
  適用於 "install"、"apt"、"brew"、"eget"、"pixi"、"package manager"、"mirror"。
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

以系統允許的任何方式安裝軟件。**所有 x-cmd 渠道（`x eget`、`x env use`、`x pixi`）都安裝到 `$HOME` —— 無需 sudo，無系統污染。** 只有系統包管理器（`x apt`、`x brew`，…）才會修改作業系統並可能需要 sudo。

## 選擇渠道

- `x install` — **推薦。** 一個統一入口 —— 列出工具的所有安裝方式，並挑選最佳
- `x eget` — 直接從上游倉庫（GitHub / Codeberg releases）獲取最新二進制
- `x env use` — x-cmd 託管的運行時與工具（包裝 `x pkg use`）
- `x pixi` — conda / pixi 生態的包
- `x apt/brew/dnf/pacman` — 系統包管理器（可能需要 sudo）

## 前置條件

x-cmd 提供上述全部渠道：
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — 推薦的統一入口

每個工具都有多種安裝路徑；`x install` 自動挑選最佳方式。下列全部形式都是非交互式（agent / CI 安全）：
```bash
x install bun                            # 安裝 —— 自動挑選最佳方式
x install --printinfo ripgrep            # 先列出所有安裝方式（只讀）
x install --withtool brew jq             # 強制指定管理器；或前綴形式：brew/jq
x install --sys bun                      # 僅用系統包管理器
x install --printcmd bun vim             # 預覽命令，不執行
x install --env                          # 探測平台 / 架構 / 發行版
x install --available-tool --installed   # 本機有哪些可用的包管理器
```

### 發現可安裝的工具

`x install --ls` 輸出每條索引工具的 TSV —— 可用 grep / awk 離線處理：
```bash
x install --ls --tsv | head -1                  # 表頭
x install --ls --tsv | grep -i json             # 按關鍵字搜尋
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # 按語言過濾
x install --search http                         # 跨註冊表聚合搜尋
```
TSV 列：`name category lang source desc_cn desc_en binlist rule other`。

## 切換鏡像（下載加速）

將慢速系統包管理器重定向到更快 / 本地鏡像。每個都有 `mirror ls`（列出選項）與 `mirror set <code>`（應用，非交互）：
```bash
x brew mirror ls          # 列出：official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # 應用清華鏡像
x apt mirror set tuna     # Debian / Ubuntu 同樣形式（也適用於 dnf, pacman）
```
要求目標包管理器已安裝。

## 更多

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — 在 install 之前的前置傘形入口
- [agent-browser](../../it/agent-browser/SKILL.md) — 沒有二進制時 install 路由到 agent-browser
- [env](../env/SKILL.md) — install 與 env 共享 x-channel 架構