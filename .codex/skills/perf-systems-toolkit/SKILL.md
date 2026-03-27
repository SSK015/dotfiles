---
name: perf-systems-toolkit
description: Use when profiling Linux C/C++ runtime, memory-management paths, and far-memory experiments with perf.
---

# perf Systems Toolkit

## When to Use

- Profiling C/C++ runtime latency and throughput regressions
- Finding CPU hotspots in allocators, paging paths, and schedulers
- Comparing baseline vs optimized runtime behavior
- Validating that an optimization actually moved bottlenecks

## Workflow

1. Build with symbols and frame pointers (`-g -fno-omit-frame-pointer`).
2. Capture baseline with representative workload.
3. Record perf data and inspect top symbols.
4. Use call graphs/flame graph style views to locate root hotspots.
5. Re-run after change and compare.

## Quick Commands

```bash
# 1) System-wide snapshot (quick triage)
perf top

# 2) Record workload with call graph
perf record -F 999 -g -- ./your_benchmark --your-flags

# 3) Report hottest stacks
perf report

# 4) Stat counters for macro comparison
perf stat -d -d -d ./your_benchmark --your-flags

# 5) Compare two runs
perf diff baseline.data optimized.data
```

## Far-Memory Notes

- Pin workload and threads before comparing runs (CPU affinity).
- Keep input dataset and remote-memory pressure stable across runs.
- Track p50/p99 latency together with CPU counters.
- Always collect one clean baseline before tuning.

## Verification Checklist

- Same binary/build flags across compared runs
- Same dataset and runtime configuration
- Same CPU affinity and machine load conditions
- At least one repeated run to avoid noise-driven conclusions
