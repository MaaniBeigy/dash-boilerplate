#* Variables
SHELL := /usr/bin/env bash
PYTHON := python

#* Poetry
.PHONY: poetry-download
poetry-download:
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | $(PYTHON) -

.PHONY: poetry-remove
poetry-remove:
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | $(PYTHON) - --uninstall

#* Installation
.PHONY: install
install:
	poetry config virtualenvs.create true && \
	poetry lock -n && poetry export --without-hashes > requirements.txt && \
	poetry install -n && \
	poetry run mypy --install-types --non-interactive lib/web/project


.PHONY: pre-commit-install
pre-commit-install:
	poetry run pre-commit install

#* Formatters
.PHONY: codestyle
codestyle:
	poetry run pyupgrade --exit-zero-even-if-changed --py39-plus **/*.py
	poetry run isort lib/*.py --settings-path pyproject.toml ./
	poetry run black lib/*.py --config pyproject.toml ./

.PHONY: formatting
formatting: codestyle
#* Linting
.PHONY: test
test:
	poetry run pytest -c pyproject.toml

.PHONY: extrabadges
extrabadges:
	$(SHELL) -c 'chmod u+x+r+w .shell/*.sh'
	$(SHELL) -c '. .shell/badges.sh'

.PHONY: complexity
complexity:
	poetry run radon cc lib --total-average

.PHONY: maintainability
maintainability:
	poetry run radon mi lib

.PHONY: interrogate
interrogate:
	poetry run interrogate -v lib

.PHONY: release
release:
	$(SHELL) -c 'chmod u+x+r+w .shell/release.sh; . .shell/release.sh'

.PHONY: coverage
coverage:
	poetry run pytest --cov-report html --cov lib/web/project lib/web/tests
	coverage-badge -o assets/images/coverage.svg -f

.PHONY: check-codestyle
check-codestyle:
	poetry run isort --diff --check-only --settings-path pyproject.toml lib/**/*.py lib/web/*.py tests/*.py
	poetry run black --diff --check --config pyproject.toml lib/**/*.py lib/web/*.py lib/web/tests/*.py
	poetry run darglint --verbosity 2 lib tests

.PHONY: mypy
mypy:
	poetry run mypy --config-file pyproject.toml ./lib/web/project

.PHONY: check-safety
check-safety:
	poetry check
	poetry run safety check --full-report -i 44715 -i 44716 -i 44717
	poetry run bandit -ll --recursive lib/web/project lib/web/tests

.PHONY: lint
lint: test check-codestyle mypy check-safety
