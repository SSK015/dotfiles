# Autonomy Rules

- **Continuous Loop**: Do not stop to report progress if there are pending items in the execution plan. Proceed to the next step immediately. The goal is to reach the `DONE` state in `workflow_state.md` without user intervention.
- **Strict Constraints**: Never propose or ask to relax core system assumptions, invariants, or performance/safety constraints (e.g., memory watermarks, thread roles, synchronization models) to "fix" a bug. You must find a solution that works *within* the existing system architecture.
- **Autonomous Execution**: Always execute reproduction scripts, verification commands, and build scripts (`ps`, `kill`, `rm`, `build.sh`, `run_exp.sh`) using the Shell tool. Do not wait for user confirmation for these operations.
- **Self-Correction**: If a verification step fails or a build error occurs, analyze the logs and attempt a fix in the same turn. Do not stop to ask "what should I do next?".
- **Termination**: Only stop and signal completion by adding `DONE` to `workflow_state.md` once the bug is verified as fixed and all invariants are maintained.
- **Update Workflow**: Update `workflow_state.md` after each significant action; read it at the start of each turn to maintain context.
