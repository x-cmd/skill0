---
source: lib/skill0/core/ontology-database/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: ontology-database
description: 通过 TSV append-only log 实现的类型化知识图谱 —— entity CRUD、有向关系、schema 校验、多跳推理。CLI 通过 `x ondb`，协议可由 AWK/Python/JS/SQLite 读取。
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

类型化知识图谱：一切都是 **entity**（id + type + properties），由 **有向关系**（from → rel → to）相连。所有变更都 append TSV 行 —— 永不覆写。TSV log 就是数据库。

## TSV log 格式（协议）

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # 创建 entity
set     <id>  <epoch_ms>  key  val                             # 更新属性
rm      <id>  <epoch_ms>                                       # 删除 entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # 创建关系
unlink  <from>  <rel>  <to>  <epoch_ms>                        # 删除关系
# tab 分隔；转义：\t → tab，\n → newline，\\ → backslash
# property 是交替的 key/val 对（每对各占一个 tab 字段）
```

任何语言都能读。AWK 流式处理，Python 字典，SQLite 物化。**Log 是事实来源。**

## CLI 用法

```
x ondb add --type Person --name Alice                            # 自动 UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # 实体详情
x ondb set --id t1 status=done                                  # 更新属性
x ondb rm --id t1                                               # 删除

x ondb link --from proj_001 --rel has_task --to t1              # 创建关系
x ondb link --from t1 --rel blocks --to t2                      # 带 link 属性：-- status=hard
x ondb linked --id proj_001 --rel has_task                      # 出向关系
x ondb linked --id t1 --direction incoming                      # 入向（谁指向它）
x ondb related --id proj_001 --rel has_task --json              # 对端实体的完整信息

x ondb ls --type Task                                           # 按类型列出
x ondb query --type Task --where status=open --json             # 按属性过滤
```

`linked` = 关系元数据。`related` = 对端的完整 entity。用 `--dir <path>` / `-d <path>` 指定数据目录（→ `path/ondb.tsv`）。

## Schema 与校验

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # 检查 required、enum、悬空引用、cardinality、环
```

指令：`type:Name:{required|forbidden|enum|datetime|ref}:...`、`relation:Rel:{from_types|to_types|cardinality|acyclic}:...`。校验与写入是分开的。

## 架构原则

- **Log 是源头** —— TSV log 是权威；SQLite 只是物化视图
- **Append-only** —— `set`、`rm`、`unlink` 都 append 行；永不修改已有行
- **多实例** —— 每个子域一个 ondb（默认）；仅在跨域链路时合并
- **Type = Concept** —— 同名 type 永远指同一概念
- **按需校验** —— 写入不做 schema 检查；批量改完后跑 `validate`

## 后端

| 后端 | 适用 | 说明 |
|---|---|---|
| **AWK**（默认） | < 2k 实体 | 零依赖、流式 |
| Python | 中等 | 数据结构丰富 |
| JS/Bun | Web 应用 | JSON 原生 |
| SQLite | > 5k 实体 | 从 TSV log 自动生成 |

## 目录结构

```
<datadir>/ONDB.DESC.txt    # 必填。标识 ondb 实例
<datadir>/ondb.tsv         # Append-only log
<datadir>/schema.tsv       # 可选。约束
<datadir>/ondb.db          # 可选。SQLite 物化视图
```

## 更多信息

- `x ondb --help` — CLI 参考
- `x ondb libpath {awk,py,js}` — 自定义查询的库路径
- [ondb SKILL.md](../../../ondb/SKILL.md) — 完整文档（场景、集成、自定义查询、SQLite WAL 配置）

## Related

- [yfm](../yfm/SKILL.md) — 推荐用 yfm `metadata:` 作为摄入面
- [rule](../rule/SKILL.md) — schema 校验规则放在 rule 框架中