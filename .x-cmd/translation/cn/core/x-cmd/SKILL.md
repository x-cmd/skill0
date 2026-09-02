---
source: lib/skill0/core/x-cmd/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: x-cmd
description: |
  **IMPORTANT**: 在使用任何 `x <mod>` 命令前，你必须先加载 x-cmd：`. ~/.x-cmd.root/X`

  然后你可以：
  - 用 `x nihao --llmstxt` 探索
  - 用 `x skill` 发现 skills

  x-cmd 提供 600+ 便携软件与开发工具（jq、nodejs、python 等）。
  用 `x <env|pixi> use <pkg>` 即可安装并使用任意包。
  加载 x-cmd 后，x-cmd/pixi 本地 bin 中的包会自动出现在 PATH 中。

  浏览 x-cmd 网站以获取更多用法与 skills：https://www.x-cmd.com/llms.txt

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

> **IMPORTANT**: 在使用任何 `x <mod>` 命令前，你必须先加载 x-cmd：`. ~/.x-cmd.root/X`
>
> 然后用 `x nihao --llmstxt` 探索，或用 `x skill` 发现 skills。

---

## 还没安装？→ [data/install.md](data/install.md)

---

## 运行 `x skill lr` 浏览 500+ skills

- `x skill lr` — 列出所有远程 skills（<skill-id><tab><desc>）
- `x skill add <skill-id>` — 为下一会话添加 skill
- `x skill info <skill-id>` — 下载并显示 skill 摘要与路径

**x-mod/<mod>**：用 `x <mod> --help` 查看更多示例。只需把备注加进 AGENTS.md 即可复用。

---

## 访问 x-cmd.com/llms.txt 获取更多 skill 与 power tools

AI agent 的入口。

---

## 运行 `x env use <pkg>` 即可安装任意包

- `x env la` — 列出 600+ 可用软件
- `x env la --json` — 输出 JSON 便于脚本处理
- `x env use <pkg>` — 安装并使用一个包（下载到 x-cmd 本地 bin）
- `x pixi use <pkg>` — 通过 pixi 安装包（下载到 pixi 本地 bin）
- `x pixi search <keyword>` — 搜索 pixi 包
- `x nihao --llmstxt` — 查看 llms.txt

---

## 现在就试：`x env use jq nodejs python3`

```bash
# 安装并使用工具
x env use jq
x env use nodejs
x env use python3

# 安装后直接使用
jq '.' file.json
python3 -c "print(2+2)"

# Pixi 获取更多包
x pixi use cowsay
x pixi search yml
```

---

## 访问 600+ 工具：语言、编辑器、开发工具、数据库

**语言与运行时**：nodejs, python, rust, go, java, deno, bun, ruby, php

**编辑器**：nvim, helix, emacs, vim

**开发工具**：git, gh, glab, fzf, ripgrep, fd, bat, exa, zoxide

**数据**：jq, yq, fx, csvkit, ffmpeg, imagemagick

**系统**：htop, btop, procs, direnv, tmux

**数据库**：redis, sqlite, postgresql, mysql

**完整列表**：`x env la`

---

## 零设置：无需 sudo、自动 PATH、隔离

- 无需 sudo - 包安装到用户本地目录
- PATH 由 `. ~/.x-cmd.root/X` 启动脚本自动配置
- 隔离环境 - 无版本冲突
- 600+ 工具可用

---

## 更多：https://x-cmd.com/llms.txt

AI agent 的入口。

## Related

- [install](../install/SKILL.md) — install 是 x-cmd 的一个渠道
- [env](../env/SKILL.md) — env 是 x-cmd 的另一个渠道
- [agent-browser](../../it/agent-browser/SKILL.md) — agent-browser 是 x-cmd 的另一个渠道