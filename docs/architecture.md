# Architecture

The simulator is split into a hot path and a cold path.

## Hot path

```text
Replay/packet source -> MarketDataHandler -> BookManager -> ArbitrageStrategy -> RiskEngine -> OrderManager -> MatchingEngine -> PairTrade/HedgePolicy
```

The hot path uses in-memory C++ objects. No database calls, blocking dashboards, or heavyweight logging are required for a decision.

## Cold path

CSV outputs and SQL schemas are provided for analytics:

- `opportunities.csv`
- `orders.csv`
- `fills.csv`
- `risk_events.csv`
- `latency.csv`
- `scenario_report.csv`

## Key design decisions

1. Use integer paise for money.
2. Use bid/ask, not last traded price.
3. Treat two-leg arbitrage as a paired trade, never independent orders.
4. Assume one leg can fail; hedge the residual from actual fills.
5. Log every block reason with a rule ID.
6. Start with deterministic replay before any live connectivity.
