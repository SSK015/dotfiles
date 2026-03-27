# Codex Adaptation

This directory is the Codex-side adaptation of the existing `.cursor` workspace metadata.

## What was migrated

- `skills/`: copied from `.cursor/skills/`
- `rules/`: converted from `.cursor/rules/*.mdc` to Markdown under `.codex/rules/`
- `scripts/stop_hook.py`: copied and path-adjusted for `.codex/`
- `knowledge/debug_dev_experience.md`: copied from `.cursor/knowledge/`

## What was intentionally not migrated

- `.cursor/debug.log`
- transient lock/state files such as `.experience_seen.json` and `.single_session_lock.json`

## Recommended entry points

- Read `.codex/AGENTS.md` first for the condensed Codex workflow.
- Use `.codex/rules/` when you want the fuller rule text from the Cursor setup.
- Use `.codex/skills/` as the local skill catalog for repo-specific prompting/reference.

## Note

Per your request, this adaptation stays entirely under `.codex/`. If you later want Codex to auto-load repo instructions more directly, the next step would be promoting the relevant parts into a root-level `AGENTS.md`.
