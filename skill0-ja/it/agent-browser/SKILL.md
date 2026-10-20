---
name: agent-browser
description: Chrome/Chromium CDP によるブラウザ自動化 —— open、snapshot、click、screenshot。Playwright/Puppeteer を使わずに Web アプリ、モバイルレイアウト、自動化された操作をテストできる。
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## インストール

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # 任意。既存の Chrome を使うならスキップ可
```

## 既存の Chrome に接続

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## プロファイルとマルチセッション

`--profile /tmp/ab-default` を使えば一度だけ認可して全セッションで共有できる。
新しい `--user-data-dir` を指定するたびに Chrome の認可プロンプトが出る —— それを避けるにはデフォルトを再利用しよう。

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

セッション名はグローバル —— agent をまたいだ衝突を避けるには `<project>-<device>` の形にする。
セッションは daemon を共有するが、互いに完全に分離している（cookie、cache、tab）。

## スキルとよく使うコマンド

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

データは溜まっていく —— 定期的な後片付けは [CLEANUP.md](CLEANUP.md) を参照。

## Related

- [install](../install/SKILL.md) — x install のチャネルでインストール / 起動する
- [devloop](../devloop/SKILL.md) — devloop での視覚的なビフォー/アフター検証に使う
- [lovable](../../life/lovable/SKILL.md) — lovable は Web 検証を agent-browser 経由で行う
