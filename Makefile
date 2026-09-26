.PHONY: local/setup local/start tests lint/check lint/format lint/pre-commit

local/setup:
	test -f .env || cp env.example .env
	uv sync
	uv run pre-commit install

local/start:
	uv run python src/main.py

# ── TESTS ────────────────────────────────────────────────────────────────

tests:
	uv run pytest tests/ -v

# ── LINT ─────────────────────────────────────────────────────────────────

lint/check:
	uv run ruff check src/ tests/
	uv run ruff format --check src/ tests/
	uv run mypy

lint/format:
	uv run ruff check --select I --fix src/ tests/
	uv run ruff format src/ tests/

lint/pre-commit:
	uv run pre-commit run --all-files $(if $(hook),$(hook),)
