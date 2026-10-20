---
name: time
description: |
  명령 실행 시간 측정 — 마이크로초 정밀도, 통계 분석, 비교.
  진입 장벽 없음 — x-cmd 또는 셸 내장 time 명령으로 사용.
  "timing", "benchmark", "performance", "profiling"에 활용.

metadata:
  version: "0.1.0"
  category: "performance"
  tags: "timing,benchmark,performance,measurement,statistics"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
---


# time — skill0

명령 실행 시간을 측정합니다. 단발성 마이크로초 측정부터 다회차 통계 분석까지.

## 빠른 시작

```bash
# x-cmd 사용
x time <command>                      # 단일 마이크로초 측정
x time stress -c 100 <command>        # 100회 통계
x time cmp 'cmd1' 'cmd2' 'cmd3'      # 명령 비교

# x-cmd 없이 — 셸 내장 사용
time <command>                        # 기본 측정
# 벤치마킹은 루프를 사용:
for i in $(seq 1 100); do
  start=$(date +%s%N)
  <command>
  end=$(date +%s%N)
  echo $(( end - start ))
done
```

## 사용 가능 명령

- `x time <cmd>` — 1회 실행, 마이크로초 정밀도
- `x time getms <cmd>` — 밀리초 정밀도
- `x time stress -c N <cmd>` — N회 실행, 전체 통계
- `x time stress -b N <cmd>` — 예산 내에서 실행 횟수 자동 결정
- `x time cmp 'c1' 'c2'` — 여러 명령 비교

## 출력 형식

- `--csv` 프로그램 분석용 CSV
- `--tsv` 탭 구분
- `--yml` YAML

## 이 skill0는 성장 중

핵심부터 시작합니다. 앞으로 추가될 내용:
- 벤치마킹 패턴
- 통계 해석 가이드
- 자주 보이는 성능 안티패턴

## Related

