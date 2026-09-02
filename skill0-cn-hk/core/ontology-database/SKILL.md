---
source: lib/skill0/core/ontology-database/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: ontology-database
description: 通過 TSV append-only log 實現的類型化知識圖譜 —— entity CRUD、有向關係、schema 校驗、多跳推理。CLI 通過 `x ondb`，協議可由 AWK/Python/JS/SQLite 讀取。
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

類型化知識圖譜：一切都是 **entity**（id + type + properties），由 **有向關係**（from → rel → to）相連。所有變更都 append TSV 行 —— 永不覆寫。TSV log 就是數據庫。

## TSV log 格式（協議）

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # 創建 entity
set     <id>  <epoch_ms>  key  val                             # 更新屬性
rm      <id>  <epoch_ms>                                       # 刪除 entity
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # 創建關係
unlink  <from>  <rel>  <to>  <epoch_ms>                        # 刪除關係
# tab 分隔；轉義：\t → tab，\n → newline，\\ → backslash
# property 是交替的 key/val 對（每對各佔一個 tab 字段）
```

任何語言都能讀。AWK 流式處理，Python 字典，SQLite 物化。**Log 是事實來源。**

## CLI 用法

```
x ondb add --type Person --name Alice                            # 自動 UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # 實體詳情
x ondb set --id t1 status=done                                  # 更新屬性
x ondb rm --id t1                                               # 刪除

x ondb link --from proj_001 --rel has_task --to t1              # 創建關係
x ondb link --from t1 --rel blocks --to t2                      # 帶 link 屬性：-- status=hard
x ondb linked --id proj_001 --rel has_task                      # 出向關係
x ondb linked --id t1 --direction incoming                      # 入向（誰指向它）
x ondb related --id proj_001 --rel has_task --json              # 對端實體的完整信息

x ondb ls --type Task                                           # 按類型列出
x ondb query --type Task --where status=open --json             # 按屬性過濾
```

`linked` = 關係元數據。`related` = 對端的完整 entity。用 `--dir <path>` / `-d <path>` 指定數據目錄（→ `path/ondb.tsv`）。

## Schema 與校驗

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # 檢查 required、enum、懸空引用、cardinality、環
```

指令：`type:Name:{required|forbidden|enum|datetime|ref}:...`、`relation:Rel:{from_types|to_types|cardinality|acyclic}:...`。校驗與寫入是分開的。

## 架構原則

- **Log 是源頭** —— TSV log 是權威；SQLite 只是物化視圖
- **Append-only** —— `set`、`rm`、`unlink` 都 append 行；永不修改已有行
- **多實例** —— 每個子域一個 ondb（默認）；僅在跨域鏈路時合併
- **Type = Concept** —— 同名 type 永遠指同一概念
- **按需校驗** —— 寫入不做 schema 檢查；批量改完後跑 `validate`

## 後端

| 後端 | 適用 | 説明 |
|---|---|---|
| **AWK**（默認） | < 2k 實體 | 零依賴、流式 |
| Python | 中等 | 數據結構豐富 |
| JS/Bun | Web 應用 | JSON 原生 |
| SQLite | > 5k 實體 | 從 TSV log 自動生成 |

## 目錄結構

```
<datadir>/ONDB.DESC.txt    # 必填。標識 ondb 實例
<datadir>/ondb.tsv         # Append-only log
<datadir>/schema.tsv       # 可選。約束
<datadir>/ondb.db          # 可選。SQLite 物化視圖
```

## 更多信息

- `x ondb --help` — CLI 參考
- `x ondb libpath {awk,py,js}` — 自定義查詢的庫路徑
- [ondb SKILL.md](../../../ondb/SKILL.md) — 完整文檔（場景、集成、自定義查詢、SQLite WAL 配置）

## Related

- [yfm](../yfm/SKILL.md) — 推薦用 yfm `metadata:` 作為攝入面
- [rule](../rule/SKILL.md) — schema 校驗規則放在 rule 框架中