---
name: naming
description: |
  x-cmd のモジュール / コマンド / サブコマンドの命名フレームワーク。主観的 + シナリオ駆動；本 skill は薄い殻であり、ルールブックではない。三層構成：調査（目的）、naming.<user-task>.yml（OKR + セッション記録、.rule ファイル）、naming.okr-creator.yml（セッションを監査する meta-rule）。
metadata:
  related: "rule,score,ontology-database"
---


# Naming

命名は **主観的 + シナリオ駆動** である。本 skill は **フレームワーク** であり、ルールブックではない。主観的な命名ルールを焼き込まない。

## クイックマップ

```
┌─────────────────────────────────────────────────────────┐
│  1. 目的を調査                                           │
│     何に名前を付けるのか？役割は？概念は？                │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  2. naming.<user-task>.yml  (.rule ファイル)             │
│     - goal-*        （命名タスク）                       │
│     - keyresult-*   （検証可能な成果）                   │
│     - task-*        （タスク固有の制約）                 │
│     - session:      （目標ルール上の監査証跡）           │
│         prefer     （init-004 の 5 問への回答）          │
│         init_verdicts （候補ごとの gate 判定）          │
│         scores     （候補ごとの D1-D7 アンカー）         │
│         final      （採用 + 予備）                       │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│  3. template/naming.okr-creator.yml で監査               │
│     x rule check -r <naming-dir> naming.<user-task>.yml │
└─────────────────────────────────────────────────────────┘
```

## ワークフロー — ステップ・バイ・ステップ

### ステップ 1 · 目的を調査する

何かを書く前に、以下の質問に答えよ。**スキップしてはならない**。答えがなければ、scorer は D4（TRIAL/REAL）や D5（RUN/TEST）にアンカーできない。

- **何に名前を付けるのか？** — module / subcommand / field / variable — 命名形式のルールはそれぞれ異なる
- **どんな役割を果たすのか？** — 概念を固定する（例：「trial-run モジュール」→ 独立した runner、二段階テストの Stage 1）
- **持ち続けるべき事前知識（MUST）は何か？** — 支配的な素語の意味が一致しなければならない（例：trial-run には TRIAL+RUN が必要で、REAL+TEST ではダメ）
- **避けるべき事前知識（MUST）は何か？** — unittest 汚染（`*test`/`*case`）、偽物（`*mock`/`*fake`/`*stub`/`*dry`）、実環境投入（`field*`/`*live*`）
- **どのアーキタイプが合うか？** — ship / plane / rocket / factory / abstract — D6/D7 を駆動する

出力：一行の目的記述。例：
> "D1-D7 で 8.0+ を獲得し、一目見て自明で、すべての赤線・辞書・長さの fast-fail に耐える trial-run（二段階テストの Stage 1）用の独立した x-cmd モジュール名を選べ。"

### ステップ 2 · セッション記録を作成する

テンプレートをコピーし、削って / 埋める。

```bash
cp naming.template.yml naming.<user-task>.yml
```

それから上から順に 4 つのセクションを埋める：

#### 2a. Goal rule（命名タスク）

`goal-TBD_task_id` を実 ID に置き換える。ID サフィックスはタスクを反映する（例：`goal-trial-run-naming`、`goal-mvp-prerelease-subcmd`）。

```yaml
goal-trial-run-naming:
  name: <ステップ 1 からの一行目的記述>
  apply: "naming.<user-task>.yml (self)"
  level: error
  desc:
  - <ステップ 1 由来の概念 + 役割 + 反事前知識>
```

#### 2b. Key results（検証可能な成果）

`keyresult-kr*_TBD_short_label` を一つずつ置き換える。各 KR は PASS 可能でなければならない。タスク分だけ追加する。

```yaml
keyresult-kr1-top-pick-committed:
  name: <検証可能な成果 1>
  level: error
  desc:
  - <何をもって合格とするか — 「良さそう」ではなく具体的な基準>
```

#### 2c. タスク固有のルール（候補への制約）

`TBD_task_id-*` を、目標の task-id サフィックスに一致する実制約 ID に置き換える。不要なものは削り、必要に応じて追加する。

よくあるパターン：
- `must-be-X-not-Y` — 概念整合（例：`must-be-TRIAL-not-REAL`）
- `length-N-to-M-letters` — D1 の硬直な範囲
- `must-imply-<archetype>` — D7 を拘束
- `<domain>-specific-acceptable` / `not-acceptable` — 狭いドメインの許可
- `must-be-self-explanatory` — D3

```yaml
trial-run-001:
  name: <制約、例 "must-be-TRIAL-not-REAL">
  apply: "candidate words for <task-id>"
  level: error | warn
  desc:
  - <候補が満たすべきこと>
  - <D1-D7 のどの次元を拘束するか>
  tldr:
  - wrong: <反例>
  - right: <良例>
```

#### 2d. セッション記録（目標ルール上の監査証跡）

4 つのサブセクションをすべて埋める：

**prefer** — 答えが「no / weak」であっても、**MUST** 5 問すべてに答える：
```yaml
prefer:
  vivid: yes | no | weak
  domain_acceptable: [<狭いドメインのリスト OK、例 [naval]>]   # [] = 狭いドメインはどれも不可
  length_priority: shorter | self_explanatory
  origin: english | chinese | coined
  trade_off: single_prior_ok | hit_every_dim
```

**init_verdicts** — 検討した各候補について（却下を含む）1 件ずつ：
```yaml
init_verdicts:
  - { name: <候補>, gate: init-005 | init-006 | init-007 | pass, reason: "<理由>" }
  # init-005 = 赤線パターンマッチ（自動却下）
  # init-006 = 辞書の第一義が目標と矛盾
  # init-007 = 長さ範囲外（< 2 または > 8）
  # pass     = すべての init gate を通過、採点対象
```

