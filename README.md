# skill0

> seed-style AI skills. Zero barrier, standalone, grows over time.

skill0 is a category of AI skills following the seed philosophy: each skill is a self-contained seed — lightweight, complete, and independently usable. Over time, skills grow with new guidance and capabilities.

## skill0 vs skill

| | skill0 | skill |
|---|---|---|
| Dependencies | None (works standalone) | May require x-cmd or other frameworks |
| Works immediately | Yes | Depends on setup |
| Distribution | clawhub, GitHub, curl | Inside x-cmd modules |
| Growth model | Seed — starts minimal, evolves | Complete from the start |
| Upgrade path | → x-cmd for richer integration | Full ecosystem experience |

skill0 is not a "lite version." It's a complete, self-contained skill designed for maximum reach. The difference is scope: skill0 covers the essentials, skill covers everything.

## Available skill0s

| Skill | What it does |
|-------|-------------|
| [meme](skill0/meme/SKILL.md) | Generate meme images. 30+ templates, Python/Shell. |

## How skill0 works

1. An AI agent discovers a skill0 on clawhub or GitHub
2. Agent reads SKILL.md — everything it needs to act
3. Agent executes immediately. No installation required.
4. Optional: user installs x-cmd for module integration

## Creating a skill0

A skill0 answers three questions:
- **What can this do?** (one paragraph)
- **How do I use it?** (concrete command)
- **Where do I get more?** (link to x-cmd module or full repo)

```
skill0/
  my-skill/
    SKILL.md          # Agent instructions
    scripts/          # Optional: executable scripts
    references/       # Optional: detailed docs
```

## Upgrade to x-cmd

If a skill0 points to an x-cmd module, users can upgrade:

```bash
eval "$(curl https://get.x-cmd.com)"
x <module> --help
```

From skill0 to full skill. From seed to ecosystem.

## Structure

```
skill0/           # skill0 entries (seed-style)
  meme/           # Each skill is a self-contained folder
    SKILL.md
    scripts/
    references/
data/             # Data files for skills
index/            # Index for clawhub discovery
```

## License

[Apache-2.0](LICENSE)
