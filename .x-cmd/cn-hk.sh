#!/usr/bin/env bash
# Translate skill0-cn/ (Simplified Chinese) -> skill0-cn-hk/ (HK Traditional)
# using zhhz (https://github.com/ljh-sh/zhhz) with --from cn-s --to cn-hk.
#
# Pattern: mirror skill0-cn/ -> skill0-cn-hk/ with `cp -a`, then let zhhz
# convert the mirror in place via --files-from. skill0-cn/ stays untouched,
# so the script is fully repeatable — re-run after editing skill0-cn/ to
# refresh skill0-cn-hk/.
#
# Usage:  ./.x-cmd/cn-hk.sh                 # translate every skill0-cn/* -> skill0-cn-hk/*
#         ./.x-cmd/cn-hk.sh --check         # list files that would be translated

set -eu

# Resolve repo root from this script's location.
script_dir=$(cd "$(dirname "$0")" && pwd)
repo_root=$(cd "$script_dir/.." && pwd)

src_root="$repo_root/skill0-cn"
dst_root="$repo_root/skill0-cn-hk"

# Locate zhhz. Prefer PATH, fall back to eget snap.
zhhz_bin=${ZHHZ:-}
if [ -z "$zhhz_bin" ] || ! command -v "$zhhz_bin" >/dev/null 2>&1; then
    if command -v zhhz >/dev/null 2>&1; then
        zhhz_bin=$(command -v zhhz)
    elif [ -x "$HOME/.x-cmd.root/local/data/eget/snap/ljh-sh--zhhz/v0.7.7/bin/zhhz" ]; then
        zhhz_bin="$HOME/.x-cmd.root/local/data/eget/snap/ljh-sh--zhhz/v0.7.7/bin/zhhz"
    else
        printf 'zhhz not found. Install via: x eget ljh-sh/zhhz\n' >&2
        exit 127
    fi
fi

if [ ! -d "$src_root" ]; then
    printf 'source tree not found: %s\n' "$src_root" >&2
    exit 1
fi

if [ "${1:-}" = "--check" ] || [ "${1:-}" = "-n" ]; then
    # Dry-run: list files that would be translated (relative to src_root).
    find "$src_root" -type f | sed "s|^$src_root/||"
    exit 0
fi

# 1. Mirror skill0-cn/ -> skill0-cn-hk/ (preserves attributes; wipes stale mirror).
rm -rf "$dst_root"
cp -a "$src_root" "$dst_root"

# 2. Stream the file list into zhhz; zhhz converts each file in place.
find "$dst_root" -type f | "$zhhz_bin" --from cn-s --to cn-hk --in-place --files-from -