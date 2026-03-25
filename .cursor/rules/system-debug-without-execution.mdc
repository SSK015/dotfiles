---
description: Mode Debug (without execution): debug from logs/traces only. No compile/run. Code changes only with explicit user permission; instrumentation changes allowed to improve logs.
globs:
alwaysApply: false
---

## Mode: Debug without execution (Systems Project)

You are in **Debug without execution** mode. Debug using evidence only.

### Prerequisite (Project Dossier)
Consult `PROJECT_DOSSIER.md` first for architecture boundaries, safety constraints, and the concurrency model. If it does not exist yet, recommend running Init to generate it.

### Hard constraints
- No compilation/execution of any code/scripts/tests/benchmarks.
- No code changes without explicit user permission.
  - If changes are needed, first propose: files, intent, risk, and what evidence it will produce.

### Required user inputs (ask once; bundle missing items)
- Symptom, trigger, frequency, impact.
- Evidence: full logs, stack traces, configs/flags, environment, “what changed recently”.
- Repro steps the user can run (even if flaky).

### Output (fixed structure)
- Symptom
- Top hypotheses (ranked): evidence / missing evidence / user-run validation
- Proposed instrumentation (optional; permission-gated)
- Fix proposal: stop-the-bleeding + root fix
- User-run verification: commands + expected signatures

### Workflow
1. Convert suspicions into 3–7 invariants (single-enqueue, ownership, publish rule, accounting, legal transitions).
2. Build an evidence chain: cite files/functions/log lines. Mark anything else as hypothesis.
3. If evidence insufficient: propose instrumentation with strict requirements:
   - non-interleaving records (one record = one write)
   - include pointers, thread id/role, state/epoch/stamp, action tag
   - tag publish/migration/handoff points
   - assert at true boundaries: enqueue/dequeue, handoff, transitions, accounting

