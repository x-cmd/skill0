# Contributing

How to add, edit, translate, and regenerate content in this repo.

## Repository layout

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
| `skill0-cn/` | translated | yes | Simplified Chinese (`zh-CN`) |
| `skill0-cn-hk/` | translated | no | HK Traditional (`zh-HK`), regenerated from `skill0-cn/` |

The repo-organization philosophy (4 buckets, OKR workflow, x-cmd tooling) is documented in [README.md](README.md) and the canonical source at [skill0/SKILL.md](skill0/SKILL.md).

## Why three trees?

`skill0/` is the canonical English content. `skill0-cn/` is the Simplified Chinese mirror that humans edit when adding or revising Chinese documentation. `skill0-cn-hk/` is the Hong Kong Traditional mirror, kept in sync with `skill0-cn/` by a script — never hand-edited — so it can be regenerated cleanly whenever the source changes.

## Add or edit an entry

1. **English source** → edit or create `skill0/<bucket>/<slug>/SKILL.md`. If new, also append a row to `skill0/index.tsv` (`name<TAB>description`).
2. **Run `skill0-writer`** against the new file to validate structure, frontmatter, and shape (see [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md)).
3. **Simplified Chinese mirror** → create or update the corresponding `skill0-cn/<bucket>/<slug>/SKILL.md`. File path must mirror `skill0/` exactly.
4. **HK Traditional mirror** → regenerated; see next section.

Never edit `skill0-cn-hk/` by hand — your changes will be lost on the next regeneration.

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

If `zhhz` is missing, install via `x eget ljh-sh/zhhz`. The use case this script encodes is also filed upstream as [ljh-sh/zhhz#70](https://github.com/ljh-sh/zhhz/issues/70).

## Translation conventions

- Keep the same heading hierarchy and frontmatter shape as the `skill0/` original.
- Preserve code spans, link targets, and `x <mod>` invocations verbatim — never localize command names or paths.
- Translate description: in frontmatter; keep it under ~300 characters so the catalog row stays readable.

## See also

- [README.md](README.md) — repo philosophy and entry points.
- [skill0/SKILL.md](skill0/SKILL.md) — the canonical root skill.
- [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md) — conventions every SKILL.md must satisfy.
- [x-cmd llms.txt](https://www.x-cmd.com/llms.txt) — wider x-cmd ecosystem.