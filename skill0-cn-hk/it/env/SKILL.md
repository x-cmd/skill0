---
name: env
description: |
  即時安裝與管理軟件包、語言運行時、CLI 工具。
  零門檻 —— 安裝 x-cmd 即可秒級獲取任何工具。無需 sudo。
  適用於 "install"、"package"、"python"、"node"、"jq"、"runtime"、"tool"。

metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package,python,node,go,jq,runtime,env"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "install,x-cmd"
---


# env — skill0

即時安裝任意軟件。無需 sudo。無系統污染。

## 快速上手

```bash
# 安裝 x-cmd
eval "$(curl https://get.x-cmd.com)"

# 安裝 Python
x env use python

# 安裝 Node.js
x env use node

# 安裝 CLI 工具
x env use jq
x env use fzf

# 不永久安裝試用
x env try python3 script.py
```

## 可用內容

600+ 包，包括：

- 語言 —— python, node, go, bun, java, rust
- CLI 工具 —— jq, yq, fzf, himalaya
- 開發工具 —— claude-code, code-server

## 關鍵特性

- **無需 sudo** —— 安裝到用户目錄
- **版本管理** —— 安裝並切換版本
- **試用再裝** —— `x env try` 臨時使用
- **清理** —— `x env clean` 刪除未使用的包

## 本 skill0 還在成長

從基礎開始，將補充：
- 常用安裝模式
- 版本釘死技巧
- 多語言項目搭建指南

## 完整體驗

安裝 x-cmd 後，`x env --help` 查看全部選項。

## Related

- [install](../install/SKILL.md) — x env use 是 install 的一個渠道
- [x-cmd](../x-cmd/SKILL.md) — env 的傘形入口