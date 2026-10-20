---
name: ccal
description: |
  調休・旧暦・節気・生肖・黄历吉凶・干支紀年を備えた中国地域カレンダー。
  複数のアクセス手段：`x ccal`、直接アーカイブ取得、tsv。

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

調休 — 週末を"借りて"平日の休業日に充てたり、祝日が週末と重なった際に平日を返したりするルール — は、公式の勤務カレンダーを前提に予定を立てる中国のユーザーにとって最重要の機能です。

## `x ccal` クイックスタート

```bash
# 全日付情報を tsv 形式で表示。TSV の列は以下のとおり：
# Date   LunarDate   建除   WeekDay(周几)   Jieqi(节气)   Xiuxi(三つの状態：休、工、無-非調休由来の假期または工作日)   Yi（宜）  Ji（忌）  Holiday
x ccal ls 2026
# 全日付情報を tsv 形式で表示
x ccal ls 2026-07
# 特定日付の YAML
x ccal info 2026-05-31
# データディレクトリを取得。中身が空なら `x ccal update` を試す
x ccal datadir
```

`x ccal -h` でさらに詳しく。

注意：データソースは https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz

省スペースのため、`x ccal` は tar コマンド経由で tar.xz を解凍せず直接閲覧します。この方法を推奨しますが、より自由な処理が必要なら必要に応じて解凍しても構いません。
