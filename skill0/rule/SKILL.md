---
name: rule
description: |
  Code quality checking with YAML rulesets. Three precision levels: scan, check, audit.
  Zero barrier — use with x-cmd or standalone with any linting tool.
  Use for "code quality", "lint", "rule", "static analysis", "code review".

metadata:
  version: "0.1.0"
  category: code-quality
  tags: [code-quality, lint, rule, static-analysis, yaml]
  repository: https://github.com/x-cmd/skill0
  type: skill0
---

# rule — skill0

Check code quality against structured rulesets. Define what good code looks like in YAML, then scan/check/audit automatically.

## Quick Start

```bash
# With x-cmd
x rule scan .                    # Fast scan for critical violations
x rule check .                   # Full compliance check
x rule audit .                   # Per-rule scoring with reports
x rule fix .                     # Autonomous fix loop

# Without x-cmd — use any linter
# The rule format is YAML, the checking is up to you
```

## Rule Format

Each rule is a YAML file with natural language rules:

```yaml
- id: no-hardcoded-paths
  name: No hardcoded absolute paths
  desc: Use variables or config for file paths
  level: warning
  wrong: |
    cat /etc/passwd
    rm -rf /tmp/old
  right: |
    cat "$PASSWD_FILE"
    rm -rf "$TMPDIR/old"
```

## Precision Levels

| Level | Speed | Purpose |
|-------|-------|---------|
| scan  | Fast  | Find top 5 critical violations |
| check | Full  | Complete compliance check |
| audit | Deep  | Per-rule scoring with reports |
| fix   | Loop  | Check → fix → recheck cycle |

## Standalone Usage

The rule YAML format is language-agnostic. An AI agent can:
1. Read the rule definitions
2. Scan target files
3. Report violations in the same structured format
4. Optionally fix violations

No x-cmd required. The rules are natural language + examples.

## This skill0 grows

Starting with the core concepts. Will add:
- Common rule presets (shell, python, go)
- Rule writing best practices
- Integration patterns with CI/CD
