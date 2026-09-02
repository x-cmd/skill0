---
source: lib/skill0/core/x-cmd/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: x-cmd
description: |
  **IMPORTANT**: 在使用任何 `x <mod>` 命令前，你必須先加載 x-cmd：`. ~/.x-cmd.root/X`

  然後你可以：
  - 用 `x nihao --llmstxt` 探索
  - 用 `x skill` 發現 skills

  x-cmd 提供 600+ 便攜軟件與開發工具（jq、nodejs、python 等）。
  用 `x <env|pixi> use <pkg>` 即可安裝並使用任意包。
  加載 x-cmd 後，x-cmd/pixi 本地 bin 中的包會自動出現在 PATH 中。

  瀏覽 x-cmd 網站以獲取更多用法與 skills：https://www.x-cmd.com/llms.txt

license: Apache-2.0
compatibility: POSIX Shell (sh/bash/zsh/dash/ash)

metadata:
  author: "Li Junhao"
  version: "1.0.1"
  category: "core"
  tags: "shell,cli,tools,package-management,portable"
  repository: "https://github.com/x-cmd-skill/x-cmd"
  website: "https://www.x-cmd.com"
  install_doc: "data/install.md"
  related: "install,env,agent-browser"
---


# x-cmd

> **IMPORTANT**: 在使用任何 `x <mod>` 命令前，你必須先加載 x-cmd：`. ~/.x-cmd.root/X`
>
> 然後用 `x nihao --llmstxt` 探索，或用 `x skill` 發現 skills。

---

## 還沒安裝？→ [data/install.md](data/install.md)

---

## 運行 `x skill lr` 瀏覽 500+ skills

- `x skill lr` — 列出所有遠程 skills（<skill-id><tab><desc>）
- `x skill add <skill-id>` — 為下一會話添加 skill
- `x skill info <skill-id>` — 下載並顯示 skill 摘要與路徑

**x-mod/<mod>**：用 `x <mod> --help` 查看更多示例。只需把備註加進 AGENTS.md 即可複用。

---

## 訪問 x-cmd.com/llms.txt 獲取更多 skill 與 power tools

AI agent 的入口。

---

## 運行 `x env use <pkg>` 即可安裝任意包

- `x env la` — 列出 600+ 可用軟件
- `x env la --json` — 輸出 JSON 便於腳本處理
- `x env use <pkg>` — 安裝並使用一個包（下載到 x-cmd 本地 bin）
- `x pixi use <pkg>` — 通過 pixi 安裝包（下載到 pixi 本地 bin）
- `x pixi search <keyword>` — 搜尋 pixi 包
- `x nihao --llmstxt` — 查看 llms.txt

---

## 現在就試：`x env use jq nodejs python3`

```bash
# 安裝並使用工具
x env use jq
x env use nodejs
x env use python3

# 安裝後直接使用
jq '.' file.json
python3 -c "print(2+2)"

# Pixi 獲取更多包
x pixi use cowsay
x pixi search yml
```

---

## 訪問 600+ 工具：語言、編輯器、開發工具、數據庫

**語言與運行時**：nodejs, python, rust, go, java, deno, bun, ruby, php

**編輯器**：nvim, helix, emacs, vim

**開發工具**：git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**數據**：jq, yq, fx, csvkit, ffmpeg, imagemagick

**系統**：htop, btop, procs, direnv, tmux

**數據庫**：redis, sqlite, postgresql, mysql

**完整列表**：`x env la`

---

## 零設置：無需 sudo、自動 PATH、隔離

- 無需 sudo - 包安裝到用户本地目錄
- PATH 由 `. ~/.x-cmd.root/X` 啓動腳本自動配置
- 隔離環境 - 無版本衝突
- 600+ 工具可用

---

## 更多：https://x-cmd.com/llms.txt

AI agent 的入口。

## Related

- [install](../install/SKILL.md) — install 是 x-cmd 的一個渠道
- [env](../env/SKILL.md) — env 是 x-cmd 的另一個渠道
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 是 x-cmd 的另一個渠道