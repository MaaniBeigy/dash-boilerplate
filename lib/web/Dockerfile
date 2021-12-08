# ------------------------------------- base image ------------------------------------
FROM python:3.9.5-slim
# ------------------------------------- system env ------------------------------------
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH="${PATH}:/root/.poetry/bin"
# --------------------------------- set work directory --------------------------------
WORKDIR /usr/src/app
# ------------------------------------- python env ------------------------------------
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# ---------------------------- install system dependencies ----------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
    && apt-get clean
# ------------------------------ copy the pyproject.toml ------------------------------
COPY pyproject.toml ./

# ----------------------------------- install poetry ----------------------------------
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
# ------------------------------ install python packages ------------------------------
RUN poetry install --no-root
# ---------------------------- create mypy_cache directory ----------------------------
RUN mkdir .mypy_cache
# ----------------- copy the app files to the user source of the image ----------------
COPY . /usr/src/app/
# ------------------------------- static analysis check -------------------------------
RUN poetry run mypy --install-types --non-interactive ./
# ----------------------------------- run unit tests ----------------------------------
RUN poetry run pytest -c pyproject.toml
# --------------------------- generate test coverage report ---------------------------
RUN poetry run pytest --cov-report term --cov project tests
# ------------------------------- check isort code-style ------------------------------
RUN poetry run isort --diff --check-only --settings-path pyproject.toml *.py project/*.py tests/*.py
# ------------------------------- check black code-style ------------------------------
RUN poetry run black --diff --check --config pyproject.toml *.py project/*.py tests/*.py
# -------------------------- check darglint docstring styles --------------------------
RUN poetry run darglint --verbosity 2 project tests
# --------------------------- interrogate docstring coverage --------------------------
RUN poetry run interrogate -v project
# ---------------------------- radon maintainability score ----------------------------
RUN poetry run radon mi project
# ------------------------------- radon complexity score ------------------------------
RUN poetry run radon cc project --total-average
# ------------------------- check issues for saftey and bandit ------------------------
RUN poetry check && \
    poetry run safety check --full-report && \
    poetry run bandit -ll --recursive project tests
