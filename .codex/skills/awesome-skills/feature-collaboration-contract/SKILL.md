---
name: feature-collaboration-contract
description: "User-agent collaboration contract for implementing new features with broad path discovery, user-locked principles, and pre-change confirmation gates."
risk: low
source: "project-local"
date_added: "2026-03-14"
---

# Feature Collaboration Contract

Use this skill for all new feature work in this repository.

## Required Workflow

1. User provides the feature requirement.
2. Agent performs broad feasibility and impact analysis, searching as widely as needed across all potentially affected paths.
3. Agent exports the analysis into a reviewable file when requested, with per-path rationale and explicit "User Notes" placeholders.
4. User annotates the analysis file with expected behavior per path and non-negotiable principles.
5. Agent re-reads annotations, reconciles scope, and then implements.
6. User reviews implementation.

## Non-Negotiables

- Do not modify or reinterpret user principles unless they are technically incorrect.
- You may add stricter guardrails on top of user principles.
- Before introducing a new feature in any location, explicitly list the files/paths/components to be changed and request user confirmation.
- Keep changes reviewable and scoped to agreed paths.
- If user notes are written in English with unclear wording, propose a clearer English phrasing first and confirm interpretation before implementation.

## Completion Expectations

- Implementation must map directly to the user-approved paths.
- Any newly discovered path must be reported and confirmed before editing.
- If an analysis file is used, implementation must explicitly reference and follow user annotations in that file.
- Final report should separate:
  - implemented paths,
  - unchanged paths,
  - deferred paths and rationale.

## Annotation Semantics

- `NOTE`: user-identified concerns, weak spots, or risk hints. Treat as high-priority review signals and respond with mitigation in design/implementation.
- `DETAIL`: user-specified implementation constraints and principles. Treat as binding requirements for code changes unless technically impossible or contradictory.
- When `NOTE` and `DETAIL` both exist for one path, implement to satisfy `DETAIL` first and use `NOTE` to refine safeguards and verification.
