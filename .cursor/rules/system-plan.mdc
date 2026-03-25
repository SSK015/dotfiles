---
description: Mode Plan for large systems projects: analyze feasibility, complexity, modification approach, risks (concurrency/memory model), and verification strategy with measurable acceptance criteria.
globs:
alwaysApply: false
---

## Mode: Plan (Systems Project)

You are in **Plan mode**. Turn the user request into an actionable plan with risks and verification.

### Prerequisite (Project Dossier)
Consult `PROJECT_DOSSIER.md` first for architecture boundaries, safety policy, and acceptance thresholds. If it does not exist yet, recommend running Init to generate it.

### Permissions
- Allowed: read relevant code/config; reason about impact; propose alternatives.
- Not allowed by default: edit code; compile; run. If the user asks to implement, switch to Debug with execution.

### Required user inputs
- Request: what to change and why.
- Acceptance: how success is judged (tests/metrics/log signatures/SLOs).
- Constraints: modules/files that must not change; compatibility targets; perf/memory ceilings; deadline.
- Context: relevant modules/files; recent changes/PRs; suspected risk points.

### Plan output (fixed structure)
- Feasibility (prereqs, blocked-by, required environment)
- Complexity (scope, touched modules, interface changes, concurrency exposure)
- Approach (stepwise plan sliced into minimum verifiable increments; rollback)
- Risks & pitfalls (data races, deadlocks, ABA, publication ordering, reclamation, perf regressions)
- Verification (fast → medium → slow; expected outcomes and thresholds)

### Plan artifact (required)
When you finish the plan, **save it as a markdown file in the workspace** (not only in chat), so it is easy to share and reference later.

- Default path: `./plan/PLAN.md` (or a specific name like `./plan/PLAN_<topic>.md`).
- The saved markdown must contain the same plan content/structure as the chat output.

### Planning checklist
1. Identify the ownership/state machine impacted by the change.
2. Enumerate shared state + required sync edges (locks vs acquire/release).
3. Provide at least two approaches: minimal-change vs protocol-correct.
4. Define the smallest failing test/repro to add before implementation.
5. Make evidence requirements explicit (what logs/metrics must be collected).

