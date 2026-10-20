---
name: issue
description: devloop のための issue 管理 — goal、rule.yml、key-results、issue ライフサイクルのテンプレート。
metadata:
  related: "devloop,repo"
---


# issue

[devloop](../devloop/SKILL.md) の一部。

## 新しい開発 issue のテンプレート

```
gh issue create --title "<scope>: <short description>" --body "$(cat <<'EOF'
## Goal
<one-line objective>

## Key Results
- [ ] KR-1: <verifiable outcome>
- [ ] KR-2: <verifiable outcome>

## rule.yml
```yaml
goal: "<same as above>"
keyresults:
  - kr-1: "<same as above>"
  - kr-2: "<same as above>"
rules:
  - id: <rule-id>
    name: <name>
    apply: "<file pattern>"
    level: error
    desc:
    - <criterion>
```

## Screenshots
- Before: <image or "N/A">
- After: <image or "pending">
EOF
)"
```

## Issue のライフサイクル

| ステージ | アクション | コメントの内容 |
|-------|--------|-----------------|
| 作成 | テンプレート付きで `gh issue create` | goal、key-results、rule.yml |
| 進行中 | 作業の進行に合わせて更新 | 進捗ノート、中間のスクリーンショット |
| 検証済み | `x rule check` が PASS | rule check の結果、after のスクリーンショット |
| クローズ | `gh issue close` | commit SHA、最終検証サマリ |

## 完了時のコメントテンプレート

```
gh issue comment <n> --body "$(cat <<'EOF'
## Verified
- rule.yml: <code block or link>
- x rule check: PASS
- Before: <image>
- After: <image>
- Commit: <sha>
EOF
)"
```

## ルール

- すべての開発 issue に `goal` と `keyresults` を **MUST** 含める — 例外なし
- rule.yml を issue body か最初のコメントに code block として **MUST** 投稿する
- フロントエンド変更では変更前後のスクリーンショットを **MUST** 撮る
- 検証の根拠なく issue をクローズすることは **NEVER**
- roadmap 上での視認性のため、issue を project board にリンクする

## Related

- [devloop](../devloop/SKILL.md) — ゴール駆動ループ（goal/rule.yml/KR）のトラッカー
- [repo](../repo/SKILL.md) — issue は x-repo レイアウトの repo に紐づく