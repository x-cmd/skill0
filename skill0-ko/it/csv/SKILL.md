---
name: csv
description: |
  CSV 데이터 처리 — 표 형식 데이터를 확인, 필터링, 변환, 병합.
  진입 장벽 제로 —— x-cmd, Python, awk 와 함께 사용.
  "csv", "data", "table", "spreadsheet", "conversion" 작업 시 사용.

metadata:
  version: "0.1.0"
  category: "data-processing"
  tags: "csv,data,table,conversion,awk,tsv,json"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  related: "tsv"
---


# csv — skill0

CSV 데이터를 처리합니다: 확인, 필터링, 변환, 병합. 어떤 표 형식 데이터 소스와도 함께 동작합니다.

## 빠르게 시작하기

```bash
# x-cmd 사용
x csv tab 1,3,6 < data.csv           # 특정 열 표시
x csv awk '{print $1, $3}' < data.csv # AWK 로 처리
x csv tojson < data.csv               # JSON 으로 변환
x csv merge2 id file2.csv < file1.csv # 키를 기준으로 병합

# x-cmd 없이 — Python 사용
python3 -c "
import csv, json, sys
reader = csv.DictReader(sys.stdin)
for row in reader:
    print(row['name'], row['value'])
" < data.csv

# 또는 Miller (mlr), xsv, csvkit 사용
```

## 무엇을 쓸 수 있나

- `x csv tab <cols>` — 선택한 열 표시
- `x csv awk '{...}'` — AWK 스타일 처리
- `x csv tojson` — JSON 으로 변환
- `x csv tojsonl` — JSON Lines 로 변환
- `x csv totsv` — TSV 로 변환
- `x csv merge2` — 키를 기준으로 두 CSV 병합
- `x csv header` — 헤더에 대한 작업
- `x csv app` — 대화형 테이블 뷰어

## 단독 사용 대안

- Python: `csv` 모듈, `pandas`
- CLI: `mlr` (Miller), `xsv`, `csvcut`, `csvgrep`
- AWK: `awk -F, '{print $1}'`

## 이 skill0는 계속 확장됩니다

핵심 기능부터 시작합니다. 추가 예정:
- 자주 쓰는 CSV 패턴
- Python/awk 레시피
- 데이터 정제 팁

## 관련 스킬

- [tsv](../tsv/SKILL.md) — 같은 계열의 열 구분 형식 도구 (TSV)