"""Test example."""
from project import summer
from project.config import Config


def test_example():
    """Always true."""
    assert summer(first=1, second=1) == 2


def test_config():
    """Tests configuration."""
    assert Config() is not None
