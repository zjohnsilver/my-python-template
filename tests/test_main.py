from __future__ import annotations

import logging

import pytest

from main import build_greeting, main


def test_build_greeting_names_the_app() -> None:
    assert build_greeting("demo") == "demo is running"


def test_main_logs_the_greeting_from_config(
    monkeypatch: pytest.MonkeyPatch, caplog: pytest.LogCaptureFixture
) -> None:
    monkeypatch.setenv("APP_NAME", "from-env")

    with caplog.at_level(logging.INFO):
        main()

    assert "from-env is running" in caplog.text
