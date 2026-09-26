"""App settings, read from the environment (`.env` in development)."""

from __future__ import annotations

from pydantic_settings import BaseSettings, SettingsConfigDict


class AppConfig(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    app_name: str = "my-python-template"
    log_level: str = "INFO"


def load_config() -> AppConfig:
    return AppConfig()
