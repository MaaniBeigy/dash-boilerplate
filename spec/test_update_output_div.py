""""Test update user input"""
from lib.app import update_output_div


def test_update_output_div_test():
    """"Test update user input"""
    input_value = 'hello'
    assert update_output_div(input_value) == '{}'.format(input_value)
