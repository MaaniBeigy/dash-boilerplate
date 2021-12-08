#!/bin/bash
find . -name 'docstring.txt' -delete
interrogate -v lib/web/ >>.logs/docstring.txt
poetry run interrogate lib/web/project
