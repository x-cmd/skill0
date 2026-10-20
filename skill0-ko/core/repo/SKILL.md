---
name: repo
description: agent가 클론한 repo가 어디에 있고 worktree가 어떻게 배치되는지에 대한 관례 + 도구. 기본 bare repo는 `~/.x-repo/.bare/<provider>/<owner>/<name>.git`에 있고, linked working tree는 `~/.x-repo/<provider>/<owner>/<name>[/@<wtname>]` 아래에 둔다. `x repo ls`로 탐색한다. worktree 관리는 `x repo wt`. "where to clone", "git clone path", "workspace layout", "shared repos between agents", "worktree path"에 사용한다.
metadata:
  related: "git"
---

# repo

## 왜 이렇게 하는가

모든 clone은 `~/.x-repo/<provider>/<owner>/<name>`에 모인다. 모든 agent, 사람, CI가 같은 경로를 쓴다 — 컨테이너나 agent 샌드박스에 마운트해 재클론 없이 공유할 수 있다. 백업할 루트가 하나뿐이고, `x repo ls`로 탐색 가능하다. 레이아웃이 github 경로를 그대로 모방하므로, 어떤 worktree에서든 `../<sibling>`은 그 sibling의 기본 worktree로 해석된다 — sibling을 참조하는 설정과 스크립트가 wt와 agent 어디서든 똑같이 동작한다.

## 경로 레이아웃

- bare: `~/.x-repo/.bare/<provider>/<owner>/<name>.git`
- 기본 wt: `~/.x-repo/<provider>/<owner>/<name>`
- 이름 붙은 wt: `~/.x-repo/<provider>/<owner>/<name>@<wtname>`

`@<wtname>` — wtname은 이 워크스페이스를 가리키는 임의의 식별자다: agent/worker 이름, 브랜치 이름, 태그, 짧은 SHA, issue id, 자유 형식 문자열. wtname 안의 `/`는 `~`로 인코딩된다.

기본적으로 repo는 bare에 linked worktree를 붙인 형태다 — bare는 `.bare/`에 있어 worktree와 별개 디렉터리이므로, 어떤 wt에 `rm -rf`를 해도 bare까지 손대지 못한다. 평범한 `git clone`도 허용된다(`x repo ls/which/update`가 인식한다)하지만 기하학적 보호가 없다. 그럴 때는 주의해라: `rm -rf`하지 말고 `git worktree remove`를 우선하며, `.git/`를 겨냥하는 정리 휴리스틱은 피하라. 이 방식으로 잃어버린 작업은 원래 repo와 다시 맞출 수 없다.

## Commands

```bash
x repo <id>                      # 기본 wt로 cd (없으면 자동 클론)
x repo wt <id> <wtname>          # 기존 브랜치에 붙이거나, HEAD에서 새로 생성
x repo wt ls <id>                # wt 나열
x repo wt rm <id> <wtname>       # 안전하게 삭제 (rm -rf 말고 이걸 쓸 것)
x repo update <id>               # 업스트림 변경 후 기본 wt 새로 고침
x repo ls [--raw|--tsv]          # 무엇이 클론되어 있는지 탐색
x repo which <id>[@<wtname>]     # id를 절대 경로로 해석
```

## 하지 말 것

- 이름 붙은 worktree에 `rm -rf`를 하지 말라. bare의 `worktrees/` 레지스트리에 낡은 항목이 남는다. `x repo wt rm`을 쓸 것. 어쩔 수 없다면, 나중에 `git -C <bare> worktree prune`을 실행하라.

## Related

- [doc/path-layout.md](doc/path-layout.md) — 전체 경로 문법과 worktree 네이밍
- [doc/workflow.md](doc/workflow.md) — 운영 절차와 "정리하되 삭제하지 않는다" 원칙
- [doc/design.md](doc/design.md) — 왜 이 레이아웃으로 설계되었는가