# Interview Notes

## Why not guarantee both orders execute?

Exchange order books are dynamic. By the time an order reaches the venue, available liquidity may be gone or the gateway can reject/expire the order. The correct design assumes one leg can fill and the other can fail.

## Why IOC limit orders?

IOC attempts immediate execution and cancels the remainder. Limit price caps the worst acceptable price. This is safer to model than a market order.

## What is legging risk?

Legging risk is the risk that only one side of a paired trade executes, leaving long or short inventory. In this codebase, `PairTrade::residual()` equals `bought_qty - sold_qty`.

## Why integer paise?

Money calculations should be deterministic and avoid floating point rounding errors.

## What makes this HFT-like?

Order book reconstruction, low-latency C++ hot path, risk controls, OMS state machine, deterministic replay, latency measurements, and failure playbooks.
