#!/bin/bash
find . -name 'coverage.txt' -delete
poetry run pytest --cov-report term --cov lib/web/project/ lib/web/tests/ >>.logs/coverage.txt
