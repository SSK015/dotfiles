---
description: Always-on guardrail for system assumptions and architecture constraints.
globs: **/*
alwaysApply: true
---

# Assumption Guard (Always On)

You must treat `project_config.md` as the authoritative contract for this repository.

## Required Behavior

1. Before debug or code changes:
   - Read `project_config.md`.
   - Identify which assumptions are relevant to the current task.

2. During implementation:
   - Preserve all listed hard constraints.
   - Reject approaches that relax core invariants, ownership rules, synchronization rules, or safety constraints.
   - **Before introducing any new feature in any location, explicitly confirm with the user what will be changed in that location and wait for approval before applying the change.**
   - For each proposed feature change, provide a scoped list: target file/function, exact behavior delta, and what will intentionally remain unchanged.

3. During verification:
   - Confirm the bug fix does not violate assumptions.
   - Report evidence tied to assumptions (logs, assertions, counters, passing commands).

4. Completion gating:
   - Do not mark a task as fixed or write `DONE` unless assumption checks pass.

## Forbidden Patterns

- Asking to loosen memory pressure thresholds as a workaround.
- Bypassing state-machine transitions with direct state mutation.
- Ignoring ownership boundaries between mutator-private and global regions.
- Introducing fallback behavior that masks correctness faults.
- Introducing new feature behavior without prior user confirmation of the exact change scope.
- Treating `update_scope` broadening/injection as a permanent fix for epoch-migration stalls. It is allowed only as temporary validation instrumentation; root fixes must address the true starvation/no-progress cause.

## Mandatory Output Section (for substantial debug tasks)

Include an "Assumption Audit" in progress/final updates:
- Assumptions Checked
- Potential Violation (must be explicit)
- Evidence
- Decision

## Change Control

If the user explicitly requests changing assumptions:
- Update `project_config.md` version and changelog.
- Explain tradeoffs and affected subsystems.
- Keep this rule file aligned with the updated policy.
