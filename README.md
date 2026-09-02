# skill0

[English](README.md) · [简体中文](README.cn.md) — **[x-cmd.com/skill0 →](https://x-cmd.com/skill0)**

Source-of-truth content for the [x-cmd](https://x-cmd.com) skill0 sub-skills, plus two translation mirrors.

## Layout

```
skill0/         original source (English). Edit here.
skill0-cn/      Simplified Chinese (zh-CN) translation of skill0/.
skill0-cn-hk/   Hong Kong Traditional Chinese (zh-HK) translation. Generated; do not edit by hand.
.x-cmd/cn-hk.sh  regenerates skill0-cn-hk/ from skill0-cn/ via ljh-sh/zhhz.
LICENSE         Apache-2.0.
```

| Tree | Source? | Edit? | Content |
|---|---|---|---|
| `skill0/` | yes | yes | English originals + `index.tsv` registry |
| `skill0-cn/` | translated | yes | Simplified Chinese (`target_lang: zh-CN`) |
| `skill0-cn-hk/` | translated | no | HK Traditional (`zh-HK`), regenerated from `skill0-cn/` |

## Why three trees?

`skill0/` is the canonical English content. `skill0-cn/` is the Simplified Chinese mirror that humans edit when adding or revising Chinese documentation. `skill0-cn-hk/` is the Hong Kong Traditional mirror, kept in sync with `skill0-cn/` by a script — never hand-edited — so it can be regenerated cleanly whenever the source changes.

## Regenerate the HK Traditional mirror

The script `.x-cmd/cn-hk.sh` rewrites `skill0-cn-hk/` from `skill0-cn/` using [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz):

```sh
./.x-cmd/cn-hk.sh          # translate everything; overwrites skill0-cn-hk/
./.x-cmd/cn-hk.sh --check  # list files that would be translated, no writes
```

Pattern (no surprises):

1. `rm -rf skill0-cn-hk/ && cp -a skill0-cn/ skill0-cn-hk/` — fresh mirror
2. `find skill0-cn-hk/ -type f | zhhz --from cn-s --to cn-hk --in-place --files-from -` — convert in one batch invocation

`skill0-cn/` is only ever read by `cp -a`, so the script is fully repeatable: re-run after editing `skill0-cn/` to refresh the mirror.

`zhhz` resolution order: `$ZHHZ` → `PATH` → `~/.x-cmd.root/local/data/eget/snap/ljh-sh--zhhz/v0.7.7/bin/zhhz`.

## Editing workflow

- **English content** → edit `skill0/<path>/SKILL.md` (and update `skill0/index.tsv` for new entries).
- **Chinese content** → edit `skill0-cn/<path>/SKILL.md`. File path mirrors the corresponding `skill0/<path>/SKILL.md` exactly.
- **Never edit `skill0-cn-hk/`** — your changes will be lost on the next `cn-hk.sh` run.

## See also

- `.x-cmd/translation/cn/` and `.x-cmd/translation/cn-hk/` — older mirror layout, superseded by the top-level `skill0*/` trees.
- [ljh-sh/zhhz#70](https://github.com/ljh-sh/zhhz/issues/70) — the use case this script encodes.
- [x-cmd llms.txt](https://www.x-cmd.com/llms.txt) — wider x-cmd ecosystem.