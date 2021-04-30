# Boilerplate for Python Dash Projects

![Python](https://img.shields.io/badge/Python-^3.8-blue.svg?logo=python&longCache=true&logoColor=white&colorB=5e81ac&style=flat-square&colorA=4c566a)
![Flask](https://img.shields.io/badge/Flask-1.1.2-blue.svg?longCache=true&logo=flask&style=flat-square&logoColor=white&colorB=5e81ac&colorA=4c566a)
![Flask-Assets](https://img.shields.io/badge/Flask--Assets-v2.0-blue.svg?longCache=true&logo=flask&style=flat-square&logoColor=white&colorB=5e81ac&colorA=4c566a)
![Pandas](https://img.shields.io/badge/Pandas-v^1.1.5-blue.svg?longCache=true&logo=python&longCache=true&style=flat-square&logoColor=white&colorB=5e81ac&colorA=4c566a)
![Dash](https://img.shields.io/badge/Dash-v1.18.0-blue.svg?longCache=true&logo=python&longCache=true&style=flat-square&logoColor=white&colorB=5e81ac&colorA=4c566a)
![Plotly](https://img.shields.io/badge/Plotly-v4.14.0-blue.svg?longCache=true&logo=python&longCache=true&style=flat-square&logoColor=white&colorB=5e81ac&colorA=4c566a)

## Getting Started

Get set up locally in two steps:

### Environment Variables

Replace the values in **.env.example** with your values and rename this file to **.env**:

* `FLASK_APP`: Entry point of your application; should be `wsgi.py`.
* `FLASK_ENV`: The environment in which to run your application; either `development` or `production`.
* `SECRET_KEY`: Randomly generated string of characters used to encrypt your app's data.
* `ASSETS_DEBUG` *(optional)*: Debug asset creation and bundling in `development`.
* `COMPRESSOR_DEBUG` *(optional)*: Debug asset compression while in `development`.

*Remember never to commit secrets saved in .env files to Gitlab.*

### Installation

Get up and running with `make deploy`:

```shell
git clone https://github.com/MaaniBeigy/dash-boilerplate.git
cd dash-boilerplate
# edit .env.example and save it as .env
make deploy
```

Then, open 0.0.0.0:5050 in your browser.

### Inspired by

[toddbirchard/plotlydash-flask-tutorial](https://github.com/toddbirchard/plotlydash-flask-tutorial).
