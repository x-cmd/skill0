---
source: lib/skill0/it/tldr/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: tldr
description: |
  來自 tldr-pages 項目的命令參考，配實用示例。
  零門檻 —— 配合 x-cmd、curl 或任何 tldr 客户端使用。
  適用於 "tldr"、"cheatsheet"、"command help"、"examples"、"how to"。

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

帶真實示例的快速命令參考。比 man page 更適合回答"這個命令怎麼用？"。

## 快速上手

```bash
# 用 x-cmd
x tldr git                    # Git 用法示例
x tldr --lang zh python       # 中文文檔
x tldr --fz                   # 交互搜尋

# 不用 x-cmd —— 用 curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# 或安裝 tldr 客户端
pip install tldr
npm install -g tldr
tldr tar
```

## 可用命令

- `x tldr <cmd>` — 顯示某命令的示例
- `x tldr --lang zh <cmd>` — 中文
- `x tldr --fz` — 交互式 fzf 搜尋
- `x tldr --cat <cmd>` — 顯示原始 markdown
- `x tldr --ls` — 列出所有可用命令
- `x tldr --update` — 更新頁面緩存

## 獨立替代方案

- 在線：https://tldr.sh
- Python：`pip install tldr`
- Node：`npm install -g tldr`
- 原始頁面：github.com/tldr-pages/tldr

## 本 skill0 還在成長

從基礎開始，將補充：
- 常用命令模式
- 平台相關注意
- 與 agent 工作流集成

## Related

- [git](../git/SKILL.md) — git 子命令常用 tldr
- [install](../install/SKILL.md) — install 子命令 tldr