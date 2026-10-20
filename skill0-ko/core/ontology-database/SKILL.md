---
name: ontology-database
description: TSV append-only 로그로 구현한 타입이식 지식 그래프 — entity CRUD, 방향 관계, 스키마 검증, 다중 홉 추론. CLI는 `x ondb`로, 프로토콜은 AWK/Python/JS/SQLite가 읽을 수 있다.
metadata:
  related: "yfm,rule"
---


# Ontology Database (ondb)

타입이식 지식 그래프: 모든 것이 **entity**(id + type + properties)이고, **방향 관계**(from → rel → to)로 연결된다. 모든 변경은 TSV 줄을 append 한다 — 절대 덮어쓰지 않는다. TSV 로그가 곧 데이터베이스다.

## TSV 로그 형식 (프로토콜)

```
add     <type>  <id>  <epoch_ms>  key1  val1  key2  val2       # entity 생성
set     <id>  <epoch_ms>  key  val                             # 속성 갱신
rm      <id>  <epoch_ms>                                       # entity 삭제
link    <from>  <rel>  <to>  <epoch_ms>  [key1  val1 ...]     # 관계 생성
unlink  <from>  <rel>  <to>  <epoch_ms>                        # 관계 제거
# 탭 구분; 이스케이프: \t → 탭, \n → 개행, \\ → 역슬래시
# 속성은 key/val이 번갈아 나오는 쌍 (각 쌍이 별도의 탭 필드)
```

어떤 언어든 읽을 수 있다. AWK는 스트리밍, Python은 딕셔너리, SQLite는 물화한다. **로그가 사실의 원천이다.**

## CLI 사용법

```
x ondb add --type Person --name Alice                            # 자동 UUID
x ondb add --type Task --name "Fix bug" --id t1 priority=high status=open
x ondb get --id t1 --json                                       # entity 상세
x ondb set --id t1 status=done                                  # 속성 갱신
x ondb rm --id t1                                               # 삭제

x ondb link --from proj_001 --rel has_task --to t1              # 관계 생성
x ondb link --from t1 --rel blocks --to t2                      # link 속성 포함: -- status=hard
x ondb linked --id proj_001 --rel has_task                      # 나가는 관계
x ondb linked --id t1 --direction incoming                      # 들어오는 관계 (누가 이쪽으로 링크하는가)
x ondb related --id proj_001 --rel has_task --json              # 반대편 entity 전체

x ondb ls --type Task                                           # 타입별로 나열
x ondb query --type Task --where status=open --json             # 속성으로 거르기
```

`linked` = 관계 메타데이터. `related` = 반대편 entity 전체. 데이터 디렉터리에는 `--dir <path>` / `-d <path>`를 쓴다 (→ `path/ondb.tsv`).

## 스키마 & 검증

```
x ondb schema add "type:Task:required:title,status"
x ondb schema add "type:Task:enum:status:open,in_progress,done,blocked"
x ondb schema add "relation:blocks:from_types:Task"
x ondb schema add "relation:blocks:acyclic:1"
x ondb validate                          # required, enum, 끊어진 참조, cardinality, 사이클 검사
```

지시어: `type:Name:{required|forbidden|enum|datetime|ref}:...`, `relation:Rel:{from_types|to_types|cardinality|acyclic}:...`. 검증은 쓰기와 분리되어 있다.

## 아키텍처 원칙

- **로그가 원천** — TSV 로그가 권위 있는 소스다; SQLite는 물화된 뷰일 뿐이다
- **Append-only** — `set`, `rm`, `unlink`도 줄을 append 한다; 기존 줄은 절대 고치지 않는다
- **다중 인스턴스** — 하위 도메인마다 ondb 하나(기본값); 도메인 간 체인에만 합친다
- **Type = Concept** — 같은 type 이름은 언제나 같은 개념을 뜻한다
- **필요할 때 검증** — 쓰기 시점에는 스키마 검사를 하지 않는다; 배치 변경 후 `validate`를 돌린다

## 백엔드

| 백엔드 | 언제 | |
|---|---|---|
| **AWK**(기본) | < 2k entity | 의존성 제로, 스트리밍 |
| Python | 중간 규모 | 풍부한 자료 구조 |
| JS/Bun | 웹 앱 | JSON 네이티브 |
| SQLite | > 5k entity | TSV 로그에서 자동 생성 |

## 디렉터리 구조

```
<datadir>/ONDB.DESC.txt    # 필수. ondb 인스턴스를 식별
<datadir>/ondb.tsv         # Append-only 로그
<datadir>/schema.tsv       # 선택. 제약 조건
<datadir>/ondb.db          # 선택. SQLite 물화 뷰
```

## 더 자세한 정보

- `x ondb --help` — CLI 레퍼런스
- `x ondb libpath {awk,py,js}` — 커스텀 쿼리를 위한 라이브러리 경로
- [ondb SKILL.md](../../../ondb/SKILL.md) — 전체 문서 (시나리오, 통합, 커스텀 쿼리, SQLite WAL 설정)

## Related

- [yfm](../yfm/SKILL.md) — yfm의 `metadata:`가 권장되는 수집면이다
- [rule](../rule/SKILL.md) — 스키마 검증 규칙은 rule 프레임워크에 산다