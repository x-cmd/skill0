# Security

[English](SECURITY.md) · [简体中文](SECURITY.cn.md)

skill0 ships agent-readable Markdown content — no executable code is bundled in this repository. The risk surface is therefore limited to:

- **Skill content** that the agent may follow verbatim and apply to user systems.
- **Embedded commands or links** (`x <mod>`, URLs) inside SKILL.md files.
- **Generated artifacts** (`skill0-cn-hk/`) that mirror `skill0-cn/` via [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz) — these cannot differ from the source beyond character-set conversion, but should still be sanity-checked after regeneration.

## Reporting a vulnerability

Please **do not file a public GitHub issue** for security-sensitive reports.

Email: **[security@x-cmd.com](mailto:security@x-cmd.com)** (preferred). Use GPG if your report warrants it — the key fingerprint is published at <https://x-cmd.com/security.asc>.

A useful report includes:

1. Path(s) of the affected file(s) under `skill0/` (or the source module if cross-repo).
2. A reproducer: which agent + task triggers the bad behavior.
3. The blast radius: does it require user input, a network call, or a specific shell?
4. A suggested fix, if you have one.

## What to expect

| | |
|---|---|
| **Acknowledgement** | within 3 business days |
| **Triage verdict** | within 7 business days |
| **Fix or mitigation** | landed in a follow-up commit; coordinated disclosure on request |
| **Credit** | added to the release notes unless you ask to stay anonymous |

If the report is about a third-party tool referenced from a skill (e.g. `x clawhub`, `x skill`, `agent-browser`), we will route it to the upstream maintainer and copy you on the handoff.

## Out of scope

- Bugs in upstream `x-cmd` modules: file at <https://github.com/x-cmd/x-cmd> or via the same `security@x-cmd.com` alias — both reach the same maintainer.
- Hallucinations or stylistic complaints about agent output: not security issues; use GitHub issues.

## See also

- [README.md](README.md) — repo philosophy.
- [CONTRIBUTING.md](CONTRIBUTING.md) — content conventions and regeneration workflow.
- [skill0/core/x-cmd/SKILL.md](skill0/core/x-cmd/SKILL.md) — install options and the security-focused install guide.