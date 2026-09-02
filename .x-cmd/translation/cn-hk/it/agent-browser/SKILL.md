---
source: lib/skill0/it/agent-browser/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: agent-browser
description: 通過 Chrome/Chromium CDP 做瀏覽器自動化 —— open、snapshot、click、screenshot。用於測試 Web 應用、移動佈局與自動化交互，無需 Playwright/Puppeteer。
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## 安裝

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # 可選，若使用已有的 Chrome 可跳過
```

## 連接已有 Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profile 與多 session

用 `--profile /tmp/ab-default` 授權一次，所有 session 共享。
每次新的 `--user-data-dir` 都會觸發 Chrome 授權提示 —— 複用默認 profile 避免它。

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

session 名是全局的 —— 用 `<project>-<device>` 避免跨 agent 衝突。
session 共享 daemon，但彼此完全隔離（cookies、cache、tab）。

## 技能與常用命令

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

數據會堆積 —— 週期清理見 [CLEANUP.md](CLEANUP.md)。

## Related

- [install](../install/SKILL.md) — 通過 x install 渠道安裝 / 啓動
- [devloop](../devloop/SKILL.md) — 用於 devloop 中的可視化改前 / 改後驗證
- [lovable](../../life/lovable/SKILL.md) — lovable 把 Web 驗證走 agent-browser