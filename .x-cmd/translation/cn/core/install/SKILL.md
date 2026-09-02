---
source: lib/skill0/core/install/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: install
description: |
  以系统允许的任何方式安装软件。推荐 `x install` —— 一个统一的入口，列出全部方式并挑选最佳；
  外加 `x eget`/`x env use`/`x pixi` 渠道与系统包管理器（支持切换镜像）。所有 x-cmd 渠道都安装到 $HOME ——
  无需 sudo，不污染系统。
  适用于 "install"、"apt"、"brew"、"eget"、"pixi"、"package manager"、"mirror"。
metadata:
  version: "0.1.0"
  category: "package-management"
  tags: "install,package-manager,eget,env,pixi,apt,brew,mirror"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "x-cmd,agent-browser,env"
---


# install — skill0

以系统允许的任何方式安装软件。**所有 x-cmd 渠道（`x eget`、`x env use`、`x pixi`）都安装到 `$HOME` —— 无需 sudo，无系统污染。** 只有系统包管理器（`x apt`、`x brew`，…）才会修改操作系统并可能需要 sudo。

## 选择渠道

- `x install` — **推荐。** 一个统一入口 —— 列出工具的所有安装方式，并挑选最佳
- `x eget` — 直接从上游仓库（GitHub / Codeberg releases）获取最新二进制
- `x env use` — x-cmd 托管的运行时与工具（包装 `x pkg use`）
- `x pixi` — conda / pixi 生态的包
- `x apt/brew/dnf/pacman` — 系统包管理器（可能需要 sudo）

## 前置条件

x-cmd 提供上述全部渠道：
```bash
eval "$(curl https://get.x-cmd.com)"
```

## x install — 推荐的统一入口

每个工具都有多种安装路径；`x install` 自动挑选最佳方式。下列全部形式都是非交互式（agent / CI 安全）：
```bash
x install bun                            # 安装 —— 自动挑选最佳方式
x install --printinfo ripgrep            # 先列出所有安装方式（只读）
x install --withtool brew jq             # 强制指定管理器；或前缀形式：brew/jq
x install --sys bun                      # 仅用系统包管理器
x install --printcmd bun vim             # 预览命令，不执行
x install --env                          # 探测平台 / 架构 / 发行版
x install --available-tool --installed   # 本机有哪些可用的包管理器
```

### 发现可安装的工具

`x install --ls` 输出每条索引工具的 TSV —— 可用 grep / awk 离线处理：
```bash
x install --ls --tsv | head -1                  # 表头
x install --ls --tsv | grep -i json             # 按关键字搜索
x install --ls --tsv | awk -F'\t' '$3=="Rust"'  # 按语言过滤
x install --search http                         # 跨注册表聚合搜索
```
TSV 列：`name category lang source desc_cn desc_en binlist rule other`。

## 切换镜像（下载加速）

将慢速系统包管理器重定向到更快 / 本地镜像。每个都有 `mirror ls`（列出选项）与 `mirror set <code>`（应用，非交互）：
```bash
x brew mirror ls          # 列出：official, ali, tuna, bfsu, ustc, sjtu, ...
x brew mirror set tuna    # 应用清华镜像
x apt mirror set tuna     # Debian / Ubuntu 同样形式（也适用于 dnf, pacman）
```
要求目标包管理器已安装。

## 更多

- `x install`: https://x-cmd.com/mod/install · `x eget`: https://x-cmd.com/mod/eget
- `x env`: https://x-cmd.com/mod/env · `x pixi`: https://x-cmd.com/mod/pixi

## Related

- [x-cmd](../x-cmd/SKILL.md) — 在 install 之前的前置伞形入口
- [agent-browser](../../it/agent-browser/SKILL.md) — 没有二进制时 install 路由到 agent-browser
- [env](../env/SKILL.md) — install 与 env 共享 x-channel 架构