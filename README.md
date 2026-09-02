# skill0

[English](README.md) · [简体中文](README.cn.md) — **[x-cmd.com/skill0 →](https://x-cmd.com/skill0)**

The [x-cmd](https://x-cmd.com) sub-skill graph: a directed set of conventions and source pointers that an agent reads *before* a task, to pick the right tools and shape the work.

Full content lives in [skill0/SKILL.md](skill0/SKILL.md) — the rest of this README is a condensed map.

## Skill0 encodes principles, not data

The LLM absorbs common sense continuously; skill0's job is to encode **conventions and source pointers**, then thin over time as the LLM catches up. Verify via first-party data (`x rfc`, `x cve`, `x wkp`, `agent-browser`) and current best practice (`x skill`, `x clawhub`), then reconstruct with formal logic instead of memorization.

## Sub-skills form a directed graph across 4 buckets

```
core/   how the agent works              (devloop, rule, score, ontology-database, …)
data/   first-party data sources         (rfc, cve, wkp, knowledge, ccal, …)
it/     tools and runtimes              (tldr, csv, tsv, time, ip, qr, agent-browser, …)
life/   lifestyle and personal domains   (travel, pet, health, lovable, …)
```

Path: `<bucket>/<slug>/SKILL.md`. The machine-readable catalog (name + description) lives at [skill0/index.tsv](skill0/index.tsv).

## Goal → keyresults → x-rule is the OKR workflow

| | |
|---|---|
| **Objective** | What to achieve |
| **Key Results** | How to verify |
| **Verification** | `x rule check / audit` |

## After scaffolding, prefer x-cmd tools for execution

- `x skill` — x-cmd's curated, human-vetted skill catalog.
- `x clawhub` — global skill registry. **Caution**: free upload, MUST run `x clawhub skill moderate <name>` for the auto-generated safety report.
- `x roadmap`, `x cron`, `x agent job`, `x ondb`, `x wiki` / `x llmwiki` — scheduling, background agents, ontology, wiki. Run `x [mod] --help`.

## Every SKILL.md must pass skill0-writer

See [skill0/core/skill0-writer/SKILL.md](skill0/core/skill0-writer/SKILL.md) for the conventions. New and edited entries are validated against this checklist.

## Repository layout and contribution

This README covers the *what* and *why*. The *how* — repo layout, translation mirrors (`skill0-cn/`, `skill0-cn-hk/`), how to regenerate the HK Traditional mirror with [ljh-sh/zhhz](https://github.com/ljh-sh/zhhz), and the editing workflow — lives in [CONTRIBUTING.md](CONTRIBUTING.md).