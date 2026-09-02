# 安全

[English](SECURITY.md) · [简体中文](SECURITY.cn.md)

skill0 提供给 agent 读取的 Markdown 内容，仓库里不打包任何可执行代码。风险面因此有限：

- **技能内容**：agent 可能照原文执行，应用到用户系统。
- **嵌入的命令或链接**（`x <mod>`、URL）出现在 SKILL.md 文件中。
- **生成产物**（`skill0-cn-hk/`）由 `skill0-cn/` 经 [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz) 转换得到 —— 理论上与源只在字符集上有差异，但每次重新生成后仍应做基本人工核验。

## 报告漏洞

**请勿在 GitHub 上开公开 issue 报告安全问题。**

首选方式：发邮件到 **[security@x-cmd.com](mailto:security@x-cmd.com)**。如报告较敏感可使用 GPG —— 公钥指纹发布在 <https://x-cmd.com/security.asc>。

一份有用的报告包含：

1. 受影响文件的路径（位于 `skill0/` 之下，若跨仓库请注明源模块）。
2. 复现步骤：哪个 agent + 哪类任务触发问题。
3. 影响范围：是否需要用户输入、网络调用、特定 shell 环境？
4. 建议的修复（如有）。

## 处理时效

| | |
|---|---|
| **确认收悉** | 3 个工作日内 |
| **分诊结论** | 7 个工作日内 |
| **修复或缓解** | 在后续 commit 中落地；可按需协调披露 |
| **署名** | 默认写入发布说明；如需匿名请注明 |

若漏洞涉及技能中引用的第三方工具（如 `x clawhub`、`x skill`、`agent-browser`），我们会转给上游维护人，并抄送报告人作为交接依据。

## 不在范围内

- 上游 `x-cmd` 模块的 bug：请提交到 <https://github.com/x-cmd/x-cmd>，或使用同一个 `security@x-cmd.com` 邮箱 —— 都直达同一维护人。
- agent 输出的"幻觉"或文风问题：不属于安全问题，请在 GitHub issue 反馈。

## 另见

- [README.md](README.md) —— 仓库理念。
- [CONTRIBUTING.md](CONTRIBUTING.md) —— 内容约定与翻译运维流程。
- [skill0/core/x-cmd/SKILL.md](skill0/core/x-cmd/SKILL.md) —— 安装选项与以安全为先的安装指南。