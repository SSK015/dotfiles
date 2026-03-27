# Repo Guidance for Codex

This file condenses the migrated Cursor rules into a Codex-oriented entry point for this repository.

## Core constraints

- Treat `project_config.md` as the authoritative contract before debugging or code changes.
- Preserve ownership, state-machine, synchronization, and safety invariants.
- Do not widen feature scope implicitly. For feature work, confirm the exact change surface first.
- Do not claim success without fresh verification evidence.

## Workflow routing

- Bug, regression, or unexpected behavior:
  use `.codex/skills/systematic-debugging/`
- Before claiming done/fixed/passing:
  use `.codex/skills/verification-before-completion/`
- Long-running or memory-heavy work:
  consult `.codex/rules/openmemory-skill.md` and `.codex/rules/experience-capture.md`
- Larger planning tasks:
  consult `.codex/rules/system-plan.md`
- Dossier/bootstrap tasks:
  consult `.codex/rules/system-init.md`

## Repo artifacts to consult

- `PROJECT_DOSSIER.md` when present
- `plan/` for saved implementation plans
- `workflow_state.md` for ongoing task state
- `.codex/knowledge/debug_dev_experience.md` for prior debugging lessons

## Detailed migrated rules

- `.codex/rules/assumption-guard.md`
- `.codex/rules/autonomy.md`
- `.codex/rules/experience-capture.md`
- `.codex/rules/openmemory-skill.md`
- `.codex/rules/skill-routing.md`
- `.codex/rules/system-debug-with-execution.md`
- `.codex/rules/system-debug-without-execution.md`
- `.codex/rules/system-init.md`
- `.codex/rules/system-plan.md`
