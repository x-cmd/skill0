---
name: prompt
description: x-cmd の prompt エンジニアリング規約 — テンプレート変数での再利用、構造ルール、安全強制パターン。
metadata:
  related: "devloop,rule"
---


# Prompt

## 核となる原則：再利用、重複しない

x-cmd の prompt は、モノリスとして書くのではなく、再利用可能な断片から組み立てられる。prompt テンプレートには `<PLACEHOLDER>` 変数が含まれ、shell モジュールが実行時に解決する。

`claw` からの例：
```
first_contact.md          # 単体 — <FIRST_CONTACT_PROMPT> にロードされる
msg_telegram.md           # 組み立て：<FIRST_CONTACT_PROMPT> + <CHECK_PROMPT> + <MSG>
msg_feishu.md             # 同じ断片、プラットフォームアダプタが異なる
heartbeat.md              # 異なるワークフロー、<CHECK_PROMPT> を共有
```

**理由**：一箇所の修正が全体に波及する。プラットフォームアダプタ（Telegram、Feishu、WeChat）は行動ルールを共有するが、送信コマンドとフォーマット制限は異なる。

詳細な再利用パターンについては [reusing.md](reusing.md) を参照。

## 構造ルール

- 各 prompt ファイルは、1 つのシナリオに対する完結した自己完結的な命令セットである
- 変数には `<UPPER_CASE>` プレースホルダを使う — 実データをインライン展開してはならない
- プレースホルダは呼び出し側のモジュールが解決し、prompt 自身では解決しない
- Fragment = function（ロジックとフロー）、データは実行時に追加される（引数を設定するように）

## 安全強制パターン

安全と行動のルールは **MUST** 明示的かつ強力であること：

```
=== UNBREAKABLE RULES ===
>> RULE 1: Your stdout is INVISIBLE. Every reply MUST use send command. <<
>> RULE 2: Reply FIRST, think SECOND. For non-trivial tasks, send ack immediately. <<
>> RULE 3: Complex/long tasks → use `x agent run`. DO NOT block user. <<
```

MUST、NEVER、DO NOT を使うこと。セキュリティ言語ルールは [skill0-writer](../skill0-writer/SKILL.md) を参照。

## フォーマットガイドパターン

フォーマット能力が異なる複数プラットフォームを prompt が対象にする場合：

```
FORMAT GUIDE:
- WeChat / Enterprise WeChat: Limited formatting. Plain text, lists, emoji. No tables.
- Telegram: Full markdown including tables. Max 4096 chars.
- Feishu: Full markdown. Card messages need JSON.
```

## 実例

Prompt fragment は現在、各モジュールの `lib/data/prompt/`（例：`claw/lib/data/prompt/`）に置かれている。
これらは `skill0/lib/skill0/<subskill>/` に移行される — 同じ構造、正規の場所。

`claw/lib/data/prompt/` の現行例：
- `first_contact.md` — 新しいワークスペースへの挨拶、再利用可能な fragment
- `heartbeat.md` — バックグラウンド agent、ワークスペースの状態を読む
- `msg_<platform>.md` — プラットフォームごとのメッセージハンドラ、共通の fragment を共有

## Related

- [devloop](../devloop/SKILL.md) — prompt はしばしば devloop タスクを駆動する
- [rule](../rule/SKILL.md) — prompt の構造ルールは x rule で強制される
