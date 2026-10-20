---
name: score
description: |
  AI agent のための加重次元スコアリングフレームワーク — "Don't guess. Score." 中核理念：まずはニーズを理解、草稿 → 改良、agent はアナリスト。`x score compute` でランク付き TSV を出力。
metadata:
  related: "rule,naming"
---


# Score
"Don't guess. Score."
AI agent のための加重次元スコアリングフレームワーク。
## How to use
**まず理解、そしてスコア。** 次元を定義する前に十分な質問をすること。次元が誤っていれば、どれほど精密でもスコアは誤る。
**草稿 → 改良。** ニーズが完全には明確でないときは、ベストエフォートの標準を作り、スコアを付け、結果を示す。具体的なランクに対してユーザは反応する — 「この factor はもっと高いべきだ」「X を忘れている」。それがシグナルだ。精練し、スコアし直す。1 回の改良は 10 回の当て推量に勝つ。
**agent はアナリスト。** compute の後、TSV を読む。なぜ X が Y に勝ったのかを説明する。サプライズを際立たせる。調整を提案する。ランキングは会話を始めるものであり、終わらせるものではない。
## Core flow
```
① ニーズ理解  → ② score.yml を定義  → ③ score.tsv にスコア  → ④ x score compute  → ⑤ 報告 & 改良
```
Output：`target, total, rank, block, reason, <dim> (X%), evidence`。Total 0–100、降順。rank=1 が最良。
## Example — プロモーションスローガンを決める手助け
1. ユーザと議論し、評価次元と基準を決める。`slogan.score.yml` を書く。
2. AI が各スローガンを次元ごとに（0–10、証拠付きで）採点 → `slogan.score.tsv`。total と rank は空白のまま。
3. `x score compute slogan.score.yml slogan.score.tsv` → total + rank を埋める。
4. 結果を読んで、ユーザと議論。スコアを調整するか候補を追加し、繰り返す。
5. あるいは：`x score iter -f slogan.score.yml slogan.score.tsv "<feedback>"`
例：[EXAMPLE.md](EXAMPLE.md)。
## Two-file model
- `*.score.yml` — 再利用可能な標準：次元、factor、説明
- `**.score.tsv` — ターゲット + スコア + 証拠；第 1 列 = ターゲット名
`x score compute <yml> <tsv>` は `python compute.py` と同等。
## Application scenarios
1. **agent に意思決定ワークフローを与える。** score.yml が agent を構造化プロセスに固定する — agent は標準に従うのであって、直前のメッセージの気分に従うのではない。
2. **意思決定はルールに基づく。** 次元 × factor × 証拠 → 加重合計 → ランク。各スコアは事実にアンカーされる。推論は透明。
3. **ニーズに合わせて調整。** 次元を換え、factor を調整し、ハードフィルタ（`block` 列）を加える。同じテンプレート、異なるユーザ。
4. **ニーズが明確になるにつれ進化する。** 草稿 → 採点 → フィードバック → 精練 → より鋭く。
5. **任意の skill のための標準ファイル + アーカイブ結果。** score.yml = 意思決定の標準。score.tsv = 意思決定の記録。どちらもアーカイブ可能、レビュー可能、共有可能。
---
## Formula
```
total = Σ(factor × score) ÷ Σ(factor) × 10   →   0–100
```
- **factor** — 整数 1–10。基準 = 2。1=些細、4=2×、6=3×、8=4×、10=5×。自動正規化。
- **score** — 次元ごとに 0–10、証拠にアンカー。
- **total** — 加重合計 0–100。
次元ヘッダに重み % を表示：`factor ÷ Σ(factor) × 100`。
## Output columns
| Column | Source | Description |
|--------|--------|-------------|
| `target` | input | 候補名 |
| `total` | computed | 加重スコア（0–100） |
| `rank` | computed | 1 = 最良。block された場合は `X` |
| `block` | input | ハードフィルタ — 非空 = 失格、最下部に押し下げ、rank=X |
| `reason` | input/output | 任意：スコアのニュアンスに対する AI メモ |
| `<dim> (X%)` | computed | 次元ごとのスコア、ヘッダに重み % を表示 |
| `evidence` | input | 各スコアを裏付ける事実 |
## Scale
- 9–10 — Excellent — 基準を完全に満たす
- 7–8 — Good — 基準を満たす、わずかなギャップ
- 5–6 — Adequate — 方向は正しい、目立つ欠落あり
- 3–4 — Weak — 重大なギャップ
- 1–2 — Fail — ほとんど対応できていない
- 0 — N/A — 該当せず
## Rules
1. **証拠にアンカー** — 各スコアは **MUST** 証拠を持つ。感覚ではなく事実。
2. **全範囲を使う** — 5 は中点であり、デフォルトではない。0 と 10 は稀だが可能。
3. **factor は相対的な増幅器** — factor 2 = factor 1 の 2 倍の影響力。自動正規化。
4. **ターゲットは一意かつ非空** — 第 1 列の各行にターゲット名がなければならない。重複なし、空欄なし。
5. **agent は読み、報告し、決める** — compute 後、結果を説明する。必要に応じて再採点または再重み付け。
## Files
- `SKILL.cn.md` — 中国語版
- `compute.py` — 検証 + total + rank の計算
- `template/*.score.yml` — 35+ テンプレート。`x score ls` で一覧、`x score init -t <name>` でコピー
- `EXAMPLE.md` — より多くの使用例
- `rule-vs-score.md` — いつ rule vs score を使うか
- `score-template-writer.md` — スコアリングテンプレートの書き方

## Related

- [rule](../rule/SKILL.md) — ペアとなるコンプライアンスの伴侶
- [naming](../naming/SKILL.md) — 候補名はここで採点される
