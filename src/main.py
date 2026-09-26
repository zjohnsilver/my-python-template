"""Entry point — `make local/start` runs this file."""

from __future__ import annotations

import logging

from core.core_config import load_config

logger = logging.getLogger(__name__)


def build_greeting(app_name: str) -> str:
    return f"{app_name} is running"


def main() -> None:
    config = load_config()
    logging.basicConfig(level=config.log_level)
    logger.info(build_greeting(config.app_name))


if __name__ == "__main__":
    main()
