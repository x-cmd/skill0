---
name: env
description: |
  即时安装与管理软件包、语言运行时、CLI 工具。
  零门槛 —— 安装 x-cmd 即可秒级获取任何工具。无需 sudo。
  适用于 "install"、"package"、"python"、"node"、"jq"、"runtime"、"tool"。

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

即时安装任意软件。无需 sudo。无系统污染。

## 快速上手

```bash
# 安装 x-cmd
eval "$(curl https://get.x-cmd.com)"

# 安装 Python
x env use python

# 安装 Node.js
x env use node

# 安装 CLI 工具
x env use jq
x env use fzf

# 不永久安装试用
x env try python3 script.py
```

## 可用内容

600+ 包，包括：

- 语言 —— python, node, go, bun, java, rust
- CLI 工具 —— jq, yq, fzf, himalaya
- 开发工具 —— claude-code, code-server

## 关键特性

- **无需 sudo** —— 安装到用户目录
- **版本管理** —— 安装并切换版本
- **试用再装** —— `x env try` 临时使用
- **清理** —— `x env clean` 删除未使用的包

## 本 skill0 还在成长

从基础开始，将补充：
- 常用安装模式
- 版本钉死技巧
- 多语言项目搭建指南

## 完整体验

安装 x-cmd 后，`x env --help` 查看全部选项。

## Related

- [install](../install/SKILL.md) — x env use 是 install 的一个渠道
- [x-cmd](../x-cmd/SKILL.md) — env 的伞形入口