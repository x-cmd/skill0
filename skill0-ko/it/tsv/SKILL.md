---
name: tsv
description: |
  TSV 데이터 처리 — tab 구분 데이터 조회, 필터, 변환.
  진입 장벽 없음 — x-cmd, awk 또는 Python으로 사용.
  "tsv", "tab-separated", "data", "conversion"에 활용.

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "tsv,data,tab,conversion,awk,csv"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "csv,ontology-database"
---


# tsv — skill0

TSV (Tab-Separated Values) 데이터를 처리합니다: 조회, 필터, 형식 간 변환.

## 빠른 시작

```bash
# x-cmd 사용
x tsv < data.tsv                   # TSV 데이터 표시
x tsv --csv < data.tsv             # CSV로 변환
x tsv awk '{print $1, $3}' < data.tsv  # AWK로 처리

# x-cmd 없이 — AWK가 TSV를 네이티브로 지원
awk -F'\t' '{print $1, $3}' data.tsv
# TSV를 CSV로 변환
awk -F'\t' -v OFS=',' '{$1=$1; print}' data.tsv
# 행 필터링
awk -F'\t' '$3 > 100 {print}' data.tsv
```

## 사용 가능 명령

- `x tsv` — TSV 데이터 표시
- `x tsv --csv` — CSV로 변환
- `x tsv awk '{...}'` — AWK 스타일 처리

## 단독 대안

- AWK: `awk -F'\t' '{...}'` — 네이티브 TSV 지원
- Python: `csv` 모듈에 `delimiter='\t'` 지정
- Miller: `mlr --tsv cat data.tsv`

## 이 skill0는 성장 중

핵심부터 시작합니다. 앞으로 추가될 내용:
- 자주 쓰는 TSV 패턴
- TSV↔CSV 변환 레시피
- 열 조작 팁

## Related

- [csv](../csv/SKILL.md) — 같은 열 형식 도구 (CSV)
- [ontology-database](../ontology-database/SKILL.md) — ondb 로그가 곧 TSV
