---
source: lib/skill0/it/agent-browser/SKILL.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

---
name: agent-browser
description: 通过 Chrome/Chromium CDP 做浏览器自动化 —— open、snapshot、click、screenshot。用于测试 Web 应用、移动布局与自动化交互，无需 Playwright/Puppeteer。
metadata:
  related: "install,devloop,lovable"
---


# agent-browser

## 安装

```
x env use agent-browser
npm install -g agent-browser
brew install agent-browser
agent-browser install  # 可选，若使用已有的 Chrome 可跳过
```

## 连接已有 Chrome

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222
agent-browser --cdp 9222 open <url>
```

## Profile 与多 session

用 `--profile /tmp/ab-default` 授权一次，所有 session 共享。
每次新的 `--user-data-dir` 都会触发 Chrome 授权提示 —— 复用默认 profile 避免它。

```bash
agent-browser --profile /tmp/ab-default open <url> --session myapp-desktop --headed
agent-browser open <url> --session myapp-iphone14
agent-browser --session myapp-iphone14 set device "iPhone 14"
```

session 名是全局的 —— 用 `<project>-<device>` 避免跨 agent 冲突。
session 共享 daemon，但彼此完全隔离（cookies、cache、tab）。

## 技能与常用命令

```
agent-browser skills get core --full
agent-browser open <url> --session <name> --device "iPhone 14"
agent-browser snapshot -i
agent-browser click @e<id>
agent-browser screenshot
agent-browser close --all
```

数据会堆积 —— 周期清理见 [CLEANUP.md](CLEANUP.md)。

## Related

- [install](../install/SKILL.md) — 通过 x install 渠道安装 / 启动
- [devloop](../devloop/SKILL.md) — 用于 devloop 中的可视化改前 / 改后验证
- [lovable](../../life/lovable/SKILL.md) — lovable 把 Web 验证走 agent-browser