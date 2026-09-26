# 🐍 my-python-template

![Python](https://img.shields.io/badge/python-3.13%2B-3776AB?logo=python&logoColor=white)
![uv](https://img.shields.io/badge/uv-managed-DE5FE9?logo=uv&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)

A minimal Python project template: `src/` and `tests/`, managed by uv, linted by ruff and mypy,
tested with pytest. No web framework, no database. Start here for scripts, CLIs and libraries;
for an API, use [my-fastapi-template](https://github.com/zjohnsilver/my-fastapi-template).

## 📁 Layout

```
src/
  main.py            # entry point, run by `make local/start`
  core/
    core_config.py   # settings, read from the environment (.env in development)
tests/               # mirrors src/, one folder per package
  test_main.py
  core/
    test_core_config.py
```

`src/` and `tests/` are both on the import path (`pythonpath` in `pyproject.toml`), so code
imports `from core.core_config import load_config`, never `from src.core...`.

## ✅ Requirements

- Python 3.12+
- [uv](https://docs.astral.sh/uv/)

## 🚀 Setup

```bash
make local/setup   # copies env.example to .env, uv sync, installs the pre-commit hook
make local/start
```

> Note: the example env file ships as `env.example` (no leading dot), not the more common
> `.env.example`. Rename it if you prefer that convention. Nothing depends on the dot.

## 🛠️ Commands

| Command | What it does |
| --- | --- |
| `make local/setup` | Creates `.env`, runs `uv sync`, installs the pre-commit hook |
| `make local/start` | Runs `src/main.py` |
| `make tests` | Runs pytest |
| `make lint/check` / `lint/format` | ruff + mypy |
| `make lint/pre-commit` | Runs the configured pre-commit hooks |

## 🧩 Using the template

1. Rename the project in `pyproject.toml` (`name`, `description`) and in `APP_NAME`.
2. Add packages under `src/` and list each one in `[tool.hatch.build.targets.wheel] packages`.
3. Add dependencies with `uv add <package>` (dev tools with `uv add --dev <package>`).
