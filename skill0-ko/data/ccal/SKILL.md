---
name: ccal
description: |
  调休, 农历, 节气, 生肖, 黄历吉凶, 干支纪年 등을 다루는 중국 지역 달력.
  여러 가지 접근 방식: `x ccal`, 직접 아카이브 다운로드, 또는 tsv.

metadata:
  version: "0.1.0"
  category: "calendar"
  tags: "calendar,lunar,chinese,solar-terms,holidays,almanac"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "ccal"
  datasource: "https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz"
---

# ccal — skill0

调休 — 주말을 빌려 평일 휴일을 만들거나, 공휴일이 주말에 걸리면 평일을 대신 근무로 돌려주는 규칙 — 은 공식 근무 일정에 맞춰 계획을 세우는 중국 사용자에게 핵심 기능입니다.

## `x ccal` 빠르게 시작하기

```bash
# tsv 형식으로 모든 날짜 정보를 표시합니다. TSV 열은 아래와 같습니다:
# 날짜   음력일자   建除   요일(周几)   절기(节气)   Xiuxi(세 가지 상태:休, 工, 无 — 调休이 아닌 휴일 또는 근무일)   Yi（宜）  Ji（忌）  공휴일
x ccal ls 2026
# tsv 형식으로 모든 날짜 정보를 표시합니다
x ccal ls 2026-07
# 특정 날짜를 YAML 형식으로 출력합니다
x ccal info 2026-05-31
# 데이터 디렉터리 경로를 확인합니다. 비어 있다면 `x ccal update` 를 시도하세요
x ccal datadir
```

자세한 내용은 `x ccal -h`로 확인할 수 있습니다.

참고: 데이터 소스는 https://codeberg.org/x-cmd/ccal-data/releases/download/latest/ccal-data.tar.xz 입니다

공간을 아끼기 위해 `x ccal`은 압축을 해제하지 않고 tar 명령으로 tar.xz 내부를 직접 탐색합니다. 我们鼓励这种方法，但如果需要更自由的处理，你可以按需解压。