.PHONY: help local/setup local/start tests lint/check lint/format lint/pre-commit

.DEFAULT_GOAL := help

help: ## List every command
	@awk 'BEGIN {FS = ":.*## "} /^[a-zA-Z0-9_\/-]+:.*## / {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(firstword $(MAKEFILE_LIST))

local/setup: ## Create .env from env.example, install dependencies and the pre-commit hook
	test -f .env || cp env.example .env
	uv sync
	uv run pre-commit install

local/start: ## Run src/main.py
	uv run python src/main.py

# ── TESTS ────────────────────────────────────────────────────────────────

tests: ## Run the test suite
	uv run pytest tests/ -v

# ── LINT ─────────────────────────────────────────────────────────────────

lint/check: ## Report lint, format and type violations without writing
	uv run ruff check src/ tests/
	uv run ruff format --check src/ tests/
	uv run mypy

lint/format: ## Sort imports and format the code with ruff
	uv run ruff check --select I --fix src/ tests/
	uv run ruff format src/ tests/

lint/pre-commit: ## Run every pre-commit hook over the tree (hook=<id> for one)
	uv run pre-commit run --all-files $(if $(hook),$(hook),)
