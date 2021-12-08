"""Application Source Code."""
# ------------------------------ Import Libraries -----------------------------
import dash
import flask
import pandas as pd
import plotly.graph_objs as go
from dash import dcc, html
from dash.dependencies import Input, Output

# ---------------------- configuration of relative paths ----------------------
external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

server = flask.Flask(__name__)  # define flask app.server

app = dash.Dash(
    __name__,
    external_stylesheets=external_stylesheets,
    server=server,  # call flask server
)


def summer(first: int, second: int) -> int:
    """Sums two integers.

    Args:
        first (int): The first integer.
        second (int): The second integer.

    Returns:
        int: from x + y.

    Examples:
        .. code:: python

            >>> summer(1, 3)
            4
    """
    return first + second


df = pd.read_csv(
    "https://gist.githubusercontent.com/chriddyp/"
    + "5d1ea79569ed194d432e56108a04d188/raw/"
    + "a9f9e8076b837d541398e999dcbac2b2826a81f8/"
    + "gdp-life-exp-2007.csv",
)


app.layout = html.Div(
    [
        dcc.Graph(
            id="life-exp-vs-gdp",
            figure={
                "data": [
                    go.Scatter(
                        x=df[df["continent"] == i]["gdp per capita"],
                        y=df[df["continent"] == i]["life expectancy"],
                        text=df[df["continent"] == i]["country"],
                        mode="markers",
                        opacity=0.7,
                        marker={"size": 15, "line": {"width": 0.5, "color": "white"}},
                        name=i,
                    )
                    for i in df.continent.unique()
                ],
                "layout": go.Layout(
                    xaxis={"type": "log", "title": "GDP Per Capita"},
                    yaxis={"title": "Life Expectancy"},
                    margin={"l": 40, "b": 40, "t": 10, "r": 10},
                    legend={"x": 0, "y": 1},
                    hovermode="closest",
                ),
            },
        ),
        html.H6("Change the value in the text box to see callbacks in action!"),
        html.Div(
            ["Input: ", dcc.Input(id="my-input", value="Write here!", type="text")],
        ),
        html.Br(),
        html.Div(id="my-output"),
    ],
)


@app.callback(
    Output(component_id="my-output", component_property="children"),
    Input(component_id="my-input", component_property="value"),
)
def update_output_div(input_value):
    """Returning user input.

    Args:
        input_value: the input of dash.

    Returns:
        string of the output in html.
    """
    return f"{input_value}"
