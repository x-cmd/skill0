---
name: cve
description: |
  x cve 로 CVE 레코드 조회 —— 캐시 기반, API 키 불필요, 일별 xz TSV.
  cve, vulnerability id, kev, epss, nvd, cvelist 또는 security advisory 관련 작업 시 로드.

metadata:
  version: "0.1.0"
  category: "security"
  tags: "cve,vulnerability,nvd,kev,epss,cvelist"
  repository: "https://github.com/x-cmd/skill0"
  type: "skill0"
  x-cmd-mod: "cve"
  datasource: "https://github.com/x-cmd/cve/releases/download/data/"
  upstream: "https://github.com/CVEProject/cvelistV5"
---

# cve — skill0

연도별 xz 압축 TSV이며, 금년과 전년도분은 자동 갱신(1시간 TTL)되고 더 오래된 연도는 180일간 고정 상태로 유지됩니다. 한 번 온라인에 접속한 뒤로는 `x cve`가 오프라인에서 무한히 동작합니다.

## `x cve` 빠르게 시작하기

```bash
x cve info CVE-2024-0001      # id 조회 (단축형: x cve 2024-0001)
x cve year 2024               # 연도별 스트림, 파이프에 적합한 TSV
x cve detail CVE-2024-0001    # 전체 업스트림 레코드 (products, CWE, refs, ADP)
```

모든 플래그, 하위 명령, 단축 형태는 `x cve -h`로 확인할 수 있습니다.

## 데이터와 인접 도구

매일 갱신되는 xz TSV가 `github.com/x-cmd/cve/releases/download/data/`에 공개됩니다 (스키마는 릴리스에 문서화되어 있음). 캐시된 레코드는 얇은 투영이므로, 한 단계 더 나가는 질문에는 다음 도구를 쓰세요:

- `x shodan cve CVE-X` — EPSS 점수, KEV 포함 여부, exploit 관련 글, 벤더 권고문
- `x kev ls` — CISA KEV 카탈로그 (known-exploited 목록, 전체 테이블)
- `x osv` — 패키지 버전 단위 질의 ("내 버전이 취약한가"); `osv-*` 와 `cve-*` id 를 모두 허용
- `x cve detail` — 원본 `CVEProject/cvelistV5` JSON (정통 업스트림, 필요할 때 조회)