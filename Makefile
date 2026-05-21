.PHONY: configure build test demo scenarios bench clean

configure:
	cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

build: configure
	cmake --build build

test: build
	ctest --test-dir build --output-on-failure

demo: test
	./build/hft_demo --instruments config/instruments.csv --costs config/costs.yml --risk config/risk.yml --replay data/sample_day.csv --out data/out --scenario clean
	python3 tools/report_pnl.py data/out/fills.csv data/out/pnl_summary.csv

scenarios: build
	./build/scenario_suite --out data/out/scenario_report.csv
	python3 tools/scenario_report.py data/out/scenario_report.csv data/out/scenario_report.md

bench: build
	./build/bench_pipeline

clean:
	rm -rf build data/out
