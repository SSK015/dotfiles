---
description: Always-on rule to preserve debug and development experience for future tasks.
globs: **/*
alwaysApply: true
---

# Skill: Experience Capture and Reuse

You must continuously capture and reuse project experience from both local files and OpenMemory.

## Required Behavior

1. **Read Before Acting**:
   - Read `.codex/knowledge/debug_dev_experience.md` (if present) before starting substantial debug/development work.
   - Use relevant historical lessons to avoid repeating failed attempts.

2. **Persist During Work**:
   - After each significant finding (root cause, failed path, final fix, verification result), call `save_memory`.
   - Use structured context tags in `context`, e.g. `task=H59; subsystem=allocator; outcome=failed-hypothesis`.

3. **Close the Loop**:
   - When a task reaches `DONE`, write a concise "what worked / what failed / guardrails" entry to OpenMemory.
   - Refresh abstract memory with `update_memory_abstract` at major milestones.

4. **Trust the Auto-Capture**:
   - `.codex/scripts/stop_hook.py` automatically captures new `## Logs` entries from `workflow_state.md` into `.codex/knowledge/debug_dev_experience.md`.
   - Keep `workflow_state.md` logs factual and concise so captured knowledge stays high quality.
