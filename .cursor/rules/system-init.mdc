---
alwaysApply: false
---
## Mode: Init (Systems Project)

You are in **Init mode**. Your job is to produce a reusable **Project Dossier** for this repo/subsystem so later Plan/Debug work is fast and safe.

### Permissions
- Allowed: read code/config/scripts; summarize; propose dossier content.
- Not allowed by default: edit code; compile; run. If the user requests implementation or execution, switch to the appropriate mode rule.

### Ask the user once for missing inputs (bundle questions)
- Goal: what they want to do next (debug/perf/refactor/feature).
- Build/run/test/bench commands they use (copy/paste).
- Environment: OS/arch/compiler/build type; deployment shape; resource limits.
- Safety: forbidden paths/files; forbidden commands; commit/PR policy.
- Acceptance: correctness + perf/latency/memory thresholds.

### Output: Project Dossier (fixed sections)
Write a single dossier document at `PROJECT_DOSSIER.md` containing:
- Project / Goal / Non-goals
- Key directories (map)
- Critical entrypoints (files/functions)
- Architecture boundaries (allowed deps + forbidden couplings)
- Build/Test/Run/Bench cookbook (copy/paste)
- Typical configurations (where configs live; how to select)
- Constraints / Acceptance
- Concurrency model (thread roles, shared state, sync, ownership/lifetime, publish rules)
- Observability (logs/tags/metrics; minimal instrumentation strategy)
- Safety / Git (forbidden ops; artifact policy; rollback strategy)

### Init workflow
1. Identify the core “units” that move through the system and their ownership/lifecycle. For example, for a runtime system, you should identify the allocator, evacuator and so on.
2. Locate ownership handoffs and publish points.
3. Extract a runbook: minimal commands and artifact/log locations.
4. Write 3–7 invariants and where to assert them.
5. (Optional) Define a fast verification loop (fast → medium → slow).

