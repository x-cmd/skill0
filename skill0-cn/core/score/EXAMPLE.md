# Examples

额外的打分场景。非必读 —— 仅当你需要某个用例的灵感时查阅。

## 功能优先级

按用户影响 vs 开发成本给功能候选打分。

`feature-priority.score.yml`：
```yaml
title: "Feature Priority"
dimensions:
  - name: D1
    label: "User Impact"
    factor: 3
    desc: "Users affected and request frequency. Higher is better."
  - name: D2
    label: "Dev Cost"
    factor: 2
    desc: "Engineering effort. Lower cost = higher score."
```

`score.tsv`（AI 填好分数 + 证据后，compute 之前）：
```
target	D1	D1_evidence	D2	D2_evidence
share-feature	8	Covers 60% of active users	6	Estimated 4 person-weeks
dark-mode	5	Covers 30% of active users	8	Estimated 2 person-weeks
```

```
$ python compute.py feature-priority.score.yml score.tsv
target	total	rank	D1	D1_evidence	D2	D2_evidence
share-feature	7.20	1	8	Covers 60% of active users	6	Estimated 4 person-weeks
dark-mode	6.20	2	5	Covers 30% of active users	8	Estimated 2 person-weeks
```

## 厂商选型

按多个加权标准给厂商打分。

`vendor.score.yml`：
```yaml
title: "Vendor Evaluation"
dimensions:
  - name: D1
    label: "Price"
    factor: 3
    desc: "Annual cost. Lower is better."
  - name: D2
    label: "Features"
    factor: 2
    desc: "Must-have feature coverage."
  - name: D3
    label: "Support"
    factor: 1
    desc: "Response time and quality."
```

`score.tsv`（compute 之前）：
```
target	D1	D1_evidence	D2	D2_evidence	D3	D3_evidence
vendor-alpha	7	$12k/yr, within budget	9	Covers all 5 must-haves	6	48h avg response
vendor-beta	4	$18k/yr, over budget	7	Covers 3 of 5 must-haves	8	4h avg response
```

```
$ python compute.py vendor.score.yml vendor.score.tsv
target	total	rank	D1	D1_evidence	D2	D2_evidence	D3	D3_evidence
vendor-alpha	7.17	1	7	$12k/yr, within budget	9	Covers all 5 must-haves	6	48h avg response
vendor-beta	5.67	2	4	$18k/yr, over budget	7	Covers 3 of 5 must-haves	8	4h avg response
```

---

父 skill：[SKILL.md](SKILL.md)