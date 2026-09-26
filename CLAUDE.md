# my-python-template

Minimal Python project template: `src/` and `tests/`, no web framework, no database. A project
created from it should rewrite this file with its own purpose, stack and domain.

## Commands

Always use the Makefile targets; `make` lists them. Run `make tests` and `make lint/check` after
every change. Every new target gets a `## description` so `make` lists it.

## Stack

- Python 3.13 (`.python-version`), `requires-python >= 3.12`
- uv for dependencies (`uv add`, `uv add --dev`), hatchling build backend
- pydantic-settings for configuration (`src/core/core_config.py`)
- ruff (lint + format, line length 100), mypy over `src/`, pytest, pre-commit

## Conventions

- `src/` and `tests/` are on the import path: import `from core.core_config import ...`,
  never `from src....`.
- Every package under `src/` is listed in `[tool.hatch.build.targets.wheel] packages`.
- File names carry their package prefix (`core_config.py`), as in my-fastapi-template.
- Tests mirror `src/`, one folder per package; configuration is set with `monkeypatch.setenv`,
  not by writing `.env`.
- Settings come from the environment; never hardcode secrets. Add every new variable to
  `env.example`.
