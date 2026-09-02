# agent-browser cleanup

`close` 不删任何数据。轻量与完整清理都安全 —— **无需重新授权** （macOS 上验证过）。

## 轻量清理

保留 profile 数据（cookies、auth 状态）。

```bash
rm -rf ~/.agent-browser/tmp/screenshots/*
rm -f ~/.agent-browser/*.pid ~/.agent-browser/*.sock ~/.agent-browser/*.engine ~/.agent-browser/*.version
rm -rf /tmp/ab-default/Default/Cache /tmp/ab-default/Default/Code\ Cache /tmp/ab-default/GraphiteDawnCache
```

## 完整清理

删除全部包括 profile。Chrome 下次启动时静默重建 profile。

```bash
rm -rf ~/.agent-browser/tmp/screenshots/*
rm -f ~/.agent-browser/*.pid ~/.agent-browser/*.sock ~/.agent-browser/*.engine ~/.agent-browser/*.version
rm -rf /tmp/ab-default/
```

## 堆积的内容

| Path | Content | Size |
|------|---------|------|
| `~/.agent-browser/tmp/screenshots/` | 截图临时文件 | 每个约 100KB–1MB |
| `~/.agent-browser/<session>.*` | session 元数据（pid, sock, engine, version） | 每个约 20 字节 |
| `<profile>/Default/Cache/` | Chrome HTTP 缓存 | 高达数百 MB |
| `<profile>/Default/Code Cache/` | Chrome JS 缓存 | 高达数百 MB |
| `<profile>/GraphiteDawnCache/` | GPU shader 缓存 | 数 MB |
| `<profile>/Default/` | cookies、localStorage、IndexedDB | 不定 |

`<profile>` 默认为 `/tmp/ab-default`（通过 `--profile` 设置）。

## 注意

- `agent-browser --session <name> close` 关闭浏览器但不删任何文件
- `agent-browser doctor --fix` 清理陈旧元数据但 **会重装 Chrome** —— 不要用于常规清理
- 永远不要删除你的个人 Chrome profile（`~/Library/Application Support/Google/Chrome/`）

---

父 skill：[SKILL.md](SKILL.md)