**scores** — init を通過した候補ごとに 1 件。スコアはすべて ≥ 6.0。各スコアにはアンカーが必要：
```yaml
scores:
  - name: <候補>
    score: <0_to_10>
    anchors:
      - "D1: <文字数の証拠>"
      - "D2: <辞書第一義の証拠>"
      - "D3: <複合語のリテラル証拠>"
      - "D4: <trial vs real の証拠>"
      - "D5: <run vs test の証拠>"
      - "D6: < vividness の証拠>"
      - "D7: <大型設備の証拠>"
    misses:
      - "<欠落点 — 本当の欠落のみ列挙、必ずしも 7 個全部ではない>"
```

**final** — 採用と予備を宣言：
```yaml
final:
  pick: <winning_candidate>
  backup: <runner_up_or_null>
```

### ステップ 3 · meta-rule で監査する

```bash
x rule check -r <naming-dir> naming.<user-task>.yml
```

OKR-creator（`template/naming.okr-creator.yml` にある）は 11 件のチェック（error と warn の混合）を実行する：

| Check | Level | 検証内容 |
|---|---|---|
| `okr-creator-001` has-goal-rule | error | ファイルに `goal-*` ルールが 1 件以上ある |
| `okr-creator-002` has-keyresult-rules | error | ファイルに `keyresult-*` ルールが 1 件以上ある |
| `okr-creator-003` has-task-specific-rules | error | ファイルにタスクルールが 1 件以上ある（goal/keyresult 以外） |
| `okr-creator-010` has-session-record | error | goal ルールに `session:` フィールドがある |
| `okr-creator-011` prefer-answers-all-five | error | init-004 の 5 問すべてに回答済み |
| `okr-creator-012` init-verdicts-recorded | error | init_verdicts が空でない |
| `okr-creator-013` scores-have-anchors | error | 各スコアに非空の anchors リストがある |
| `okr-creator-014` scores-no-below-6 | error | 全スコアが 6.0 以上 |
| `okr-creator-015` final-section-present | error | `final.pick` が宣言済み |
| `okr-creator-020` pick-backup-gap-le-1 | warn | score(pick) - score(backup) <= 1.0 |
| `okr-creator-021` top-pick-at-least-7 | warn | pick のスコアが 7.0 以上 |

**error チェックが失敗した場合**：ファイルを修正して再実行。よくある修正：
- prefer フィールド欠落 → `session.prefer` に追加
- アンカー無しの生スコア → `anchors: [...]` を追加
- スコア < 6 → `init_verdicts` に移す（却下）か、スコアを枠組み直す
- final 欠落 → `final: { pick, backup }` を追加

**warn チェックが失敗した場合**：対処するかトレードオフを文書化するかを決める。

### ステップ 4 · ユーザーが最終名を選ぶ

本 skill は提案する。ユーザーが決める。最終名は `session.final.pick` で宣言し、コミットする。

## ファイル

| ファイル | 役割 | フォーマット |
|---|---|---|
| `SKILL.md` | 本ファイル — ワークフロー + ファイル索引 | markdown |
| `naming.template.yml` | `TBD_*` プレースホルダ付きテンプレート — コピー、リネーム、充填 | `.rule` |
| `naming.trial-run-module.yml` | 完全なセッション記録の作例 | `.rule` |
| `template/naming-concept.yml` | 客観的評価フレームワーク（D1–D7、赤線、スコアアンカー）— `.rule` エントリとして | `.rule` |
| `template/naming-brand.yml` | x-cmd ブランドルール（長さ、大小文字、事前選好）— `.rule` エントリとして | `.rule` |
| `template/naming.okr-creator.yml` | meta-rule：`naming.<user-task>.yml` を監査する（上記の 11 チェック） | `.rule` |
| `template/naming-x-cmd-mod.yml` | 任意の x-cmd モジュール命名プリセット（starter session record） | `.rule` |

## 主観 vs 客観 の分割

| 客観的（ファイル / コードに書く） | 主観的（init 時に尋ねる、採点はしない） |
|---|---|
| 辞書の第一義 | 「 vivid と abstract のどちらが良いか」 |
| 文字数 | 「狭いドメイン X を許可するか」 |
| Trial / Real / Run / Test の意味クラス | 「 naval メタファーを許可するか」 |
| 複合語のリテラル意味 | 「中国語由来か英語由来か」 |
| 事前知識の汚染（unittest testcase、dryrun） | 「短さを自明性より優先するか」 |

## ルール

- **MUST** まず目的を調査する — 何に名前を付けるのか、どんな役割を果たすのか、何の概念にアンカーするのか。
- **MUST** `naming.template.yml`（`TBD_*` プレースホルダ付き）から出発し、タスクに合わせて削る / 埋める。
- **MUST** goal / key results / task rules / session record を含む `naming.<user-task>.yml`（`.rule` 形式）を生成する。
- **MUST** `template/naming.okr-creator.yml` を添えて `x rule check` を実行し、セッション記録を監査する。
- **MUST** スコアを客観的な事実にアンカーする — ユーザの反応で水増し / 過小評価してはならない。
- **MUST** ユーザーに最終名を選ばせる — skill は提案、ユーザーが決定。
- **MUST NOT** 主観的なルールを `template/naming-concept.yml` に追加しない — それらはタスクごとの `session.prefer` へ。

## Related

- [rule](../rule/SKILL.md) — naming セッションは x rule でチェックされる
- [score](../score/SKILL.md) — 候補は score フレームワークで採点される
- [ontology-database](../ontology-database/SKILL.md) — 採用された名前は ondb に永続化される
