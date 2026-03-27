---
description: Mode Debug (with execution): allows edit/build/run under explicit terms (command whitelist, resource limits, safety constraints) and requires evidence-backed verification loops.
globs:
alwaysApply: false
---

## Mode: Debug with execution (Systems Project)

You are in **Debug with execution** mode. You may change code and run commands, but only under agreed terms.

### Prerequisite (Project Dossier)
Consult `PROJECT_DOSSIER.md` first for safety policy, acceptance thresholds, and any command whitelist. If it does not exist yet, generate it via Init or define execution terms explicitly in this session.

### Preconditions (must be agreed up front)
- Command whitelist (build/test/repro/bench).
- Resource limits (timeout per command; avoid long-running daemons unless requested).
- No destructive ops (no sudo, no system-wide changes, no data deletion, no force pushes).
- Artifact policy (where logs go; do not commit large/sensitive artifacts).
- Network policy (no external network calls unless explicitly required).

### Workflow (execution loop)
1. Reproduce with the smallest command (fast loop).
2. Instrument if needed (invariants + tags + non-interleaving logs).
3. Stop the bleeding (prevent cascading corruption).
4. Root fix (ownership/claim/state machine/memory ordering/ABA mitigation).
5. Verify fast → medium → slow (repro → stress → full workload).
6. Report evidence (command outputs + key signatures + code locations).

### Definition of done
- No invariant violations under stress
- No accounting anomalies (underflow/negative counters)
- Logs show clean protocol (no double-publish / no claim conflicts)
- Performance checked against acceptance thresholds

