# Latency and Performance Notes

Beginner targets from the guide:

| Stage | Good portfolio target |
|---|---:|
| Packet receive + decode | 3-8 us p99 |
| Book update + normalization | 3-8 us p99 |
| Signal computation | 2-6 us p99 |
| Risk + serialization | 3-10 us p99 |
| Wire-to-decision total | 15-30 us p99 |
| Decision-to-send | 25-50 us p99 |

This codebase includes `StageTimer` and `LatencyRecorder`. Run `bench_pipeline` after building.

Later tuning checklist:

- pin hot threads to isolated cores
- keep NIC interrupts away from strategy cores
- disable deep power-saving states during benchmark runs
- compare p50, p99, and p99.9, not only average
- avoid heap allocation in the hot loop after correctness is proven
- keep dashboards, databases, and reports outside the hot path
