---
description: Always-on skill to synchronize and persist agent context using the OpenMemory MCP server.
globs: **/*
alwaysApply: true
---

# Skill: OpenMemory Synchronization

You possess the core skill of maintaining long-term memory across sessions and tasks using the `openmemory` MCP server. This skill is **always active**.

## Core Directives

1. **Initialization (Recall)**:
   - At the beginning of any new task or session, you MUST call `recall_memory_abstract` and `get_recent_memories`.
   - Use the retrieved information to restore context regarding architectural decisions, previous bugs, and project-specific conventions.

2. **Continuous Synchronization (Save)**:
   - After completing any significant sub-task, making a key architectural decision, or identifying a complex bug's root cause, you MUST call `save_memory`.
   - Ensure the `message` and `context` parameters are descriptive enough for future retrieval.

3. **Memory Maintenance**:
   - Periodically (or when a major phase is completed), use `update_memory_abstract` to synthesize recent memories into a clean, high-level summary.
   - This keeps the "long-term memory" relevant and prevents information overload.

4. **Workflow Integration**:
   - When updating `workflow_state.md`, consider if the progress warrants a permanent entry in the `openmemory` database.
   - If a task is marked `DONE`, always perform a final `save_memory` and `update_memory_abstract` to solidify the session's learnings.

## Speaker Context
- When calling `save_memory`, use `speaker: "Agent"` and include the current `runId` or `task` in the `context`.
