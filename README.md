<h1 align="center">🐍 my-python-template</h1>

<p align="center">
  <em>A minimal Python project: <code>src/</code> and <code>tests/</code>, no web framework, no database.</em>
  <br>
  <em>Start here for scripts, CLIs and libraries; for an API, use my-fastapi-template.</em>
</p>

<p align="center">
  <img alt="Python" src="https://img.shields.io/badge/Python-3.13-3776AB?logo=python&logoColor=white">
  <img alt="uv"     src="https://img.shields.io/badge/uv-managed-DE5FE9?logo=uv&logoColor=white">
  <img alt="Ruff"   src="https://img.shields.io/badge/Ruff-lint%20%2B%20format-D7FF64?logo=ruff&logoColor=black">
  <img alt="pytest" src="https://img.shields.io/badge/pytest-9-0A9EDC?logo=pytest&logoColor=white">
  <img alt="License" src="https://img.shields.io/badge/license-MIT-green">
</p>

## 📦 Dependencies

- [uv](https://docs.astral.sh/uv/) — dependency manager; provisions Python and everything in `pyproject.toml`

## 🚀 Setup

1. Set up the environment — this copies `env.example` to `.env`, installs the dependencies and
   sets up the pre-commit hook:
   ```sh
   make local/setup
   ```

2. Adjust the values in `.env`.

3. Run the project:
   ```sh
   make local/start
   ```

## 🛠️ Commands

`make` with no arguments lists every command, straight from the Makefile. The ones you need day
to day are `make tests`, `make lint/check` and `make lint/format`.

## 🧩 Starting a project from this template

1. Rename the project in `pyproject.toml` (`name`, `description`) and in `env.example`
   (`APP_NAME`).
2. Add packages under `src/` and list each one in `[tool.hatch.build.targets.wheel] packages`.
3. Add dependencies with `uv add <package>`, dev tools with `uv add --dev <package>`.
4. Rewrite `CLAUDE.md` and this README for the new project.

## 📚 Documentation

Repo conventions (import paths, file naming, tests) live in [`CLAUDE.md`](./CLAUDE.md). It is
written for coding agents, but it is also the fastest read for a human joining the repo.
