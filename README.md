# NSE/BSE Equity Arbitrage HFT Portfolio Project

Educational, exchange-shaped C++20 simulator for NSE-vs-BSE cash-equity cross-venue arbitrage.

This repository is **not a live trading system** and does not connect to NSE/BSE production gateways. It is a portfolio-grade research and simulation codebase that mirrors the components a fresher HFT candidate should understand:

- market data replay and normalization
- sequence gap/duplicate detection
- deterministic order book reconstruction
- cross-venue arbitrage signal generation
- configurable costs, buffers, and risk checks
- OMS state machine with ACK/fill/reject/expire handling
- legging-risk recovery and hedge policy
- matching simulator with reject, partial-fill, disconnect, and delayed-ACK scenarios
- latency measurement and CSV reports
- scenario playbooks aligned to the Excel development guide

## Quick start

```bash
sudo apt-get update
sudo apt-get install -y cmake ninja-build g++ python3

cd hft-nse-bse-arb
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build
ctest --test-dir build --output-on-failure

./build/hft_demo \
  --instruments config/instruments.csv \
  --costs config/costs.yml \
  --risk config/risk.yml \
  --replay data/sample_day.csv \
  --out data/out \
  --scenario clean

./build/scenario_suite --out data/out/scenario_report.csv
python3 tools/report_pnl.py data/out/fills.csv data/out/pnl_summary.csv
python3 tools/scenario_report.py data/out/scenario_report.csv data/out/scenario_report.md
```

Or run:

```bash
bash scripts/run_demo.sh
bash scripts/run_all_scenarios.sh
```

## What to show in interviews

1. `src/book/order_book.*` - deterministic book reconstruction.
2. `src/strategy/arbitrage_strategy.*` - net-edge calculation using bid/ask, not LTP.
3. `src/risk/risk_engine.*` - pre-trade controls with rule IDs.
4. `src/hedge/hedge_policy.*` - handling BSE-buy-filled / NSE-sell-failed and the reverse.
5. `src/sim/matching_engine.*` - venue-aware IOC limit matching, partial fills, rejects, delayed ACK.
6. `tests/test_main.cpp` - unit, integration, and failure scenario tests.
7. `docs/development_index.md` - the coding tracker mapped from the Excel guide.

## Project boundary

The code intentionally avoids direct exchange connectivity. Before any real trading, validate current NSE/BSE/SEBI rules, broker access, exchange conformance requirements, costs, taxes, short-selling/settlement constraints, co-location, and clearing arrangements.

## Included example outputs

A previously generated sample run is included under `data/example_out/`. Fresh runs write to `data/out/`.
