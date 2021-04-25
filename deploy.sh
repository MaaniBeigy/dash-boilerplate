#!/bin/bash

if [ -d ".venv" ]
then
    . .venv/bin/activate
    python3 -m pip install --upgrade pip
    pip install -r requirements.txt
    pytest --cov=lib --cov-report html
    python3 wsgi.py
else
    python3 -m venv .venv
    . .venv/bin/activate
    python3 -m pip install --upgrade pip
    pip install -r requirements.txt
    pytest --cov=lib --cov-report html
    python3 wsgi.py
fi
