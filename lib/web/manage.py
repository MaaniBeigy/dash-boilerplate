"""Manage module for flask dash app."""
from project import app

application = app.server
if __name__ == "__main__":
    application.run(
        host="0.0.0.0",
        port=5000,
        debug=False,
    )
