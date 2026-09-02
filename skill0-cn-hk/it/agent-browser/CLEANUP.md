---
source: lib/skill0/it/agent-browser/CLEANUP.md
target_lang: zh-CN
generated_by: claude
generated_at: 2026-09-02
---

# agent-browser cleanup

`close` 不刪任何數據。輕量與完整清理都安全 —— **無需重新授權** （macOS 上驗證過）。

## 輕量清理

保留 profile 數據（cookies、auth 狀態）。

```bash
rm -rf ~/.agent-browser/tmp/screenshots/*
rm -f ~/.agent-browser/*.pid ~/.agent-browser/*.sock ~/.agent-browser/*.engine ~/.agent-browser/*.version
rm -rf /tmp/ab-default/Default/Cache /tmp/ab-default/Default/Code\ Cache /tmp/ab-default/GraphiteDawnCache
```

## 完整清理

刪除全部包括 profile。Chrome 下次啓動時靜默重建 profile。

```bash
rm -rf ~/.agent-browser/tmp/screenshots/*
rm -f ~/.agent-browser/*.pid ~/.agent-browser/*.sock ~/.agent-browser/*.engine ~/.agent-browser/*.version
rm -rf /tmp/ab-default/
```

## 堆積的內容

| Path | Content | Size |
|------|---------|------|
| `~/.agent-browser/tmp/screenshots/` | 截圖臨時文件 | 每個約 100KB–1MB |
| `~/.agent-browser/<session>.*` | session 元數據（pid, sock, engine, version） | 每個約 20 字節 |
| `<profile>/Default/Cache/` | Chrome HTTP 緩存 | 高達數百 MB |
| `<profile>/Default/Code Cache/` | Chrome JS 緩存 | 高達數百 MB |
| `<profile>/GraphiteDawnCache/` | GPU shader 緩存 | 數 MB |
| `<profile>/Default/` | cookies、localStorage、IndexedDB | 不定 |

`<profile>` 默認為 `/tmp/ab-default`（通過 `--profile` 設置）。

## 注意

- `agent-browser --session <name> close` 關閉瀏覽器但不刪任何文件
- `agent-browser doctor --fix` 清理陳舊元數據但 **會重裝 Chrome** —— 不要用於常規清理
- 永遠不要刪除你的個人 Chrome profile（`~/Library/Application Support/Google/Chrome/`）

---

父 skill：[SKILL.md](SKILL.md)