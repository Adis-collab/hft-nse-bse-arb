# Codebase Index

This repository is organized to match the Excel guide's components and tracker.

## Start here

| Need | File |
|---|---|
| Build and run | `README.md`, `scripts/run_demo.sh` |
| Coding tracker | `docs/development_index.md` |
| System design | `docs/architecture.md` |
| Component-by-component guide | `docs/component_walkthrough.md` |
| Failure scenarios | `docs/scenarios.md`, `apps/scenario_suite.cpp` |
| Interview prep | `docs/interview_notes.md` |

## Main executables

| Executable | Purpose |
|---|---|
| `hft_demo` | Runs replay -> strategy -> risk -> OMS -> simulator -> CSV logs |
| `scenario_suite` | Runs 20 scenario playbook checks |
| `bench_pipeline` | Measures basic book/strategy latency stages |
| `hft_tests` | Runs custom C++ unit/integration tests |

## Core folders

| Folder | Component |
|---|---|
| `src/md` | Market data replay, parser, sequence tracking, feed health |
| `src/book` | Order book and multi-venue book manager |
| `src/strategy` | Cost model and arbitrage signal generation |
| `src/risk` | Pre-trade risk, position book, kill switch, guards |
| `src/oms` | Order intents, states, fills, gateway interface, reconciliation |
| `src/hedge` | PairTrade state machine and residual hedge policy |
| `src/sim` | Matching engine, failure scenarios, replay simulator |
| `src/metrics` | Latency recorder and stage timer |
| `tests` | Unit and integration tests |
| `tools` | Python CSV reports |
