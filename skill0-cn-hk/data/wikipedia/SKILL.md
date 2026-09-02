---
name: wikipedia
description: |
  通過 x wkp 搜尋與閲讀 Wikipedia —— MediaWiki API、無需 API key、零安裝；
  一個模塊覆蓋 query、extract、suggest 與 DDG 路由。
  加載條件：wiki、wikipedia、encyclopedia lookup、article summary。

metadata:
  version: "0.1.0"
  category: "reference"
  tags: "wikipedia,wiki,encyclopedia,reference,lookup"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "wkp"
  upstream: "https://en.wikipedia.org/w/api.php"
---

# wikipedia — skill0

輸出為純文本摘錄（約首段 + 信息框）。子命令動詞決定形態 —— `hop` 用於"搜完即摘"，`extract` 用於已知標題，`search` 用於候選列表，`suggest` 用於 did-you-mean。默認站點是英文 Wikipedia；`--lang` / `--api-url` 切換到其他 wiki。

## `x wkp` 快速上手

```bash
x wkp hop Python                      # 一句話完成搜尋 + 首個結果摘錄
x wkp extract OpenAI                  # 已知頁面的摘要
x wkp search "Linux kernel"           # 標題不確定時列出候選
x wkp suggest pythen                  # did-you-mean：搜尋前的糾錯提示
```

`x wkp -h` 查看全部 flag 與子命令。

## 數據與鄰近工具

上游：`https://en.wikipedia.org/w/api.php` —— MediaWiki action API。姊妹項目（Wikidata、Wiktionary、Commons）以同樣方式可達；把 `--api-url` 指向相應子域。

對於再跳一步、超過 wikitext 摘要的問題：
- `x wkp : <query>` / `x wkp ddgo <query>` —— 同一個 `x wkp` 模塊，通過 DuckDuckGo 的 Wikipedia 索引路由（處理含糊或口語化查詢比按標題搜尋更穩）
- `x ddgo <query>` —— 通用 Web 搜尋，當 Wikipedia 沒條目但話題存在於公網時有用
- 更廣的 `x hn` / `x rfc` / `x se` 研究工具包見 [knowledge](../knowledge/SKILL.md) skill
- `x wkp open <page>` —— 當你真需要渲染頁（信息框、表格、圖片）時回退到瀏覽器