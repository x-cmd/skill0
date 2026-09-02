---
source: lib/skill0/it/tldr/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: tldr
description: |
  来自 tldr-pages 项目的命令参考，配实用示例。
  零门槛 —— 配合 x-cmd、curl 或任何 tldr 客户端使用。
  适用于 "tldr"、"cheatsheet"、"command help"、"examples"、"how to"。

metadata:
  version: "0.1.0"
  category: "documentation"
  tags: "tldr,cheatsheet,help,documentation,examples"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "git,install"
---


# tldr — skill0

带真实示例的快速命令参考。比 man page 更适合回答"这个命令怎么用？"。

## 快速上手

```bash
# 用 x-cmd
x tldr git                    # Git 用法示例
x tldr --lang zh python       # 中文文档
x tldr --fz                   # 交互搜索

# 不用 x-cmd —— 用 curl
curl -s "https://raw.githubusercontent.com/tldr-pages/tldr/main/pages/common/git.md"

# 或安装 tldr 客户端
pip install tldr
npm install -g tldr
tldr tar
```

## 可用命令

- `x tldr <cmd>` — 显示某命令的示例
- `x tldr --lang zh <cmd>` — 中文
- `x tldr --fz` — 交互式 fzf 搜索
- `x tldr --cat <cmd>` — 显示原始 markdown
- `x tldr --ls` — 列出所有可用命令
- `x tldr --update` — 更新页面缓存

## 独立替代方案

- 在线：https://tldr.sh
- Python：`pip install tldr`
- Node：`npm install -g tldr`
- 原始页面：github.com/tldr-pages/tldr

## 本 skill0 还在成长

从基础开始，将补充：
- 常用命令模式
- 平台相关注意
- 与 agent 工作流集成

## Related

- [git](../git/SKILL.md) — git 子命令常用 tldr
- [install](../install/SKILL.md) — install 子命令 tldr