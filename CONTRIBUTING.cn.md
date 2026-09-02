# 贡献指南

本仓库的增删改与翻译运维流程。

## 仓库布局

```
skill0/          原始英文内容（source of truth），在此编辑。
skill0-cn/       简体中文（zh-CN）翻译版本。
skill0-cn-hk/    香港繁体中文（zh-HK）翻译版本。由脚本生成，不要手改。
.x-cmd/cn-hk.sh  用 ljh-sh/zhhz 从 skill0-cn/ 重新生成 skill0-cn-hk/ 的脚本。
LICENSE          Apache-2.0。
```

| 目录 | 是否源 | 是否手改 | 内容 |
|---|---|---|---|
| `skill0/` | 是 | 是 | 英文原稿 + `index.tsv` 注册表 |
| `skill0-cn/` | 翻译 | 是 | 简体中文（`zh-CN`） |
| `skill0-cn-hk/` | 翻译 | 否 | 香港繁体（`zh-HK`），由 `skill0-cn/` 重新生成 |

仓库组织理念（4 个 bucket、OKR 工作流、x-cmd 工具链）见 [README.md](README.md) 以及权威源 [skill0/SKILL.md](skill0/SKILL.md)。

## 为什么是三棵树？

`skill0/` 是英文权威内容；`skill0-cn/` 是人工维护的简体中文翻译；`skill0-cn-hk/` 是脚本同步的香港繁体镜像，永不手改 —— 一旦源有变，整棵树可一次性重新生成。

## 新增或修改条目

1. **英文源** → 编辑或新建 `skill0/<bucket>/<slug>/SKILL.md`。若是新建条目，追加一行到 `skill0/index.tsv`（`name<TAB>description`）。
2. **跑 `skill0-writer`** 校验新文件结构、frontmatter 与形状（详见 [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md)）。
3. **简体中文镜像** → 同步创建/更新对应的 `skill0-cn/<bucket>/<slug>/SKILL.md`，路径必须与 `skill0/` 完全镜像。
4. **香港繁体镜像** → 由脚本重新生成，详见下一节。

永远不要手改 `skill0-cn-hk/` —— 下一次跑生成脚本会被覆盖。

## 重新生成香港繁体镜像

脚本 `.x-cmd/cn-hk.sh` 用 [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz) 把 `skill0-cn/` 改写成 `skill0-cn-hk/`：

```sh
./.x-cmd/cn-hk.sh          # 全量转换，覆盖 skill0-cn-hk/
./.x-cmd/cn-hk.sh --check  # 只列出待翻译的文件，不写盘
```

脚本原理（没有隐藏步骤）：

1. `rm -rf skill0-cn-hk/ && cp -a skill0-cn/ skill0-cn-hk/` —— 先做一份全新的镜像
2. `find skill0-cn-hk/ -type f | zhhz --from cn-s --to cn-hk --in-place --files-from -` —— 一次批量调用原地转换

`cp -a` 只读 `skill0-cn/`，所以脚本可以无限重跑：改完 `skill0-cn/` 再跑一遍即可。

`zhhz` 查找顺序：`$ZHHZ` → `PATH` → `~/.x-cmd.root/local/data/eget/snap/ljh-sh--zhhz/v0.7.7/bin/zhhz`。若 `zhhz` 缺失，可 `x eget ljh-sh/zhhz` 安装。该用例已向上游报为 [ljh-sh/zhhz#70](https://github.com/ljh-sh/zhhz/issues/70)。

## 翻译约定

- 标题层级、frontmatter 结构与 `skill0/` 原版保持一致。
- 代码 span、链接目标、`x <mod>` 调用一律原文保留 —— 命令名与路径禁止本地化。
- frontmatter 中的 `description:` 翻译后控制在 ~300 字以内，保持 `index.tsv` 可读性。

## 另见

- [README.md](README.md) —— 仓库理念与入口。
- [skill0/SKILL.md](skill0/SKILL.md) —— 权威根技能。
- [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md) —— 每份 SKILL.md 都必须满足的约定。
- [x-cmd llms.txt](https://www.x-cmd.com/llms.txt) —— 整个 x-cmd 生态。