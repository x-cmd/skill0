---
source: lib/skill0/data/wikipedia/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: wikipedia
description: |
  通过 x wkp 搜索与阅读 Wikipedia —— MediaWiki API、无需 API key、零安装；
  一个模块覆盖 query、extract、suggest 与 DDG 路由。
  加载条件：wiki、wikipedia、encyclopedia lookup、article summary。

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

输出为纯文本摘录（约首段 + 信息框）。子命令动词决定形态 —— `hop` 用于"搜完即摘"，`extract` 用于已知标题，`search` 用于候选列表，`suggest` 用于 did-you-mean。默认站点是英文 Wikipedia；`--lang` / `--api-url` 切换到其他 wiki。

## `x wkp` 快速上手

```bash
x wkp hop Python                      # 一句话完成搜索 + 首个结果摘录
x wkp extract OpenAI                  # 已知页面的摘要
x wkp search "Linux kernel"           # 标题不确定时列出候选
x wkp suggest pythen                  # did-you-mean：搜索前的纠错提示
```

`x wkp -h` 查看全部 flag 与子命令。

## 数据与邻近工具

上游：`https://en.wikipedia.org/w/api.php` —— MediaWiki action API。姊妹项目（Wikidata、Wiktionary、Commons）以同样方式可达；把 `--api-url` 指向相应子域。

对于再跳一步、超过 wikitext 摘要的问题：
- `x wkp : <query>` / `x wkp ddgo <query>` —— 同一个 `x wkp` 模块，通过 DuckDuckGo 的 Wikipedia 索引路由（处理含糊或口语化查询比按标题搜索更稳）
- `x ddgo <query>` —— 通用 Web 搜索，当 Wikipedia 没条目但话题存在于公网时有用
- 更广的 `x hn` / `x rfc` / `x se` 研究工具包见 [knowledge](../knowledge/SKILL.md) skill
- `x wkp open <page>` —— 当你真需要渲染页（信息框、表格、图片）时回退到浏览器