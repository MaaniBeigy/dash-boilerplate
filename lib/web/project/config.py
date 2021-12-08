"""Configuration module."""
import os

basedir = os.path.abspath(os.path.dirname(__file__))


class Config:
    """Getting the path for static file."""

    STATIC_FOLDER = f"{os.getenv('APP_FOLDER')}/project/static"
