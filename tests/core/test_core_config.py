from __future__ import annotations

import pytest

from core.core_config import load_config


def test_load_config_reads_the_environment(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setenv("APP_NAME", "from-env")
    monkeypatch.setenv("LOG_LEVEL", "DEBUG")

    config = load_config()

    assert config.app_name == "from-env"
    assert config.log_level == "DEBUG"
