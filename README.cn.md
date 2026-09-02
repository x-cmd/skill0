# skill0

[x-cmd](https://x-cmd.com) skill0 子技能的源内容仓库，以及两个翻译镜像。

## 目录结构

```
skill0/          原始英文内容（source of truth），在此编辑。
skill0-cn/       简体中文（zh-CN）翻译版本。
skill0-cn-hk/    香港繁体中文（zh-HK）翻译版本。由脚本生成，不要手改。
.x-cmd/cn-hk.sh  用 ljh-sh/zhhz 从 skill0-cn/ 重新生成 skill0-cn-hk/ 的脚本。
LICENSE          AGPLv3。
```

| 目录 | 是否源 | 是否手改 | 内容 |
|---|---|---|---|
| `skill0/` | 是 | 是 | 英文原稿 + `index.tsv` 注册表 |
| `skill0-cn/` | 翻译 | 是 | 简体中文（`target_lang: zh-CN`） |
| `skill0-cn-hk/` | 翻译 | 否 | 香港繁体（`zh-HK`），由 `skill0-cn/` 重新生成 |

## 为什么是三棵树？

`skill0/` 是英文权威内容；`skill0-cn/` 是人工维护的简体中文翻译；`skill0-cn-hk/` 是脚本同步的香港繁体镜像，永不手改 —— 一旦源有变，整棵树可一次性重新生成。

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

`zhhz` 查找顺序：`$ZHHZ` → `PATH` → `~/.x-cmd.root/local/data/eget/snap/ljh-sh--zhhz/v0.7.7/bin/zhhz`。

## 编辑流程

- **英文内容** → 编辑 `skill0/<path>/SKILL.md`（新增条目时同步更新 `skill0/index.tsv`）。
- **中文内容** → 编辑 `skill0-cn/<path>/SKILL.md`，frontmatter 的 `source:` 字段指向对应 `skill0/` 文件。
- **不要编辑 `skill0-cn-hk/`** —— 下一次跑 `cn-hk.sh` 会被覆盖。

## 另见

- `.x-cmd/translation/cn/` 与 `.x-cmd/translation/cn-hk/` —— 旧的镜像布局，已被顶层 `skill0*/` 取代。
- [ljh-sh/zhhz#70](https://github.com/ljh-sh/zhhz/issues/70) —— 本脚本封装的用例。
- [x-cmd llms.txt](https://www.x-cmd.com/llms.txt) —— 整个 x-cmd 生态。