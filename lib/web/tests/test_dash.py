"""Tests dash end-to-end app."""
from project import update_output_div


def test_update_output_div_1():
    """Tests the callback of update_output_div."""
    inputs = update_output_div
    result = update_output_div.__wrapped__(inputs)

    assert isinstance(result, str)
