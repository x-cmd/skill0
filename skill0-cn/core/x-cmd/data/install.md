# x-cmd 安装指南

> 面向安全的 x-cmd 安装选项。

---

## 安全警告

本 skill 便于从远程源下载并执行软件：
- 来自 `https://get.x-cmd.com` 的安装脚本
- 来自 `https://github.com/x-cmd/release` 的二进制包
- 来自 `https://conda.prefix.dev` 的 conda 包

**在敏感环境中，执行前请务必审查安装脚本。**

---

## 安装选项（按安全等级排序）

### 选项 1：Homebrew（推荐 —— 低风险）

**适合：** 所有环境，包括生产与敏感场景。

```bash
brew install x-cmd
```

**安全属性：**
- ✅ 加密签名 bottle（SHA256 + Homebrew 签名）
- ✅ Formula 由 Homebrew 维护者审查
- ✅ 无需手动审查 —— 可信供应链
- ✅ 自动完整性校验

---

### 选项 2：手动安装并审查（中等风险）

**适合：** 想要在执行前审计代码的用户。

```bash
# 1. 下载安装脚本
curl -fsSL https://get.x-cmd.com > /tmp/x-cmd-install.sh

# 2. 审查脚本内容（关键步骤）
cat /tmp/x-cmd-install.sh
# 或：less /tmp/x-cmd-install.sh

# 3. 审查满意后再执行
sh /tmp/x-cmd-install.sh
```

**脚本做了什么：**
1. 创建 `~/.x-cmd.root/` 目录（用户本地）
2. 从 GitHub releases 下载 x-cmd 核心文件
3. 校验所有下载文件的 SHA256 校验和
4. 无系统改动，无需 sudo

---

### 选项 3：自动安装（高风险 —— 敏感环境避免）

**⚠️ 警告：** 这会在无人工审查的情况下执行远程代码。

```bash
curl -fsSL https://get.x-cmd.com | sh
```

**仅在以下情况使用：**
- 环境是一次性的（容器、临时 VM）
- 环境中没有敏感凭据
- 用户明确接受该风险

**安全影响：**
- ❌ 没有执行前审查代码的机会
- ❌ 若 get.x-cmd.com 被攻破，会遭受供应链攻击
- ⚠️ 校验和验证在初始脚本执行之后

---

## Agent 使用指南

### Agent 可安装 x-cmd 的场景

| 场景 | 允许 | 必做动作 |
|----------|-----------|----------------|
| 用户明确请求 | ✅ 是 | 确认安装方式偏好 |
| 一次性环境 | ✅ 是 | 优先 Homebrew，记录安装 |
| CI/CD 无敏感凭据 | ✅ 是 | 用 Homebrew 或手动审查 |
| 生产含敏感凭据 | ❌ 否 | 请用户手动安装 |
| 用户未同意 | ❌ 否 | 停下并征求许可 |

### 为新用户工作的 Agent 流程

1. **检查是否已安装：**
   ```bash
   [ -f "$HOME/.x-cmd.root/X" ] && echo "x-cmd installed"
   ```

2. **若未安装，问用户：**
   > "x-cmd 未安装。要使用本 skill，请通过以下方式安装：
   > - `brew install x-cmd`（推荐，有签名）
   > - 或从 https://get.x-cmd.com 下载并在执行前审查
   > 
   > 我该等你安装，还是你想让我直接安装？"

3. **仅在用户明确同意时才继续自动安装**

---

## 安装后验证

```bash
# 验证 x-cmd loader 存在
[ -f "$HOME/.x-cmd.root/X" ] || { echo "Install failed"; exit 1; }

# 验证 x-cmd 二进制存在
[ -f "$HOME/.x-cmd.root/bin/x-cmd" ] || { echo "Incomplete install"; exit 1; }

# 测试加载
. "$HOME/.x-cmd.root/X"
x-cmd --version
```

---

## 来源与校验

| 组件 | 来源 | 校验 |
|-----------|--------|--------------|
| 安装脚本 | https://get.x-cmd.com | 用户审查 + HTTPS |
| 核心二进制 | https://github.com/x-cmd/release | SHA256 校验和 |
| Homebrew bottles | Homebrew 官方 | 加密签名 |
| Conda 包 | https://conda.prefix.dev | Conda 签名 |

---

## 卸载 x-cmd

x-cmd 完全包含在 `~/.x-cmd.root/` 中。卸载：

```bash
rm -rf ~/.x-cmd.root/
# 同时从 shell 配置（~/.bashrc, ~/.zshrc）中移除：
# [ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X"
```

---

父 skill：[../SKILL.md](../SKILL.md)